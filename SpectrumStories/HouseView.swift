//
//  JoyHouseView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 20/05/24.
//

import SwiftUI

struct HouseView: View {
    @AppStorage("gender") var gender = 42
    @State var isImageShown = false
    @State var positionY : Double = 180
    @State private var activateNav = false
    
    var body: some View {
        // da rimuovere quando saranno collegate con le altre view perche avremo gia un navigation Stack
        
            GeometryReader { geo in
                ZStack{
                    Rectangle()
                        .fill(.orangio)
                    
                    Text("CASA DELLA GIOIA")
                        .foregroundStyle(.black)
                        .font(.custom(Constants.font, size: 70))
                        .position(CGPoint(x: geo.size.width/1.5, y: 100.0))
                        .padding(.trailing)
                    Pavimento(width: geo.size.width*0.2, height: 1.5)
                        .fill(.orange)
                    
                    Image((gender == 0) ? "male" : "female")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.height / 5)
                        .position(CGPoint(x: geo.size.width / 10, y: geo.size.height / 1.3))
                    
                    Image("TorTavolo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: geo.size.height/2.5)
                        .position(x: geo.size.width/2, y: geo.size.height/1.55)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isImageShown.toggle()
                                if isImageShown {
                                    withAnimation(Animation.easeIn(duration: 1.5)) {
                                        positionY += 180
                                    }
                                }
                            }
                        }
                    
                    if isImageShown {
                        Image((gender == 0) ? "QuizJoyM" : "QuizJoyF")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width / 2)
                            .rotation3DEffect(
                                .degrees(positionY),
                                axis: (x:0,y:1,z:0)
                            )
                            .transition(.opacity)
                            .onTapGesture {
                                    activateNav.toggle()
                            }
                            .navigationDestination(isPresented: $activateNav) {
                                QuizView(quiz: QuizModel(storyCardM: "QuizJoyM",storyCardF: "", questions: [
                                    QuestionModel(text: "ciao", correctAnsw: 0, choices: ["VOGLIONO LO STESSO GIOCO","prova2","prova3"]),
                                    QuestionModel(text: "ciaone", correctAnsw: 1, choices: ["provaada","sondas", "aosncaso"]),
                                    QuestionModel(text: "asiubc", correctAnsw: 1, choices: ["prova12e123ada","s4141ondas", "aos4343ncaso"])
                                ]), bgColour: .orange)
                            }
                            
                    }
                    
                    
                }
                .ignoresSafeArea()
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
    HouseView(gender: 0)
}
