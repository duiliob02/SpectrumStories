//
//  FaceActModel.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import Foundation


@Observable class FaceActModel: Identifiable {
    let id = UUID()
    let imageName : String
    let correct: Bool
    var tapped = false
    
    init(imageName: String, correct: Bool, tapped: Bool = false) {
        self.imageName = imageName
        self.correct = correct
        self.tapped = tapped
    }

//    static func == (lhs:FaceActModel, rhs:FaceActModel) -> Bool{
//        
//    }
}
