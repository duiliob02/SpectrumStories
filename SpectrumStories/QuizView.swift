//
//  QuizView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 28/05/24.
//

import SwiftUI

struct QuizView<NextView: View>: View {
    @AppStorage("gender") var gender = 0
    var quiz : QuizModel<NextView>
    var bgColour : Color
    
    @State private var currentQuestionIndex = 0
    @State private var isCorrect = false
    
    @State private var correctAlert = false
    @State private var wrongAlert = false
    @State private var correctCount = 0
    
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
                        
                        Text(quiz.questions[currentQuestionIndex].question.uppercased())
                            .font(.custom(Constants.font, size: 60))
                            .padding(.bottom ,scaledPadding*4)
                            
                       
                        ForEach(0..<quiz.questions[self.currentQuestionIndex].answers.count, id: \.self) { choice in
                            Button {
                                optionSelected(choice)
                            } label: {
                                Text(quiz.questions[self.currentQuestionIndex].answers[choice].uppercased())
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
                            AlertView(alert: AlertModel(imageM: "StickerM0", imageF: "stickerF0", testo: "Proviamo di nuovo", azione: "riprova", bgRectColor: bgColour), showAlert: $wrongAlert, nextView: EmptyView())
                    
                            
                            
                            
                        }
                        if correctAlert {
                            if correctCount == 3 {
                                AlertView(alert: AlertModel(imageM: "StickerM1", imageF: "StickerF1", testo: "Ottimo!\nOra giochiamo insieme", azione: "avanti", bgRectColor: bgColour), showAlert: $correctAlert, nextView: quiz.nextView, lastQuestion: true)
                                    
                            } else {
                                AlertView(alert: AlertModel(imageM: "StickerM1", imageF: "StickerF1", testo: "Congratulazioni!", azione: "avanti", bgRectColor: bgColour), showAlert: $correctAlert, nextView: EmptyView())
                                
                            }
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
                correctCount += 1

                
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
        QuestionModel(question: "ciao", correctAnsw: 0, answers: ["VOGLIONO LO STESSO GIOCO","prova2","prova3"]),
        QuestionModel(question: "ciaone", correctAnsw: 1, answers: ["provaada","sondas", "aosncaso"]),
        QuestionModel(question: "asiubc", correctAnsw: 1, answers: ["prova12e123ada","s4141ondas", "aos4343ncaso"])
    ], nextView: JoyActivityPresentationView()), bgColour: .orange)
}
