import XCTest
@testable import CardsGenerator

final class CardsGeneratorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case. func testPrioritizedItems() throws {
        let generator = CardsGenerator(pastItems: [
            IdentifiableObject(id: "item1"),
            IdentifiableObject(id: "item1"),
            IdentifiableObject(id: "item2"),
            IdentifiableObject(id: "item2"),
            IdentifiableObject(id: "item1"),
            IdentifiableObject(id: "item3"),
            
        ], currentGuidelineItems: [
            IdentifiableObject(id: "item1"),
            IdentifiableObject(id: "item2")
        ])
        // items should be returned in priority based on their occurence in the history
        // only currentGuideline Items are returned
        let expectation: [(IdentifiableObject, Int)] = [
            (IdentifiableObject(id: "item2"), 2),
            (IdentifiableObject(id: "item1"), 3)
        ]
        let array = generator.prioritizedItems()
        XCTAssertTrue(expectation.count == array.count)
        for i in 0..<array.count {
            XCTAssertTrue(array[i] == expectation[i])
        }
    }
    
    func testZeroGuidelines() {
        let generator = CardsGenerator(pastItems: [
            IdentifiableObject(id: "item1"),
            IdentifiableObject(id: "item1"),
            IdentifiableObject(id: "item2"),
            IdentifiableObject(id: "item2"),
            IdentifiableObject(id: "item1"),
            IdentifiableObject(id: "item3"),
            
        ], currentGuidelineItems: [
        ])
        
        let expectation: [(IdentifiableObject, Int)] = [
        ]
        let array = generator.prioritizedItems()
        XCTAssertTrue(expectation.count == array.count)
    }
}
