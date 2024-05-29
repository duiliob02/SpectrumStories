//
//  HouseModel.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 28/05/24.
//

import Foundation


struct HouseModel : Codable {
    var backgroundColour : String
    var floorColour : String
    var object : String
    var titolo : String
    var storyCard : String
    var quiz : QuizModel
}

