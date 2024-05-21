//
//  SpectrumStoriesApp.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 17/05/24.
//

import SwiftUI

@main
struct SpectrumStoriesApp: App {
    var body: some Scene {
        WindowGroup {
            QuizView(gender: 0, quiz: Quiz(imgM: "QuizJoyM", imgF: "", domanda: "CIAO", risposte: ["FELICITA'" : 1, "RABBIA" : 0, "TRISTEZZA" : 0]))
        }
    }
}
