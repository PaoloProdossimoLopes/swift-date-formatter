//
//  ExtractDateFormatterTests.swift
//  swift-date-formatterTests
//
//  Created by Paolo Prodossimo Lopes on 01/06/22.
//

import XCTest
@testable import swift_date_formatter

final class ExtractDateFormatterTests: XCTestCase {
    
    var sut: ExtractDateFormatter = .shared
    
    func test_ExtractDateFormatter_format_whenConfigSetBrazilanFormat_shoudlBeEqual() {
        let config = makeConfig()
        XCTAssertEqual(sut.format(config: config), "23/03/2000")
    }
    
    func test_ExtractDateFormatter_format_ConfigSetDefault_ShouldReteturnIntercambiateFormat() {
        let config = makeConfig(toFormat: .defaults(.abreviate(.intercambiate)))
        XCTAssertEqual(sut.format(config: config), "03/23/2000")
    }
    
    func test_ExtractDateFormatter_format_ConfigSetDefault_ShouldReteturnFragmentDayFormat() {
        let config = makeConfig(toFormat: .defaults(.fragment(.day)))
        XCTAssertEqual(sut.format(config: config), "23")
    }
    
    func test_ExtractDateFormatter_format_ConfigSetDefault_ShouldReteturnFragmentDayDescribedFormat() {
        let config = makeConfig(toFormat: .defaults(.fragment(.dayDescribed)))
        XCTAssertEqual(sut.format(config: config), "quinta-feira")
    }
    
    func test_ExtractDateFormatter_format_ConfigSetDefault_ShouldReteturnFragmentDaySemiDescribedFormat() {
        let config = makeConfig(toFormat: .defaults(.fragment(.daySemiDescribed)))
        XCTAssertEqual(sut.format(config: config), "qui.")
    }
    
    func test_ExtractDateFormatter_format_ConfigSetDefault_ShouldReteturnFragmentMonthFormat() {
        let config = makeConfig(toFormat: .defaults(.fragment(.month)))
        XCTAssertEqual(sut.format(config: config), "03")
    }
    
    func test_ExtractDateFormatter_format_ConfigSetDefault_ShouldReteturnFragmentMonthDescribedFormat() {
        let config = makeConfig(toFormat: .defaults(.fragment(.monthDescribed)))
        XCTAssertEqual(sut.format(config: config), "março")
    }
    
    func test_ExtractDateFormatter_format_ConfigSetDefaultWithAmericanLocale_ShouldReteturnFragmentMonthDescribedFormat() {
        let config = makeConfig(
            toLocale: .unitedState,
            toFormat: .defaults(.fragment(.monthDescribed)))
        XCTAssertEqual(sut.format(config: config), "March")
    }
    
    func test_ExtractDateFormatter_format_ConfigSetDefault_ShouldReteturnFragmentMonthSemiDescribedFormat() {
        let config = makeConfig(toFormat: .defaults(.fragment(.monthSemiDescribed)))
        XCTAssertEqual(sut.format(config: config), "mar.")
    }
    
    func test_ExtractDateFormatter_format_ConfigSetDefaultWithAmericanLocale_FragmentMonthSemiDescribedFormat() {
        let config = makeConfig(
            toLocale: .unitedState,
            toFormat: .defaults(.fragment(.monthSemiDescribed))
        )
        XCTAssertEqual(sut.format(config: config), "Mar")
    }
    
    func test_ExtractDateFormatter_format_WhenFormatIsDefaultDescribed_ShouldReturnCompleteFormat() {
        let config = makeConfig(toFormat: .defaults(.described(.complete)))
        XCTAssertEqual(sut.format(config: config), "quinta-feira, 23 março 2000")
    }
    
    func test_ExtractDateFormatter_format_WhenFormatIsDefaultDescribed_ShouldReturnAbreviateFormat() {
        let config = makeConfig(toFormat: .defaults(.described(.abreviate)))
        XCTAssertEqual(sut.format(config: config), "quinta-feira, 23")
    }
    
