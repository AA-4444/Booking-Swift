#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"Alex.Estate-Swift";

/// The "Color1" asset catalog color resource.
static NSString * const ACColorNameColor1 AC_SWIFT_PRIVATE = @"Color1";

/// The "Image1" asset catalog image resource.
static NSString * const ACImageNameImage1 AC_SWIFT_PRIVATE = @"Image1";

/// The "Image2" asset catalog image resource.
static NSString * const ACImageNameImage2 AC_SWIFT_PRIVATE = @"Image2";

/// The "Image3" asset catalog image resource.
static NSString * const ACImageNameImage3 AC_SWIFT_PRIVATE = @"Image3";

/// The "Image4" asset catalog image resource.
static NSString * const ACImageNameImage4 AC_SWIFT_PRIVATE = @"Image4";

/// The "board1" asset catalog image resource.
static NSString * const ACImageNameBoard1 AC_SWIFT_PRIVATE = @"board1";

/// The "board2" asset catalog image resource.
static NSString * const ACImageNameBoard2 AC_SWIFT_PRIVATE = @"board2";

/// The "board3" asset catalog image resource.
static NSString * const ACImageNameBoard3 AC_SWIFT_PRIVATE = @"board3";

/// The "logo" asset catalog image resource.
static NSString * const ACImageNameLogo AC_SWIFT_PRIVATE = @"logo";

/// The "start" asset catalog image resource.
static NSString * const ACImageNameStart AC_SWIFT_PRIVATE = @"start";

#undef AC_SWIFT_PRIVATE
