//
//  ExtractLocaleOption.swift
//  swift-date-formatter
//
//  Created by Paolo Prodossimo Lopes on 01/06/22.
//

import Foundation

enum ExtractLocaleOption {
    case brazilian
    case unitedState
    
    var locale: Locale {
        switch self {
        case .brazilian:
            return .init(identifier: "pt-br")
        case .unitedState:
            return .init(identifier: "usa")
        }
    }
}
