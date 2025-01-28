import SwiftUI

struct FontInfo {
    var font: String
    var size: CGFloat
}

extension Font {
    enum MMG {
        case Header1
        case Header2
        case Header3
        case subheader1
        case subheader2
        case subheader3
        case subheader4
        case Body1
        case Body2
        case Body3
        case Body4
        case Caption1
        case Caption2
        case Caption3
        
        var value: FontInfo {
            switch self {
            case .Header1:
                return FontInfo(font: "PretendardVariable-SemiBold", size: 36)
                
            case .Header2:
                return FontInfo(font: "PretendardVariable-SemiBold", size: 32)
                
            case .Header3:
                return FontInfo(font: "PretendardVariable-SemiBold", size: 28)

            case .subheader1:
                return FontInfo(font: "PretendardVariable-SemiBold", size: 24)

            case .subheader2:
                return FontInfo(font: "PretendardVariable-Medium", size: 24)

            case .subheader3:
                return FontInfo(font: "PretendardVariable-SemiBold", size: 20)

            case .subheader4:
                return FontInfo(font: "PretendardVariable-SemiBold", size: 16)

            case .Body1:
                return FontInfo(font: "PretendardVariable-Regular", size: 24)

            case .Body2:
                return FontInfo(font: "PretendardVariable-Regular", size: 20)

            case .Body3:
                return FontInfo(font: "PretendardVariable-Regular", size: 16)

            case .Body4:
                return FontInfo(font: "PretendardVariable-Medium", size: 16)

            case .Caption1:
                return FontInfo(font: "PretendardVariable-SemiBold", size: 13)

            case .Caption2:
                return FontInfo(font: "PretendardVariable-Medium", size: 13)

            case .Caption3:
                return FontInfo(font: "PretendardVariable-Regular", size: 13)

            }
        }
        
    }
    
    static func mmg(_ type: MMG) -> Font {
        return .custom(type.value.font, size: type.value.size)
    }
}
