//
//  Aggrandizement.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 11/2/22.
//

/// Represents the three types of aggrandizements that shortcuts supports.
enum Aggrandizement: Codable {
    case get(property: String)
    case `as`(typeCast: TypeCoercion)
    case key(key: String)
    
    /// Encode the aggrandizement to it's shortcut equivalent PLIST entries
    /// - Parameter encoder: the encoder to encode too
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .get(let property):
            try container.encode(QuantumValue([
                "PropertyName": property,
                "Type": "WFPropertyVariableAggrandizement"
            ]))
        case .as(let typeCast):
            try container.encode(QuantumValue([
                "CoercionItemClass": typeCast.rawValue,
                "Type": "WFCoercionVariableAggrandizement"
            ]))
        case .key(let key):
            try container.encode(QuantumValue([
                "DictionaryKey": key,
                "Type": "WFDictionaryValueVariableAggrandizement"
            ]))
        }
    }
}

/// Represents all of the possible shortcuts type coercions.
enum TypeCoercion: String, CaseIterable, Codable {
    case appstore = "WFAppStoreAppContentItem"
    case article = "WFArticleContentItem"
    case boolean = "WFBooleanContentItem"
    case contact = "WFContactContentItem"
    case date = "WFDateContentItem"
    case dictionary = "WFDictionaryContentItem"
    case email = "WFEmailAddressContentItem"
    case file = "WFGenericFileContentItem"
    case image = "WFImageContentItem"
    case imedia = "WFMPMediaContentItem"
    case iproduct = "WFiTunesProductContentItem"
    case location = "WFLocationContentItem"
    case maplink = "WFDCMapsLinkContentItem"
    case media = "WFAVAssetContentItem"
    case number = "WFNumberContentItem"
    case pdf = "WFPDFContentItem"
    case phonenumber = "WFPhoneNumberContentItem"
    case photo = "WFPhotoMediaContentItem"
    case place = "WFMKMapItemContentItem"
    case richText = "WFRichTextContentItem"
    case webpage = "WFSafariWebPageContentItem"
    case url = "WFURLContentItem"
    case vcard = "WFVCardContentItem"
    case string = "WFStringContentItem"
    
    /// An optional initializer that will create itself based on the provided Jelly human readable version of the type coercion.
    /// If the human readable version provided does not match any of the possible coercions this will return nil.
    /// - Parameter value: The human readable version of the type coercion
    init?(value: String) {
        print("Type Coercion \(value) \(value.lowercased())")
        switch value.lowercased() {
        case "appstore":
            self = .appstore
        case "article":
            self = .article
        case "boolean":
            self = .boolean
        case "contact":
            self = .contact
        case "date":
            self = .date
        case "dictionary":
            self = .dictionary
        case "email":
            self = .email
        case "file":
            self = .file
        case "image":
            self = .image
        case "imedia":
            self = .imedia
        case "iproduct":
            self = .iproduct
        case "location":
            self = .location
        case "maplink":
            self = .maplink
        case "media":
            self = .media
        case "number":
            self = .number
        case "pdf":
            self = .pdf
        case "phonenumber":
            self = .phonenumber
        case "photo":
            self = .photo
        case "place":
            self = .place
        case "richtext":
            self = .richText
        case "webpage":
            self = .webpage
        case "url":
            self = .url
        case "vcard":
            self = .vcard
        case "string":
            self = .string
        case "text":
            self = .string
        default:
            return nil
        }
    }
    
    /// The text name for the Coercion type used for code generation.
    var textName: String {
        switch self {
        case .appstore:
            return "Appstore"
        case .article:
            return "Article"
        case .boolean:
            return "Boolean"
        case .contact:
            return "Contact"
        case .date:
            return "Date"
        case .dictionary:
            return "Dictionary"
        case .email:
            return "Email"
        case .file:
            return "File"
        case .image:
            return "Image"
        case .imedia:
            return "iMedia"
        case .iproduct:
            return "iProduct"
        case .location:
            return "Location"
        case .maplink:
            return "MapLink"
        case .media:
            return "Media"
        case .number:
            return "Number"
        case .pdf:
            return "PDF"
        case .phonenumber:
            return "PhoneNumber"
        case .photo:
            return "Photo"
        case .place:
            return "Place"
        case .richText:
            return "RichText"
        case .webpage:
            return "WebPage"
        case .url:
            return "URL"
        case .vcard:
            return "vCard"
        case .string:
            return "String"
        }
    }
    
    /// Encodes the Type coercion based on it's rawValue
    /// - Parameter encoder: The encoder to encode into.
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.rawValue)
    }
}
