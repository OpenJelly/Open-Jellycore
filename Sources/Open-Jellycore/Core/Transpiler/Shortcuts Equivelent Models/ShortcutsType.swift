//
//  ShortcutsType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

enum ShortcutsType: String {
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
    case richtext = "WFRichTextContentItem"
    case webpage = "WFSafariWebPageContentItem"
    case text = "WFStringContentItem"
    case url = "WFURLContentItem"
    case vcard = "WFVCardContentItem"
}

enum ConditionalType: String {
    case string = "WFConditionalActionString"
    case number = "WFNumberValue"
}
