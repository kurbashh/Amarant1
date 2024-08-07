//
//  Banner.swift
//  AMARANT
//
//  Created by Александр Х on 07.08.2024.
//

import Foundation

struct Banner: Identifiable, Codable {
    var id: UUID
    var imageUrl: String
    var link: String
    var title: String
}
