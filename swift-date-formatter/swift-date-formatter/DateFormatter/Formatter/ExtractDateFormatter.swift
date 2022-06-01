//
//  ExtractDateFormatter.swift
//  swift-date-formatter
//
//  Created by Paolo Prodossimo Lopes on 01/06/22.
//

import Foundation

struct ExtractDateFormatter {
    
    //MARK: - Properties
    static var shared: Self = .init()
    
    //MARK: - Constructor
    private init() { /*Singleton*/ }
    
    //MARK: - Method
    func format(config: Configuration) -> String {
        guard let date = format(input: config.rawDate, fromFormat: config.from) else {
            return "Date is invalid"
        }
        
        return format(date: date, toFormat: config.to)
    }
    
    func format(date: Date, toFormat: Configuration.DateConfig) -> String {
        let toDateFormatter = toFormatter(toFormat)
        return toDateFormatter.string(from: date)
    }
    
    func format(input: String, fromFormat: Configuration.DateConfig) -> Date? {
        let fromDateFormatter = fromFormatter(fromFormat)
        return fromDateFormatter.date(from: input)
    }
    
    //MARK: - Helpers
    private func fromFormatter(_ config: Configuration.DateConfig) -> DateFormatter {
        let from = DateFormatter()
        from.dateFormat = config.dateFormat.format
        from.locale = config.localeOption.locale
        return from
    }
    
    private func toFormatter(_ config: Configuration.DateConfig) -> DateFormatter {
        let to = DateFormatter()
        to.dateFormat = config.dateFormat.format
        to.locale = config.localeOption.locale
        return to
    }
}
