//
//  ExtractDateFormatter+Configuration.swift
//  swift-date-formatter
//
//  Created by Paolo Prodossimo Lopes on 01/06/22.
//

extension ExtractDateFormatter {
    struct Configuration {
        let rawDate: String
        let from: DateConfig
        let to: DateConfig
    }
}

extension ExtractDateFormatter.Configuration {
    struct DateConfig {
        var localeOption: ExtractLocaleOption = .brazilian
        var dateFormat: ExtractDateFormatter.InputOption = .defaults(.abreviate(.standart))
    }
}
