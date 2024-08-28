import XCTest
@testable import retrograde

final class retrogradeTests: XCTestCase {

    func testFormattedDate() throws {
        let contentView = ContentView()
        let testDate = Date(timeIntervalSince1970: 1693075200) // August 26, 2024
        
        let formatted = contentView.formattedDate(testDate)
        
        XCTAssertEqual(formatted, "August 26", "The formatted date should be 'August 26'")
    }

}
