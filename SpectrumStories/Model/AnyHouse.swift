//
//  AnyHouse.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import Foundation
import SwiftUI

struct AnyHouse: Identifiable {
    let id = UUID()
    let house: HouseModel<AnyView>
    

    init<NextView: View>(house: HouseModel<NextView>) {
        self.house = HouseModel(
            backgroundColour: house.backgroundColour,
            floorColour: house.floorColour,
            object: house.object,
            titolo: house.titolo,
            storyCardM: house.storyCardM,
            storyCardF: house.storyCardF,
            quiz: QuizModel(
                storyCardM: house.quiz.storyCardM,
                storyCardF: house.quiz.storyCardF,
                questions: house.quiz.questions,
                nextView: AnyView(house.quiz.nextView)
            )
        )
    }
}
