//
//  ImageFormatEnum.swift
//  opal-ios
//
//  Created by Cynara Costa on 24/03/25.
//

enum ImageFormat: String {
    case png
    case jpeg
    case jpg 

    var fileExtension: String {
        switch self {
        case .png:
            return "png"
        case .jpeg, .jpg:
            return "jpeg"
        }
    }

    var mimeType: String {
        switch self {
        case .png:
            return "image/png"
        case .jpeg, .jpg:
            return "image/jpeg"
        }
    }
}
