//
//  HomeModel.swift
//  Anciar
//
//  Created by Vignesh Kumar on 5/10/22.
//

import Foundation

struct BaseItem {
    var items: [Items]
    var sectionTitle: String
}

struct Items {
    var firstImageUrl: String?
    var secondImageUrl: String?
}
