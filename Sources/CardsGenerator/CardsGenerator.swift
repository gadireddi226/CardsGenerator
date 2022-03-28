import Foundation
import Algorithms
import CryptoKit

/// The class handles prioritization of items(represented by their ids) for the Digital media plan
public class CardsGenerator {
    /// all item IDs in history of reports
    var pastItems: [IdentifiableObject]
    /// the active guideline items
    var currentGuidelineItems: [IdentifiableObject]
    /// initializer of instance of CardsGenerator from Reports array and current guidelines
    public init(reports: [Report], currentGuidelineItems: [IdentifiableObject]) {
        self.pastItems = []
        for report in reports {
            for card in report.cardList {
                for item in card.items {
                    pastItems.append(item)
                }
            }
        }
        self.currentGuidelineItems = currentGuidelineItems
    }
    /// initializer of instance of CardsGenerator from past items  and current guidelines
    ///- parameters:
    ///  - pastItems: represent the ids of evaluated items in reports
    ///  - currentGuidelineItems: represent guideline items that parent has active for child
    public init(pastItems: [IdentifiableObject], currentGuidelineItems: [IdentifiableObject]) {
        self.pastItems = pastItems
        self.currentGuidelineItems = currentGuidelineItems
    }
    
    private func getActiveItemsHistory() -> [IdentifiableObject] {
        return pastItems.filter { pastItem in
            currentGuidelineItems.contains(pastItem)
        }
    }
    
    private func getOccurenciesOfCurrentGuidelineItemsInHistory() -> [IdentifiableObject: Int] {
        var mappedItems = getActiveItemsHistory().map { ($0, 1) }
        let newGuidelines = currentGuidelineItems.filter { item in
            !mappedItems.contains { pastItem in
                pastItem.0 == item
            }
        }
        mappedItems.append(contentsOf: newGuidelines.map{($0, 0)})
        let counts = Dictionary(mappedItems, uniquingKeysWith: +)
        return counts
    }
    /// Creates sequence of valid ordered items with frequency
    ///- Returns: array of tuples (IdentifiableObject, Int) that represent the identifiable object with its occurence, the tuples are ordered in increasing order
    public func prioritizedItems() -> [(IdentifiableObject, Int)] {
        let dic = getOccurenciesOfCurrentGuidelineItemsInHistory()
        let ordered = dic.sorted { a, b in
            a.value < b.value
        }
        return ordered.map { element in
            let tupleElement:(IdentifiableObject,Int) = (element.key, element.value)
            return tupleElement
        }
    }
}
