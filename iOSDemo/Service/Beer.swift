//
//  Beer.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/2/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Mapper

struct Beer: Mappable {
    let id: Int
    let name: String
    let tagline: String
    let firstBrewed: String
    let description: String
    let imageURL: String
    let abv: Int
    let ibu: Int
    let targetFg: Int
    let targetOg: Int
    let ebc: Int
    let srm: Int
    let ph: Int
    let attenuationLevel: Int
    let foodPairing: [String]
    let brewersTips: String
    
    init(map: Mapper) throws {
        try id = map.from("id")
        try name = map.from("name")
        try tagline = map.from("tagline")
        try firstBrewed = map.from("first_brewed")
        try description = map.from("description")
        try imageURL = map.from("image_url")
        try abv = map.from("abv")
        try ibu = map.from("ibu")
        try targetFg = map.from("target_fg")
        try targetOg = map.from("target_og")
        try ebc = map.from("ebc")
        try srm = map.from("srm")
        try ph = map.from("ph")
        try attenuationLevel = map.from("attenuation_level")
        try foodPairing = map.from("food_pairing")
        try brewersTips = map.from("brewers_tips")
    }
}
