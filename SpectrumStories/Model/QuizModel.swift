//
//  QuizModel.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 28/05/24.
//

import Foundation

struct QuizModel : Codable {
    var storyCardM : String
    var storyCardF : String
    var questions : Array<QuestionModel>
}
