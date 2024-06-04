//
//  QuizModel.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 28/05/24.
//

import Foundation
import SwiftUI

struct QuizModel<NextView: View> {
    let storyCardM: String
    let storyCardF: String
    let questions: [QuestionModel]
    let nextView: NextView
}
