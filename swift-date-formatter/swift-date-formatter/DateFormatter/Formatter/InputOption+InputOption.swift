//
//  InputOption+InputOption.swift
//  swift-date-formatter
//
//  Created by Paolo Prodossimo Lopes on 01/06/22.
//

extension ExtractDateFormatter {
    enum InputOption {
        
        //MARK: - Cases
        case raw(String)
        case defaults(ExtractFormatBuilder.DefaultOption)
        case formatter([ExtractFormatBuilder.Format])
        
        //MARK: - Computed
        var format: String {
            switch self {
            case .raw(let format): return format
            case .defaults(let option): return build(option.formats)
            case .formatter(let formats): return build(formats)
            }
        }
        
        //MARK: - Helpers
        private func build(_ options: [ExtractFormatBuilder.Format]) -> String {
            ExtractFormatBuilder.shared.build(options)
        }
        
    }
}
