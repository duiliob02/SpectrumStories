//
//  PuzzleModel.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 10/06/24.
//

import Foundation


@Observable class PuzzleModel : Identifiable {
    let id = UUID()
    let image: String
    let correct : Bool
    let dragged : Bool
    
    init(image: String, correct: Bool, dragged: Bool) {
        self.image = image
        self.correct = correct
        self.dragged = dragged
    }
}
