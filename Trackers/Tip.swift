//
//  Tip.swift
//  Tracker
//
//  Created by Rik Vermeulen on 01/07/2021.
//

import Foundation

struct Tip: Decodable {
    let text: String
    let children: [Tip]?
}
