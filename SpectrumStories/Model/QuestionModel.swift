//
//  QuestionModel.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 28/05/24.
//

import Foundation

struct QuestionModel  {
    let text: String
        let correctAnsw: Int
        let choices: [String]
        
        enum CodingKeys: String, CodingKey {
            case text
            case correctAnsw
            case choices = "choices"
        }
}
