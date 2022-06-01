//
//  ExtractFormatBuilder+Format.swift
//  swift-date-formatter
//
//  Created by Paolo Prodossimo Lopes on 01/06/22.
//

import Foundation

extension ExtractFormatBuilder {
    enum Format {
        case day(DateOption.Day)
        case month(DateOption.Month)
        case year(DateOption.Year)
        
        case hour(TimeOption.Hour = .standart)
        case minute(TimeOption.Minute = .standart)
        case second(TimeOption.Second = .standart)
        
        case separator(Separator)
        case custom(String)
    }
}

extension ExtractFormatBuilder.Format {
    enum DateOption {
        enum Day: String {
            case completed = "EEEE"
            case incompleted = "EEE"
            case abreviate = "dd"
        }
        
        enum Month: String {
            case completed = "MMMM"
            case incompleted = "MMM"
            case abreviate = "MM"
        }
        
        enum Year: String {
            case completed = "yyyy"
            case abreviate = "yy"
        }
    }
    
    enum TimeOption {
        enum Hour: String {
            case standart = "hh"
        }
        
        enum Minute: String {
            case standart = "mm"
        }
        
        enum Second: String {
            case standart = "ss"
        }
    }
    
    enum Separator: String {
        case dash = "-"
        case slash = "/"
        case twiceDots = ":"
        case dot = "."
        case comma = ","
        case space = " "
        case none = ""
    }
}
