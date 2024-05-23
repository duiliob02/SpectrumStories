//
//  JoyHouseView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 20/05/24.
//

import SwiftUI

struct JoyHouseView: View {
    var gender : Int = UserDefaults.standard.value(forKey: "gender") as! Int
    
    var body: some View {
        // da rimuovere quando saranno collegate con le altre view perche avremo gia un navigation Stack
        NavigationStack {
            GeometryReader { geo in
                ZStack{
                    Rectangle()
                        .fill(.orangio)
                    Pavimento(width: geo.size.width*0.2, height: 1.5)
                        .fill(.orange)
                        
                    Image((gender == 0) ? "male" : "female")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.height / 5)
                        .position(CGPoint(x: geo.size.width / 10, y: geo.size.height / 1.3))
                    NavigationLink{ QuizView(gender: gender, quiz: Quiz(imgM: "QuizJoyM", imgF: "QuizJoyF", domanda: "COSA STANNO PROVANDO I BAMBINI?", risposte: ["FELICITA'" : 1, "RABBIA" : 0, "TRISTEZZA" : 0]))
                    } label: {
                        Image("TorTavolo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: geo.size.height/2.5)
                            .position(x: geo.size.width/2, y: geo.size.height/1.55)
                    }
                        
                }
                .ignoresSafeArea()
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
    JoyHouseView(gender: 0)
}
