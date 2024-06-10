//
//  SadActView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 10/06/24.
//

import SwiftUI

struct SadActView: View {
    
    @State private var puzzlesData = puzzles
    @State private var piecePositions: [CGPoint] = Array(repeating: .zero, count: 4)
    @State private var showAlert = false
    @State private var correctAlert = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Rectangle()
                    .fill(Color(hex: "FFFBF4"))
                VStack{
                    Text("COMPONI TUTTI I PUZZLE")
                        .font(.custom(Constants.font, size: 60))
                        .padding(.top, 70)
                    
                    Image("puzzle0")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/5)
                        .padding(.bottom, 100)
                                            
                    HStack {
                        pieceView(index: 0, width: geo.size.width, height: geo.size.height, position: piecePositions[0])
                        pieceView(index: 1, width: geo.size.width, height: geo.size.height, position: piecePositions[1])
                        pieceView(index: 2, width: geo.size.width, height: geo.size.height, position: piecePositions[2])
                        pieceView(index: 3, width: geo.size.width, height: geo.size.height, position: piecePositions[3])
                        
                    }
                    
                    
                    
                        
                    
                    
                    
                    
                }
                
                
            }
            .ignoresSafeArea()
            .onAppear {
                piecePositions = [ CGPoint(x: geo.size.width/7, y: geo.size.height/5), CGPoint(x: geo.size.width/7, y: geo.size.height/5), CGPoint(x: geo.size.width/7, y: geo.size.height/5), CGPoint(x: geo.size.width/9, y: geo.size.height/5)]
            }
            .overlay {
                ZStack{
                    if correctAlert || showAlert {
                        Rectangle()
                            .fill(.white.opacity(0.5))
                    }
                    if showAlert {
                        AlertView(alert: AlertModel(imageM: "StickerM0", imageF: "StickerF0", testo: "Non combacia", azione: "Riprova", bgRectColor: Color(hex: "E8D072")), showAlert: $showAlert, nextView: EmptyView())
                    } else if correctAlert {
                        AlertView(alert: AlertModel(imageM: "StickerM1", imageF: "StickerF1", testo: "Giusto!", azione: "Avanti", bgRectColor: Color(hex: "E8D072")), showAlert: $showAlert, nextView: MapView(houses: housesData), lastQuestion: true)
                    }
                    
                }
            }
        }
        .foregroundStyle(Color(hex: "181818"))
    }
    
    func pieceView(index: Int, width: CGFloat, height: CGFloat, position: CGPoint) -> some View {
        Image(puzzles[index].image)
            .resizable()
            .scaledToFit()
            .frame(width: width / 5)
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        piecePositions[index] = value.location
                        
                    }
                    .onEnded { value in
                        if puzzles[index].correct {
                            if checkPos(location: value.location, w: width, h: height){
                                withAnimation {
                                    correctAlert = true
                                    showAlert  = false
                                }
                            }
                        } else {
                            withAnimation {
                                piecePositions[index] = value.startLocation
                                showAlert = true
                            }
                        }
                    }
            )
        
    }
    
    func checkPos(location: CGPoint, w:CGFloat, h:CGFloat)->Bool{
        let y = location.y * -1
        let x = location.x
        if y > 0 && x>0 {
            return true
        }
        return false
        
    }
}



#Preview {
    SadActView()
}
