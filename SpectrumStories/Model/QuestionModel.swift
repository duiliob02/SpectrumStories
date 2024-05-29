//
//  QuestionModel.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 28/05/24.
//

import Foundation

struct QuestionModel : Codable {
    var text : String
    var correctAnsw : Int
    var choices : Array<String>
}
