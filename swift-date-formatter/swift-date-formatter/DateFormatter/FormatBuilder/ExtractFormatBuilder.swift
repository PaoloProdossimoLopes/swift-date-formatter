//
//  ExtractFormatBuilder.swift
//  swift-date-formatter
//
//  Created by Paolo Prodossimo Lopes on 01/06/22.
//

import Foundation

struct ExtractFormatBuilder {
    
    static let shared: Self = .init()
    
    func build(_ format: [Format]) -> String {
        var formatted: String = .init()
        
        format.forEach { format in
            switch format {
            case .day(let day):
                formatted.append(day.rawValue)
            case .month(let month):
                formatted.append(month.rawValue)
            case .year(let year):
                formatted.append(year.rawValue)
            case .hour(let hour):
                formatted.append(hour.rawValue)
            case .minute(let minute):
                formatted.append(minute.rawValue)
            case .second(let sencond):
                formatted.append(sencond.rawValue)
            case .separator(let separator):
                formatted.append(separator.rawValue)
            case .custom(let text):
                formatted.append(text)
            }
        }
        
        return formatted
    }
}
