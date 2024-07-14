//
//  statistic.swift
//  MC3
//
//  Created by Vanessa on 14/07/24.
//

import Foundation

struct Statistic: Identifiable {
    let id = UUID()
    let month: String
    let value: Double
}
struct CardData: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var imageName: String
    var rating: String
    var duration: String
    var detail: String
}
