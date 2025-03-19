//
//  FontListView.swift
//  Estate
//
//  Created by Алексей Зарицький on 3/19/25.
//

import SwiftUI
import UIKit

struct FontListView: View {
    var body: some View {
        List {
            ForEach(UIFont.familyNames, id: \.self) { family in
                Section(header: Text(family).font(.headline)) {
                    ForEach(UIFont.fontNames(forFamilyName: family), id: \.self) { name in
                        Text(name).font(.custom(name, size: 20))
                    }
                }
            }
        }
    }
}

#Preview {
    FontListView()
}
