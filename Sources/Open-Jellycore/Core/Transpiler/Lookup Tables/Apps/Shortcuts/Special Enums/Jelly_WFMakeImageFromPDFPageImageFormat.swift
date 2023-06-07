//
//  Jelly_WFMakeImageFromPDFPageImageFormat.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

enum Jelly_WFMakeImageFromPDFPageImageFormat: String, JellyEnum, Codable {
    case PNG
    case JPEG
    case GIF
    case TIFF
    case JPEG2000
    case ATX
    case KTXTextures
    case ASTCTextures
    case DDSTextures
    case HEIF
    case HEIFSequence
    case WindowsIcon
    case WindowsBMP
    case AppleIcon
    case PhotoshopDocument
    case PDF
    case TGA
    case OpenEXR
    case PortableBitmapFormat
    case PVRTCTextures
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    init?(parameterItem: FunctionCallParameterItem, scopedVariables: [Variable]) {
        if let itemContent = parameterItem.item?.content {
            self.init(rawValue: itemContent)
        } else {
            self.init(rawValue: parameterItem.content)
        }
    }

    var value: String {
        switch self {
        case .PNG:
            return "public.png"
        case .JPEG:
            return "public.jpeg"
        case .GIF:
            return "com.compuserve.gif"
        case .TIFF:
            return "public.tiff"
        case .JPEG2000:
            return "public.jpeg-2000"
        case .ATX:
            return "com.apple.atx"
        case .KTXTextures:
            return "org.khronos.ktx"
        case .ASTCTextures:
            return "org.khronos.astc"
        case .DDSTextures:
            return "com.microsoft.dds"
        case .HEIF:
            return "public.heic"
        case .HEIFSequence:
            return "public.heic"
        case .WindowsIcon:
            return "com.microsoft.ico"
        case .WindowsBMP:
            return "com.microsoft.bmp"
        case .AppleIcon:
            return "com.apple.icns"
        case .PhotoshopDocument:
            return "com.adobe.photoshop-image"
        case .PDF:
            return "com.adobe.pdf"
        case .TGA:
            return "com.truevision.tga-image"
        case .OpenEXR:
            return "com.ilm.openexr-image"
        case .PortableBitmapFormat:
            return "public.pbm"
        case .PVRTCTextures:
            return "public.pvr"
        }
    }
}

extension Jelly_WFMakeImageFromPDFPageImageFormat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
