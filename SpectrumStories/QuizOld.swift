//
//  JoyHouseView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 20/05/24.
//

import SwiftUI


struct QuizOld: View {
    var gender : Int = UserDefaults.standard.value(forKey: "gender") as! Int
    var quiz : Quiz
    @State private var showPopUp1 = false
    @State private var showPopUp0 = false
    @ScaledMetric(relativeTo: .body) var scaledPadding: CGFloat = 20
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            //let h = geo.size.height
            ZStack{
                Rectangle()
                    .fill(.orangio)
                
                HStack {
                    Image((gender == 0) ? quiz.imgM : quiz.imgF)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/2)
                        
                    Spacer()
                    VStack {
                        Text(quiz.domanda)
                            .font(.custom(Constants.font, size: 60, relativeTo: .largeTitle))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, scaledPadding)
                        ForEach(quiz.risposte.sorted(by: >), id: \.key) {                                key, value in
                            // todo : pop up per giusto o sbagliato
                            Button {
                                withAnimation(.smooth) {
                                    if value==0 {
                                        showPopUp0.toggle()
                                    } else {
                                        showPopUp1.toggle()
                                    }
                                }
                            } label: {
                                Text(key)
                                    .font(.custom(Constants.font, size: 40))
                                    .foregroundStyle(.black)
                                    .padding(scaledPadding)
                                    .background(
                                        Capsule()
                                            .fill(.white)
                                            .frame(width: w/3.5)
                                            .shadow(radius: 20, y: 20)
                                    )
                                    .padding(scaledPadding)
                            }
                            .disabled(showPopUp0 || showPopUp1)
                        }
                    }
                }
                .padding(.horizontal, scaledPadding*4)
                
            }
            .navigationBarBackButtonHidden()
            .ignoresSafeArea()
            .overlay(alignment: .center) {
                ZStack {
                    if showPopUp0 || showPopUp1 {
                        Rectangle()
                            .fill(.white.opacity(0.5))
                        
                    }
                        
                    
                    VStack(alignment: .center){
                        if showPopUp0 {
                            AlertView(alert: AlertModel(risposta: 0, imageM: "StickerM0", imageF: "stickerF0", gender: gender, testo: "Proviamo di nuovo", azione: "riprova", bgRectColor: .giallio), showAlert: $showPopUp0)
                                //.frame(width: w/2, height: h/2)
                                .padding(scaledPadding*7)
                            
                            
                            
                        }
                        if showPopUp1{
                            AlertView(alert: AlertModel(risposta: 1, imageM: "StickerM1", imageF: "StickerF1", gender: gender, testo: "Congratulazioni!", azione: "avanti", bgRectColor: .giallio), showAlert: $showPopUp1)
                                //.frame(width: w/1.5, height: h/2)
                                .padding(scaledPadding*7)
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}


#Preview {
    QuizOld(gender: 0, quiz: Quiz(imgM: "QuizJoyM", imgF: "", domanda: "COSA STANNO PROVANDO I BAMBINI?", risposte: ["FELICITA'" : 1, "RABBIA" : 0, "TRISTEZZA" : 0]))
}
