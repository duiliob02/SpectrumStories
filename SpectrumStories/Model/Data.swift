//
//  Data.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import Foundation

let housesData: [HousesData] = [
    HousesData(
        name: "joy",
        data: HouseModel(
            backgroundColour: "yellow",
            floorColour: "yellow",
            object: "TorTavolo",
            titolo: "Casa della Gioia",
            storyCardM: "QuizJoyM",
            storyCardF: "QuizJoyF",
            quiz: QuizModel(
                storyCardM: "QuizJoyM",
                storyCardF: "QuizJoyF",
                questions: [
                    QuestionModel(
                        text: "Dove sono i bambini?",
                        correctAnsw: 0,
                        choices: [
                            "Ad una festa",
                            "A lezione",
                            "Dal dottore"
                        ]
                    ),
                    QuestionModel(
                        text: "Cosa stanno provando i bambini?",
                        correctAnsw: 1,
                        choices: [
                            "Rabbia",
                            "Felicità",
                            "Tristezza"
                        ]
                    ),
                    QuestionModel(
                        text: "Perché sono felici?",
                        correctAnsw: 2,
                        choices: [
                            "Mangiano le caramelle",
                            "Sono allo zoo",
                            "Sono a un compleanno"
                        ]
                    )
                ]
            )
        )
    ),
    HousesData(
        name: "sadness",
        data: HouseModel(
            backgroundColour: "blue",
            floorColour: "blue",
            object: "LibroTavolo",
            titolo: "Casa della Tristezza",
            storyCardM: "QuizSadM",
            storyCardF: "QuizSadF",
            quiz: QuizModel(
                storyCardM: "QuizSadM",
                storyCardF: "QuizSadF",
                questions: [
                    QuestionModel(
                        text: "Dove sono i bambini?",
                        correctAnsw: 1,
                        choices: [
                            "Allo zoo",
                            "A scuola",
                            "Dal dottore"
                        ]
                    ),
                    QuestionModel(
                        text: "Cosa sta provando?",
                        correctAnsw: 2,
                        choices: [
                            "Rabbia",
                            "Felicità",
                            "Tristezza"
                        ]
                    ),
                    QuestionModel(
                        text: "Perché è triste?",
                        correctAnsw: 2,
                        choices: [
                            "La mamma va via",
                            "Va' dal dottore",
                            "Deve studiare"
                        ]
                    )
                ]
            )
        )
    ),
    HousesData(
        name: "anger",
        data: HouseModel(
            backgroundColour: "red",
            floorColour: "red",
            object: "Cesta",
            titolo: "Casa della Rabbia",
            storyCardM: "QuizAngM",
            storyCardF: "QuizAngF",
            quiz: QuizModel(
                storyCardM: "QuizAngM",
                storyCardF: "QuizAngF",
                questions: [
                    QuestionModel(
                        text: "Dove sono i bambini?",
                        correctAnsw: 2,
                        choices: [
                            "Al cinema",
                            "A mare",
                            "Al parco"
                        ]
                    ),
                    QuestionModel(
                        text: "Cosa stanno provando i bambini?",
                        correctAnsw: 0,
                        choices: [
                            "Rabbia",
                            "Felicità",
                            "Tristezza"
                        ]
                    ),
                    QuestionModel(
                        text: "Perché sono arrabbiati?",
                        correctAnsw: 1,
                        choices: [
                            "Devono andare via",
                            "Vogliono lo stesso gioco",
                            "Vogliono il gelato"
                        ]
                    )
                ]
            )
        )
    ),
    HousesData(
        name: "fear",
        data: HouseModel(
            backgroundColour: "purple",
            floorColour: "purple",
            object: "Finestra",
            titolo: "Casa della Paura",
            storyCardM: "QuizFearM",
            storyCardF: "QuizFearF",
            quiz: QuizModel(
                storyCardM: "QuizFearM",
                storyCardF: "QuizFearF",
                questions: [
                    QuestionModel(
                        text: "Dove si trova?",
                        correctAnsw: 2,
                        choices: [
                            "Nel salone",
                            "In un negozio",
                            "In cameretta"
                        ]
                    ),
                    QuestionModel(
                        text: "Cosa sta provando?",
                        correctAnsw: 0,
                        choices: [
                            "Paura",
                            "Rabbia",
                            "Tristezza"
                        ]
                    ),
                    QuestionModel(
                        text: "Perché ha paura?",
                        correctAnsw: 0,
                        choices: [
                            "C'è un mostro",
                            "Non vuole dormire",
                            "Ha ricevuto un rimprovero"
                        ]
                    )
                ]
            )
        )
    )
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
