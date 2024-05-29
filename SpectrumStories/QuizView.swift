//
//  QuizView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 28/05/24.
//

import SwiftUI

struct QuizView: View {
    var gender : Int = UserDefaults.standard.value(forKey: "gender") as! Int
    var quiz : QuizModel
    var bgColour : Color
    
    @State private var currentQuestionIndex = 0
    @State private var isCorrect = false
    
    @State private var correctAlert = false
    @State private var wrongAlert = false
    
    @ScaledMetric(relativeTo: .body) private var scaledPadding : CGFloat = 20
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(bgColour)
                HStack {
                    Image(systemName: "circle.fill")
                    VStack {
                        Text(quiz.questions[currentQuestionIndex].text)
                            .font(.custom(Constants.font, size: 70))
                            .padding()
                        ForEach(0..<quiz.questions[self.currentQuestionIndex].choices.count, id: \.self) { choice in
                            Button {
                                optionSelected(choice)
                            } label: {
                                Text(quiz.questions[self.currentQuestionIndex].choices[choice])
                                    .font(.custom(Constants.font, size: 60))
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .overlay {
                ZStack {
                    if correctAlert || wrongAlert {
                        Rectangle()
                            .fill(.white.opacity(0.5))
                        
                    }
                        
                    
                    VStack(alignment: .center){
                        if wrongAlert {
                            AlertView(alert: AlertModel(risposta: 0, imageM: "StickerM0", imageF: "stickerF0", gender: gender, testo: "Proviamo di nuovo", azione: "riprova", bgRectColor: .giallio), showAlert: $wrongAlert)
                                //.frame(width: w/2, height: h/2)
                                .padding(scaledPadding*7)
                            
                            
                            
                        }
                        if correctAlert {
                            AlertView(alert: AlertModel(risposta: 1, imageM: "StickerM1", imageF: "StickerF1", gender: gender, testo: "Congratulazioni!", azione: "avanti", bgRectColor: .giallio), showAlert: $correctAlert)
                                //.frame(width: w/1.5, height: h/2)
                                .padding(scaledPadding*7)
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
    
    func optionSelected(_ index: Int) {
        withAnimation(.linear(duration: 0.3)) {
            if index == quiz.questions[currentQuestionIndex].correctAnsw {
                isCorrect = true
                correctAlert = true

                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isCorrect = false
                    if (currentQuestionIndex < 2) {
                        currentQuestionIndex += 1
                    }
                }
            } else {
                
                wrongAlert = true
                isCorrect = false
            }
        }
    }
}

#Preview {
    QuizView(gender: 0, quiz: QuizModel(storyCardM: "",storyCardF: "", questions: [
        QuestionModel(text: "ciao", correctAnsw: 0, choices: ["prova1","prova2","prova3"]),
        QuestionModel(text: "ciaone", correctAnsw: 1, choices: ["provaada","sondas", "aosncaso"]),
        QuestionModel(text: "asiubc", correctAnsw: 1, choices: ["prova12e123ada","s4141ondas", "aos4343ncaso"])
    ]), bgColour: .orange)
}
