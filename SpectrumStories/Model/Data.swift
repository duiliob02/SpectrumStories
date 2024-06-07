//
//  Data.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import Foundation
import SwiftUI

let housesData = [
    AnyHouse(house: HouseModel(
        backgroundColour: "A4B3F8",
        floorColour: "6181F2",
        object: "LibroTavolo",
        titolo: "Casa della Tristezza",
        storyCardM: "QuizSadM",
        storyCardF: "QuizSadF",
        quiz: QuizModel(
            storyCardM: "QuizSadM",
            storyCardF: "QuizSadF",
            questions: [
                QuestionModel(
                    question: "Dove sono i bambini?",
                    correctAnsw: 1,
                    answers: [
                        "Allo zoo",
                        "A scuola",
                        "Dal dottore"
                    ]
                ),
                QuestionModel(
                    question: "Cosa sta provando?",
                    correctAnsw: 2,
                    answers: [
                        "Rabbia",
                        "Felicità",
                        "Tristezza"
                    ]
                ),
                QuestionModel(
                    question: "Perché è triste?",
                    correctAnsw: 2,
                    answers: [
                        "La mamma va via",
                        "Va' dal dottore",
                        "Deve studiare"
                    ]
                )
            ],
            nextView: EmptyView()
        )
    )),
    AnyHouse(house: HouseModel(
        backgroundColour: "F8E59A",
        floorColour: "F2D434",
        object: "TorTavolo",
        titolo: "Casa della Gioia",
        storyCardM: "QuizJoyM",
        storyCardF: "QuizJoyF",
        quiz: QuizModel(
            storyCardM: "QuizJoyM",
            storyCardF: "QuizJoyF",
            questions: [
                QuestionModel(
                    question: "Dove sono i bambini?",
                    correctAnsw: 0,
                    answers: [
                        "Ad una festa",
                        "A lezione",
                        "Dal dottore"
                    ]
                ),
                QuestionModel(
                    question: "Cosa stanno provando i bambini?",
                    correctAnsw: 1,
                    answers: [
                        "Rabbia",
                        "Felicità",
                        "Tristezza"
                    ]
                ),
                QuestionModel(
                    question: "Perché sono felici?",
                    correctAnsw: 2,
                    answers: [
                        "Mangiano le caramelle",
                        "Sono allo zoo",
                        "Sono a un compleanno"
                    ]
                )
            ],
            nextView: JoyActivityPresentationView()
        )
    )),
    AnyHouse(house: HouseModel(
        backgroundColour: "FCD6D6",
        floorColour: "E95454",
        object: "Cesta",
        titolo: "Casa della Rabbia",
        storyCardM: "QuizAng",
        storyCardF: "QuizAng",
        quiz: QuizModel(
            storyCardM: "QuizAng",
            storyCardF: "QuizAng",
            questions: [
                QuestionModel(
                    question: "Dove sono i bambini?",
                    correctAnsw: 2,
                    answers: [
                        "Al cinema",
                        "A mare",
                        "Al parco"
                    ]
                ),
                QuestionModel(
                    question: "Cosa stanno provando i bambini?",
                    correctAnsw: 0,
                    answers: [
                        "Rabbia",
                        "Felicità",
                        "Tristezza"
                    ]
                ),
                QuestionModel(
                    question: "Perché sono arrabbiati?",
                    correctAnsw: 1,
                    answers: [
                        "Devono andare via",
                        "Vogliono lo stesso gioco",
                        "Vogliono il gelato"
                    ]
                )
            ],
            nextView: EmptyView()
        )
    )),
    AnyHouse(house: HouseModel(
        backgroundColour: "C9A4F7",
        floorColour: "A962F1",
        object: "Finestra",
        titolo: "Casa della Paura",
        storyCardM: "QuizFearM",
        storyCardF: "QuizFearF",
        quiz: QuizModel(
            storyCardM: "QuizFearM",
            storyCardF: "QuizFearF",
            questions: [
                QuestionModel(
                    question: "Dove si trova?",
                    correctAnsw: 2,
                    answers: [
                        "Nel salone",
                        "In un negozio",
                        "In cameretta"
                    ]
                ),
                QuestionModel(
                    question: "Cosa sta provando?",
                    correctAnsw: 0,
                    answers: [
                        "Paura",
                        "Rabbia",
                        "Tristezza"
                    ]
                ),
                QuestionModel(
                    question: "Perché ha paura?",
                    correctAnsw: 0,
                    answers: [
                        "C'è un mostro",
                        "Non vuole dormire",
                        "Ha ricevuto un rimprovero"
                    ]
                )
            ],
            nextView: EmptyView()
        )
    ))
]



var facesJoyAct : [FaceActModel] = [
    FaceActModel(imageName: "JoyActFace0", correct: true),
    FaceActModel(imageName: "JoyActFace1", correct: false),
    FaceActModel(imageName: "JoyActFace2", correct: false),
    
    FaceActModel(imageName: "JoyActFace2", correct: false),
    FaceActModel(imageName: "JoyActFace3", correct: false),
    FaceActModel(imageName: "JoyActFace0", correct: true),
    
    FaceActModel(imageName: "JoyActFace3", correct: false),
    FaceActModel(imageName: "JoyActFace2", correct: false),
    FaceActModel(imageName: "JoyActFace0", correct: true)
    
]
