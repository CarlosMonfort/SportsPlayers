//
//  Section.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import Foundation

struct Section: Decodable {
    
    var type: String
    var title: String
    var players: [Player]
}
