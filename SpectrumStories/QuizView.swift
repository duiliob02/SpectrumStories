//
//  QuizView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 28/05/24.
//

import SwiftUI

struct QuizView: View {
    @AppStorage("gender") var gender = 0
    var quiz : QuizModel
    var bgColour : Color
    
    @State private var currentQuestionIndex = 0
    @State private var isCorrect = false
    
    @State private var correctAlert = false
    @State private var wrongAlert = false
    
    @ScaledMetric(relativeTo: .body) private var scaledPadding : CGFloat = 20
    @ScaledMetric(relativeTo: .title3) private var scaledText : CGFloat = 35
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(bgColour)
                HStack {
                    Image((gender==0) ? quiz.storyCardM : quiz.storyCardF)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/2)
                        
                    
                    Spacer()
                    
                    VStack {
                        
                        Text(quiz.questions[currentQuestionIndex].text.uppercased())
                            .font(.custom(Constants.font, size: 60))
                            .padding(.bottom ,scaledPadding*4)
                            
                       
                        ForEach(0..<quiz.questions[self.currentQuestionIndex].choices.count, id: \.self) { choice in
                            Button {
                                optionSelected(choice)
                            } label: {
                                Text(quiz.questions[self.currentQuestionIndex].choices[choice].uppercased())
                                    .font(.custom(Constants.font, size: scaledText))
                                    .foregroundStyle(.black)
                                    .padding(.vertical, scaledPadding*1.4)
                                    .padding(.horizontal, scaledPadding*2)
                                    .background{
                                        Capsule()
                                            .foregroundStyle(.white)
                                            .frame(width: geo.size.width/3)
                                    }
                                    .padding(.vertical, scaledPadding/2)
                            }
                        }
                        
                    }
                    Spacer()
                }
                .padding(.leading, scaledPadding*3)
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
                            AlertView(alert: AlertModel(imageM: "StickerM0", imageF: "stickerF0", testo: "Proviamo di nuovo", azione: "riprova", bgRectColor: .giallio), showAlert: $wrongAlert)
                                //.frame(width: w/2, height: h/2)
                                .padding(scaledPadding*7)
                            
                            
                            
                        }
                        if correctAlert {
                            AlertView(alert: AlertModel(imageM: "StickerM1", imageF: "StickerF1", testo: "Congratulazioni!", azione: "avanti", bgRectColor: .giallio), showAlert: $correctAlert)
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
    QuizView(gender: 0, quiz: QuizModel(storyCardM: "QuizJoyM",storyCardF: "", questions: [
        QuestionModel(text: "ciao", correctAnsw: 0, choices: ["VOGLIONO LO STESSO GIOCO","prova2","prova3"]),
        QuestionModel(text: "ciaone", correctAnsw: 1, choices: ["provaada","sondas", "aosncaso"]),
        QuestionModel(text: "asiubc", correctAnsw: 1, choices: ["prova12e123ada","s4141ondas", "aos4343ncaso"])
    ]), bgColour: .orange)
}
