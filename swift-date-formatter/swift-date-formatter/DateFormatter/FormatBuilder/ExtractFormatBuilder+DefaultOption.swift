//
//  ExtractFormatBuilder+DefaultOption.swift
//  swift-date-formatter
//
//  Created by Paolo Prodossimo Lopes on 01/06/22.
//

import Foundation

fileprivate typealias Format = ExtractFormatBuilder.Format

extension ExtractFormatBuilder {
    enum DefaultOption {
        
        case fragment(DateFragment)
        case abreviate(Abreviate)
        case described(Decribed)
        
        //MARK: - Computed
        var formats: [Format] {
            switch self {
            case .fragment(let dateFragment):
                return dateFragment.fragmentFormat
            case .abreviate(let abreviate):
                return abreviate.format
            case .described(let decribed):
                return decribed.format
            }
        }
    }
}

extension ExtractFormatBuilder.DefaultOption {
    enum DateFragment {
        case day
        case dayDescribed
        case daySemiDescribed
        
        case month
        case monthDescribed
        case monthSemiDescribed
        
        case year
        case yearAbreviate
        
        var fragmentFormat: [ExtractFormatBuilder.Format] {
            switch self {
            case .day: return [.day(.abreviate)]
            case .dayDescribed: return [.day(.completed)]
            case .daySemiDescribed: return [.day(.incompleted)]
                
            case .month: return [.month(.abreviate)]
            case .monthDescribed: return [.month(.completed)]
            case .monthSemiDescribed: return [.month(.incompleted)]
                
            case .year: return [.year(.completed)]
            case .yearAbreviate: return [.year(.abreviate)]
            }
        }
    }
    
    enum Decribed {
        //Format: EEEE, dd MMMM yyyy
        case complete
        //Format: EEE, dd
        case abreviate
        //Format: EEEE, dd MMMM
        case semiAbreviate
        
        var format: [ExtractFormatBuilder.Format] {
            let dayDescribed: Format = .day(.completed)
            let day: Format = .day(.abreviate)
            let month: Format = .month(.completed)
            let comma: Format = .separator(.comma)
            let space: Format = .separator(.space)
            
            switch self {
            case .complete:
                let year: Format = .year(.completed)
                return [dayDescribed, comma, space, day, space, month, space, year]
            case .abreviate:
                return [dayDescribed, comma, space, day]
            case .semiAbreviate:
                return [dayDescribed, comma, space, day, space, month]
            }
        }
    }
    
    enum Abreviate {
        //Format: dd/MM/yyyy
        case standart
        //Format: yyyy/MM/dd
        case inverted
        //Format: MM/dd/yyyy
        case intercambiate
        
        var format: [ExtractFormatBuilder.Format] {
            let day: Format = .day(.abreviate)
            let month: Format = .month(.abreviate)
            let year: Format = .year(.completed)
            let separator: Format = .separator(.slash)
            
            switch self {
            case .standart: return [day, separator, month, separator, year]
            case .inverted: return [year, separator, month, separator, day]
            case .intercambiate: return [month, separator, day, separator, year]
            }
        }
    }
}

//MARK: - Helper
private extension ExtractFormatBuilder.DefaultOption {
    
    func makeCompleted() -> [Format] {
        let day: Format = .day(.abreviate)
        let month: Format = .month(.abreviate)
        let year: Format = .year(.completed)
        let separator: Format = .separator(.slash)
        return [day, separator, month, separator, year]
    }
    
    func makeAbreviate() -> [Format] {
        return [.day(.completed)]
    }
    
    func makeInverted() -> [Format] {
        let day: Format = .day(.abreviate)
        let month: Format = .month(.abreviate)
        let year: Format = .year(.completed)
        let separator: Format = .separator(.dash)
        return [year, separator, month, separator, day]
    }
}
