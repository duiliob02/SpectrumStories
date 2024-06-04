//
//  HouseModel.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 28/05/24.
//

import Foundation
import SwiftUI


struct HouseModel<NextView: View> {
    let backgroundColour: String
    let floorColour: String
    let object: String
    let titolo: String
    let storyCardM: String
    let storyCardF: String
    let quiz: QuizModel<NextView>
}
