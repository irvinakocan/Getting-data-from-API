//
//  Models.swift
//  Getting data from API
//
//  Created by Macbook Air 2017 on 22. 11. 2023..
//

import Foundation

// Swift provides a protocol known as Codable which lets us convert data that we get back from net recall from a url to an actual class or a struct

struct Response: Codable {
    let results: MyResult
    let status: String
}

struct MyResult: Codable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_length: Int
    let civil_twilight_begin: String
    let civil_twilight_end: String
    let nautical_twilight_begin: String
    let nautical_twilight_end: String
    let astronomical_twilight_begin: String
    let astronomical_twilight_end: String
}
