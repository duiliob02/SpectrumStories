//
//  JoyHouseView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 20/05/24.
//

import SwiftUI

struct HouseView<NextView: View>: View {
    @AppStorage("gender") var gender = 42
    @State var isImageShown = false
    @State var positionY : Double = 180
    @State private var activateNav = false
    var house : HouseModel<NextView>
    @State var imageByGender : String = ""
    var nextView : NextView?
    
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack{
                Rectangle()
                    .fill(Color(hex: house.backgroundColour))
                
                HStack{
                    Spacer()
                    Text(house.titolo.uppercased())
                        .foregroundStyle(.black)
                        .font(.custom(Constants.font, size: 50))
                        .position(CGPoint(x: geo.size.width/1.5, y: 100.0))
                        .padding(.trailing)
                    Spacer()
                }
                Pavimento(width: geo.size.width*0.2, height: 1.5)
                    .fill(Color(hex: house.floorColour))
                
                Image((gender == 0) ? "male" : "female")
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height / 2)
                    .position(CGPoint(x: geo.size.width / 9, y: geo.size.height / 1.3))
                
                let notPurple = CGPoint(x: geo.size.width/2, y: geo.size.height/1.45)
                let purple = CGPoint(x: geo.size.width/2, y: geo.size.height/2.5)
                Image(house.object)
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height/2.5)
                    .position((house.object != "Finestra") ? notPurple : purple)
                    .onTapGesture {
                        isImageShown.toggle()
                        withAnimation(Animation.default.delay(0.5).speed(0.6)) {
                            positionY += 180
                        }
                    }
                
                if isImageShown {
                    ZStack {
                        Image("JoyBackCard")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width / 2)
                            .opacity(positionY >= 90 && positionY < 270 ? 1 : 0)
                        
                        Image(imageByGender)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width / 2)
                            .opacity(positionY < 90 || positionY >= 270 ? 1 : 0)
                    }
                    .rotation3DEffect(
                        .degrees(positionY),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .onTapGesture {
                        activateNav.toggle()
                    }
                    .navigationDestination(isPresented: $activateNav) {
                        QuizView(quiz: house.quiz, bgColour: Color(hex: house.floorColour))
                    }
                }
                
                
            }
            .ignoresSafeArea()
            .onAppear {
                imageByGender = (gender == 0) ? house.storyCardM : house.storyCardF
            }
        }
        
    }
}

struct Pavimento: Shape {
    var width : CGFloat
    var height : CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX + width,y: rect.maxY / height))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / height))
        path.closeSubpath()
        
        return path
    }
}



#Preview {
    HouseView<AnyView>(house: HouseModel(backgroundColour: "F8E59A", floorColour: "f2d434", object: "TorTavolo", titolo: "casa della gioia", storyCardM: "QuizJoyM", storyCardF: "QuizJoyF", quiz: QuizModel(storyCardM: "QuizJoyM", storyCardF: "QuizJoyF", questions: [
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
                                                                                                                                                                                                             nextView: AnyView(JoyActivityPresentationView())) ))
}
