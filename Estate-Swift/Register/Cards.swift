//
//  Cards.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/31/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import RiveRuntime

struct CardInfo: Identifiable {
    let id = UUID()
    let cardNumber: String
    let cardHolderName: String
    let cvvCode: String
    let expireDate: String
    let selectedCard: String
}

struct Cards: View {
    @Binding var path: NavigationPath
    @FocusState private var activeTF: ActiveKeyboardField!
    @State private var cardNumber: String = ""
    @State private var cardHolderName: String = ""
    @State private var cvvCode: String = ""
    @State private var expireDate: String = ""
    @State private var selectedCard: String = "Card1"
    @State private var isCardSelectionVisible: Bool = false
    @State private var isCardAdded: Bool = false
    @State private var showCardList: Bool = false
    @State private var cards: [CardInfo] = [] // Store multiple cards
    @State private var editingCard: CardInfo? // Track the card being edited
    let testbutton = RiveViewModel(fileName: "testbutton", autoPlay: false)
    
    var body: some View {
    
            VStack {
                //MARK: Header View
                HStack {
                    HStack {
                        Text("Add")
                            .font(.custom("Lato-Regular", size: 25))
                            .padding(.leading, 10)
                            .foregroundColor(Color.black)
                        
                        Text("Card")
                            .font(.custom("Lato-Black", size: 25))
                            .foregroundColor(Color("Color2"))
                    }

                    Spacer(minLength: 0)
                    
                    Button {
                        activeTF = .cardNumber
                        cardNumber = ""
                        expireDate = ""
                        cvvCode = ""
                        cardHolderName = ""
                        selectedCard = "Card1"
                        isCardAdded = false
                        editingCard = nil
                        showCardList = false
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.title2)
                            .foregroundColor(.black)
                            .frame(width: 54, height: 54)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                    }
                }
                
              //  Spacer().frame(height: -20)
                
                //MARK: Card List
                CardInputView()
                
                //MARK:  Card Selection View
                if !showCardList {
                    VStack(spacing: 15) {
                        Button(action: {
                            isCardSelectionVisible.toggle()
                        }) {
                            Text("Choose Card")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 37)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                        }
                        .padding(.top,10)
                        
                        if isCardSelectionVisible {
                            HStack(spacing: 10) {
                                ForEach(["Card1", "Card2", "Card3", "Card4", "Card5" ], id: \.self) { card in
                                    Button(action: {
                                        selectedCard = card
                                        isCardSelectionVisible = false
                                    }) {
                                        Image(card)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 30)
                                            .padding(5)
                                            .background(selectedCard == card ? Color.gray.opacity(0.3) : Color.clear)
                                            .cornerRadius(5)
                                    }
                                }
                            }
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.top, 15)
                }
                
                //Cards Button
                if !showCardList {
                    Button(action: {
                        print("Toggling card list view. Current cards count: \(cards.count)")
                        cards.forEach { card in
                            print("Card: \(card.cardNumber), Holder: \(card.cardHolderName), ID: \(card.id)")
                        }
                        showCardList.toggle()
                    }) {
                        HStack {
                            Text("View Cards (\(cards.count))")
                                .font(.custom("Lato-Black", size: 16))
                                .foregroundColor(.white)
                            
                            Image(systemName: "wallet.bifold")
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(Color("Color2"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)

                    }
                    .padding(.top, 10)
                }
                
                Spacer(minLength: 0)
                

            }
            .padding()
            .padding(.bottom,20)
        
        
        
        Button {
            if isFormValid {
                if let editingCard = editingCard {
                    // Update the existing card
                    if let index = cards.firstIndex(where: { $0.id == editingCard.id }) {
                        cards[index] = CardInfo(
                            cardNumber: cardNumber,
                            cardHolderName: cardHolderName,
                            cvvCode: cvvCode,
                            expireDate: expireDate,
                            selectedCard: selectedCard
                        )
                        print("Updated card at index \(index). New card count: \(cards.count)")
                    }
                } else {
                    // Add a new card
                    let newCard = CardInfo(
                        cardNumber: cardNumber,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        expireDate: expireDate,
                        selectedCard: selectedCard
                    )
                    cards.append(newCard)
                    print("Added new card: \(newCard.cardNumber), ID: \(newCard.id). Total cards: \(cards.count)")
                }
                isCardAdded = true
                // Reset form
                cardNumber = ""
                cardHolderName = ""
                cvvCode = ""
                expireDate = ""
                selectedCard = "Card1"
                editingCard = nil
            }
        } label: {
            Label(editingCard == nil ? "Add Card" : "Update Card", systemImage: "lock")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.vertical, 20)
                .frame(maxWidth: 300)
        }
        .background(Color("Color2"))
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
        .padding(.bottom,10)
        // Disabling Action Until All Details are Filled
        .disableWithOpacity(!isFormValid || showCardList) // Disable when showing card list
         
