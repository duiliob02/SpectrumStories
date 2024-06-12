//
//  JoyHouseView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 20/05/24.
//

import SwiftUI

struct FlippingCard : View {
    let imageName : String
    let width : CGFloat
    @Binding var degree : Double
    
    
    var body : some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: width / 2)
            .rotation3DEffect(.degrees(degree), axis: (x:0, y:1,z:0))
    }
    
}

struct HouseView<NextView: View>: View {
    @AppStorage("gender") var gender = 42
    @State var isImageShown = false
    @State var positionY : Double = 180
    @State private var activateNav = false
    var house : HouseModel<NextView>
    @State var imageByGender : String = ""
    var nextView : NextView?
    
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var flipped = false
    let durationAndDelay = 0.5
    
    @State private var alert = false
    @State private var hasTimeElapsed = false
    
    @AppStorage("accessHouse") var access = true
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack{
                Rectangle()
                    .fill(Color(hex: house.backgroundColour))
                
                HStack{
                    Spacer()
                    Text(house.titolo.uppercased())
                        .foregroundStyle(Color(hex: "2F2F2F"))
                        .font(.custom(Constants.font, size: 50))
                        .position(CGPoint(x: geo.size.width/2, y: 100.0))
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
                    .opacity(!isImageShown ? 1 : 0 )
                
                // Posizioni oggetti case
                let notPurple = CGPoint(x: geo.size.width/2, y: geo.size.height/1.45)
                let purple = CGPoint(x: geo.size.width/2, y: geo.size.height/2.5)
                Image(house.object)
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height/2.5)
                    .position((house.object != "Finestra") ? notPurple : purple)
                    .opacity(!isImageShown ? 1 : 0 )
                    .onTapGesture {
                        withAnimation {
                            isImageShown.toggle()
                        }
                    }
                
                if isImageShown {
                    ZStack {
                        FlippingCard(imageName: house.backCard, width: geo.size.width, degree: $backDegree)
                        FlippingCard(imageName: imageByGender, width: geo.size.width, degree: $frontDegree)
                    }
                    .onAppear {
                        flipCard()
                    }
                    .onTapGesture {
                        activateNav.toggle()
                    }
                    .navigationDestination(isPresented: $activateNav) {
                        QuizView(quiz: house.quiz, bgColour: Color(hex: house.floorColour))
                    }
                    .task {
                        if isImageShown {
                            await delayNavigation()
                        }
                    }
                }
                
                
            }
            .ignoresSafeArea()
            .onAppear {
                imageByGender = (gender == 0) ? house.storyCardM : house.storyCardF
                
                isImageShown = false
            }
            .overlay {
                if access {
                    ZStack {
                        Rectangle()
                            .fill(.white.opacity(0.5))
                            .ignoresSafeArea()
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundStyle(Color(hex: house.floorColour))
                            .frame(width: geo.size.width/2, height: geo.size.height/2)
                            .overlay(alignment: .topTrailing) {
                                Button(action: {
                                    withAnimation {
                                        alert.toggle()
                                        access = false
                                    }
                                }, label: {
                                    Text("x")
                                        .foregroundStyle(.white)
                                        .font(.custom(Constants.font, size: 50))
                                        .bold()
                                        .padding(10)
                                        .padding(.horizontal,10)
                                        .background{
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(hex: "E26D5A"))
                                                
                                        }
                                })
                                .padding(30)
                            }
                            
                        
                        VStack{
                            Text("PROVA A CLICCARE SU UNO DEGLI OGGETTI NELLA CASA PER SCOPRIRE COSA SUCCEDE!")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color(hex: "2F2F2F"))
                        }
                        .frame(width: geo.size.width/2, height: geo.size.height/2)
                        .font(.custom(Constants.font, size: 45))
                        .offset(y:geo.size.height/20)
                        
                    }
                }
            }
        }
        
        
    }
    private func delayNavigation() async {
            try? await Task.sleep(nanoseconds: 3_500_000_000)
            activateNav = true
    }
    
    private func flipCard() {
        flipped.toggle()
        if flipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
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
    HouseView<AnyView>(house: HouseModel(backgroundColour: "F8E59A", floorColour: "f2d434", object: "TorTavolo", titolo: "casa della gioia", storyCardM: "QuizJoy", storyCardF: "QuizJoy", backCard: "JoyBackCard", quiz: QuizModel(storyCardM: "QuizJoyM", storyCardF: "QuizJoyF", questions: [
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
