//
//  Objects.swift
//
//
//  Created by Erik Gadireddi on 21.03.2022.
//

import Foundation
/// Identifiable object by it's variable **id**
public struct IdentifiableObject: Identifiable,Hashable,Equatable, Codable {
    /// represents the string that identifies the object
    public var id: String
}

/// It is minimized version of Card just for the sake of simplicity of this service.
///
/// The card will have for now single item (example screenfreezone bedroom or TimeLimit), but it can have more.
/// The reason why to have option to create card with more items (it brings not so precise data from user, however it might be the cost for better user experience)
/// We do not care in the generation of cards which answer was attached so it is omitted.
public struct Card: Codable {
    /// array of items that are in card
    public var items: [IdentifiableObject]
}

public struct Report: Codable {
    /// list of cards that were evaluated
    public var cardList: [Card]
    /// timestamps when the report was created
    public var timeStamp: Date
}
