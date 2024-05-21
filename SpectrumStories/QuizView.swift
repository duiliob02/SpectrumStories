//
//  JoyHouseView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 20/05/24.
//

import SwiftUI

struct QuizView: View {
    var gender : Int = UserDefaults.standard.value(forKey: "gender") as! Int
    var quiz : Quiz
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Rectangle()
                    .fill(.orangio)
                        
                HStack {
                    Image((gender == 0) ? quiz.imgM : quiz.imgF)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/2)
                        .padding(.leading, 100)
                        Spacer()
                    VStack {
                        Text(quiz.domanda)
                            .font(.custom(Constants.font, size: 60))
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        ForEach(quiz.risposte.sorted(by: >), id: \.key) {                                key, value in
                            Text(key)
                                .font(.custom(Constants.font, size: 40))
                                .padding()
                                .background(
                                    Capsule()
                                        .fill(.white)
                                        .frame(width: geo.size.width/3.5)
                                        .shadow(radius: 20, y: 20)
                                        
                                )
                                .padding()
                        }
                    }
                    .padding(.trailing, 100)
                }
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    QuizView(gender: 0, quiz: Quiz(imgM: "QuizJoyM", imgF: "", domanda: "COSA STANNO PROVANDO I BAMBINI?", risposte: ["FELICITA'" : 1, "RABBIA" : 0, "TRISTEZZA" : 0]))
}
