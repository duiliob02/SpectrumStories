//
//  JoyHouseView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 20/05/24.
//

import SwiftUI
import PopupView

struct QuizView: View {
    var gender : Int = UserDefaults.standard.value(forKey: "gender") as! Int
    var quiz : Quiz
    @State private var showPopUp1 = false
    @State private var showPopUp0 = false
    
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
                            // todo : pop up per giusto o sbagliato
                            Button {
                                if value==0 {
                                    showPopUp0=true
                                } else {
                                    showPopUp1 = true
                                }
                            } label: {
                                Text(key)
                                    .font(.custom(Constants.font, size: 40))
                                    .foregroundStyle(.black)
                                    .padding()
                                    .background(
                                        Capsule()
                                            .fill(.white)
                                            .frame(width: geo.size.width/3.5)
                                            .shadow(radius: 20, y: 20)
                                        
                                    )
                                    .padding()
                                    .popup(isPresented: $showPopUp1) {
                                        // right answer
                                        
                                        AlertView(alert: AlertModel(risposta: value, imageM: "StickerM1", imageF: "StickerF1", gender: gender, testo: "RISPOSTA GIUSTA", azione: "VAI ALL'ATTIVITA'", bgRectColor: .giallio))
                                        
                                    } customize: { $0
                                        .closeOnTapOutside(true)
                                        .isOpaque(true)
                                        .backgroundColor(.white.opacity(0.5))
                                    }
                                    .popup(isPresented: $showPopUp0) {
                                        AlertView(alert: AlertModel(risposta: value, imageM: "StickerM0", imageF: "StickerF0", gender: gender, testo: "PROVIAMO DI NUOVO", azione: "RIPROVA", bgRectColor: .giallio))
                                    } customize: { $0 
                                            .closeOnTapOutside(true)
                                            .isOpaque(true)
                                            .backgroundColor(.white.opacity(0.5))
                                    }
                                
                            }
                            
                            
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
