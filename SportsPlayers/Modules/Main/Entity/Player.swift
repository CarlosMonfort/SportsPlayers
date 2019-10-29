//
//  Player.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import Foundation

struct Player: Decodable {
    
    var name: String
    var surname: String
    var image: String
    var date: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case surname = "surname"
        case image = "image"
        case date
    }

    enum DateKey: String, CodingKey {
        case date = "date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.surname = try values.decode(String.self, forKey: .surname)
        self.image = try values.decode(String.self, forKey: .image)

        if values.contains(.date) {
            let datekey = try decoder.container(keyedBy: DateKey.self)
            self.date = try datekey.decodeIfPresent(String.self, forKey: .date)
        } else {
            self.date = nil
        }
    }
}