    func test_ExtractDateFormatter_format_WhenFormatIsDefaultDescribed_ShouldSemiAbreviateFormat() {
        let config = makeConfig(toFormat: .defaults(.described(.semiAbreviate)))
        XCTAssertEqual(sut.format(config: config), "quinta-feira, 23 março")
    }
    
    func test_ExtractDateFormatter_format_WhenFormatIsDefaultFragment_ShouldYearFormat() {
        let config = makeConfig(toFormat: .defaults(.fragment(.year)))
        XCTAssertEqual(sut.format(config: config), "2000")
    }
    
    func test_ExtractDateFormatter_format_WhenFormatIsDefaultFragment_ShouldYearAbreviateFormat() {
        let config = makeConfig(toFormat: .defaults(.fragment(.yearAbreviate)))
        XCTAssertEqual(sut.format(config: config), "00")
    }
    
    func test_ExtractDateFormatter_format_WhenToFormatIsRaw_ShouldBeEqualToInputed() {
        let config = makeConfig(toFormat: .raw("EEEE, dd yyyy"))
        XCTAssertEqual(sut.format(config: config), "quinta-feira, 23 2000")
    }
    
    func test_ExtractDateFormatter_format_WhenTimeInput_ShouldBeOnlyHour() {
        let config = makeConfig(
            input: "10:20:50",
            fromLocale: .brazilian, fromFormat: .raw("hh:mm:ss"),
            toLocale: .brazilian, toFormat: .formatter([.hour(.standart)])
        )
        XCTAssertEqual(sut.format(config: config), "10")
    }
    
    func test_ExtractDateFormatter_format_WhenTimeInput_ShouldBeOnlySecond() {
        let config = makeConfig(
            input: "10:20:50",
            fromLocale: .brazilian, fromFormat: .raw("hh:mm:ss"),
            toLocale: .brazilian, toFormat: .formatter([.second(.standart)])
        )
        XCTAssertEqual(sut.format(config: config), "50")
    }
    
    func test_ExtractDateFormatter_format_WhenTimeInput_ShouldBeOnlyMinute() {
        let config = makeConfig(
            input: "10:20:50",
            fromLocale: .brazilian, fromFormat: .raw("hh:mm:ss"),
            toLocale: .brazilian, toFormat: .formatter([.minute(.standart)])
        )
        XCTAssertEqual(sut.format(config: config), "20")
    }
    
    func test_ExtractDateFormatter_format_WhenTimeInputed_shouldBeMixOfOptionsExpected() {
        let config = makeConfig(
            input: "10:20:50",
            fromLocale: .brazilian, fromFormat: .raw("hh:mm:ss"),
            toLocale: .brazilian, toFormat: .formatter([
                .hour(), .separator(.dash), .minute(), .separator(.space), .second()
            ])
        )
        XCTAssertEqual(sut.format(config: config), "10-20 50")
    }
}

//MARK: - Helper
private extension ExtractDateFormatterTests {
    func makeConfig(
        input: String = "2000-03-23",
        fromLocale: ExtractLocaleOption = .brazilian,
        fromFormat: ExtractDateFormatter.InputOption = .defaults(.abreviate(.inverted)),
        toLocale: ExtractLocaleOption = .brazilian,
        toFormat: ExtractDateFormatter.InputOption = .defaults(.abreviate(.standart))
    ) -> ExtractDateFormatter.Configuration {
        let from: ExtractDateFormatter.Configuration.DateConfig = .init(
            localeOption: fromLocale,
            dateFormat: fromFormat
        )
        let to: ExtractDateFormatter.Configuration.DateConfig = .init(
            localeOption: toLocale,
            dateFormat: toFormat
        )
        let config: ExtractDateFormatter.Configuration = .init(
            rawDate: input, from: from, to: to
        )
        return config
    }
}