                    Button(action: {
                        if isCardAdded {
                            // Proceed to next field
                            switch activeTF {
                            case .cardNumber:
                                activeTF = .expirationDate
                            case .expirationDate:
                                activeTF = .cvv
                            case .cvv:
                                activeTF = .cardHolderName
                            default:
                                break
                            }
                        } else {
                            // Setup Later action (dismiss keyboard)
                            activeTF = nil
                        }
                    }) {
                        Text(isCardAdded ? "Next" : "Setup Later")
                            .font(.custom("Lato-Black", size: 16))
                            .foregroundColor(.black)
                            .padding(.vertical, 20)
                            .frame(width: 300)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                    .padding(.bottom,5)
                
                    .navigationBarBackButtonHidden(true)
    }
    
    //MARK:  Check if card fields are filled
    private var isFormValid: Bool {
        return cardNumber.count == 19 && expireDate.count == 5 && !cardHolderName.isEmpty && cvvCode.count == 3
    }
    
    private var isCardFilled: Bool {
        return !cardNumber.isEmpty || !expireDate.isEmpty || !cvvCode.isEmpty || !cardHolderName.isEmpty
    }
    
    //MARK:  Card Input View
    @ViewBuilder
    func CardInputView() -> some View {
        if showCardList {
           
            ZStack {
             
                
                VStack {
                    Text("Your Cards")
                        .font(.custom("Lato-Black", size: 20))
                        .foregroundColor(.black)
                        .padding(.top, 20)
                    
                    ScrollView {
                        if cards.isEmpty {
                            Text("No cards added yet.")
                                .font(.custom("Lato-Regular", size: 16))
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            ForEach(cards, id: \.id) { card in
                                VStack(spacing: 10) {
                                    HStack {
                                        Image(card.selectedCard)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 40)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Card Number: \(card.cardNumber)")
                                                .font(.custom("Lato-Regular", size: 14))
                                            Text("Holder: \(card.cardHolderName)")
                                                .font(.custom("Lato-Regular", size: 14))
                                            Text("Expires: \(card.expireDate)")
                                                .font(.custom("Lato-Regular", size: 14))
                                            Text("CVV: \(card.cvvCode)")
                                                .font(.custom("Lato-Regular", size: 14))
                                        }
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(10)
                                    
                                   
                                    HStack(spacing: 10) {
                                        Button(action: {
                                            // Manage action
                                            print("Manage card: \(card.cardNumber)")
                                        }) {
                                            Text("Manage")
                                                .font(.system(size: 12, weight: .semibold))
                                                .foregroundColor(.white)
                                                .padding(.vertical, 6)
                                                .padding(.horizontal, 12)
                                                .background(Color.blue)
                                                .cornerRadius(8)
                                        }
                                        
                                        Button(action: {
                                            // Edit action
                                            cardNumber = card.cardNumber
                                            cardHolderName = card.cardHolderName
                                            cvvCode = card.cvvCode
                                            expireDate = card.expireDate
                                            selectedCard = card.selectedCard
                                            editingCard = card
                                            showCardList = false
                                            activeTF = .cardNumber
                                        }) {
                                            Text("Edit")
                                                .font(.system(size: 12, weight: .semibold))
                                                .foregroundColor(.white)
                                                .padding(.vertical, 6)
                                                .padding(.horizontal, 12)
                                                .background(Color.green)
                                                .cornerRadius(8)
                                        }
                                        
                                        Button(action: {
                                            // Remove action
                                            cards.removeAll { $0.id == card.id }
                                            if cards.isEmpty {
                                                isCardAdded = false
                                            }
                                            print("Removed card: \(card.cardNumber), ID: \(card.id). New card count: \(cards.count)")
                                        }) {
                                            Text("Remove")
                                                .font(.system(size: 12, weight: .semibold))
                                                .foregroundColor(.white)
                                                .padding(.vertical, 6)
                                                .padding(.horizontal, 12)
                                                .background(Color.red)
                                                .cornerRadius(8)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .onAppear {
                                    print("Rendering card in list: \(card.cardNumber), ID: \(card.id)")
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 400)
                    
                    Button(action: {
                        showCardList = false
                    }) {
                        Text("Close")
                            .font(.custom("Lato-Black", size: 16))
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .frame(maxWidth: 300)
                            .background(Color("Color2"))
                            .cornerRadius(15)
                    }
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
                .padding(.horizontal, 20)
                .padding(.top,40)
            }
        } else {
            
            ZStack {
                Image(selectedCard)
                    .resizable()
                    .frame(width: DeviceHelper.adaptivePadding(
                        small: 360,
                        medium: 360,
                        pro: 360,
                        proMax: 400
                    ), height: 230)
                
                //MARK: Card Details...
                VStack(spacing: 10) {
                    HStack {
                        TextField("XXXX XXXX XXXX XXXX", text: $cardNumber)
                            .font(.title3)
                            .keyboardType(.numberPad)
                            .focused($activeTF, equals: .cardNumber)
                            .customOnChange(value: cardNumber) { value in
                                cardNumber = ""
                                
                                // Space For Every 4 Digits
                                let startIndex = value.startIndex
                                for index in 0..<value.count {
                                    let stringIndex = value.index(startIndex, offsetBy: index)
                                    cardNumber += String(value[stringIndex])
                                    
                                    if (index + 1) % 5 == 0 && value[stringIndex] != " " {
                                        cardNumber.insert(" ", at: stringIndex)
                                    }
                                }
                                
                                // Removing Empty Space When Going Back
                                if value.last == " " {
                                    cardNumber.removeLast()
                                }
                                
                                // Limiting To 16 Digits (Including 3 Spaces: 16 + 3 = 19)
                                cardNumber = String(cardNumber.prefix(19))
                            }
                    }
                    .padding(.top, 50)
                    
                    HStack(spacing: 8) {
                        TextField("MM/YY", text: $expireDate)
                            .keyboardType(.numberPad)
                            .focused($activeTF, equals: .expirationDate)
                            .customOnChange(value: expireDate) { value in
                                expireDate = value
                                // Inserting a slash in the third string position
                                if value.count == 3 && !value.contains("/") {
                                    let startIndex = value.startIndex
                                    let thirdPosition = value.index(startIndex, offsetBy: 2)
                                    expireDate.insert("/", at: thirdPosition)
                                }
                                
                               
                                if value.last == "/" {
                                    expireDate.removeLast()
                                }
                                
                                // Limiting String (4 + 1 = 5)
                                expireDate = String(expireDate.prefix(5))
                            }
                        
                        Spacer(minLength: 0)
                        
                        TextField("CVV", text: $cvvCode)
                            .frame(width: 35)
                            .focused($activeTF, equals: .cvv)
                            .keyboardType(.numberPad)
                            .customOnChange(value: cvvCode) { value in
                                cvvCode = value
                                // Limit to Max 3 Digits...
                                cvvCode = String(cvvCode.prefix(3))
                            }
                        
                        Image(systemName: "questionmark.circle.fill")
                    }
                    .padding(.top, 15)
                    
                    Spacer(minLength: 0)
                    
                    TextField("CARD HOLDER NAME", text: $cardHolderName)
                        .focused($activeTF, equals: .cardHolderName)
                        .submitLabel(.done)
                }
                .padding(20)
                .environment(\.colorScheme, .dark)
                .tint(.white)
            }
            .frame(height: 200)
            .padding(.top, 35)
        }
    }
}

#Preview {
        Cards(path: .constant(NavigationPath()))
    }


//MARK:  Disable With Opacity Extension
extension View {
    @ViewBuilder
    func disableWithOpacity(_ status: Bool) -> some View {
        self
            .disabled(status)
            .opacity(status ? 0.6 : 1)
    }
    
    @ViewBuilder
    func customOnChange<Value: Equatable>(value: Value, result: @escaping (Value) -> ()) -> some View {
        if #available(iOS 17, *) {
            self
                .onChange(of: value) { oldValue, newValue in
                    result(newValue)
                }
        } else {
            self
                .onChange(of: value, perform: { value in
                    result(value)
                })
        }
    }
}

enum ActiveKeyboardField {
    case cardNumber
    case expirationDate
    case cvv
    case cardHolderName
}
