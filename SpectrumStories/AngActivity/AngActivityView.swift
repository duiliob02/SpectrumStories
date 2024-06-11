//
//  AngActivityView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 11/06/24.
//

import SwiftUI

struct AngActivityView: View {
    @State private var currentEyes = ""
    @State private var currentIndex = 0
    @State private var scrollID : Int?
    
    @State private var wrongAlert = false
    @State private var correctAlert = false
    
    let eyesArray = ["AngEyes", "JoyEyes", "FearEyes", "SadEyes"]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(.bgAct)
                VStack(alignment: .center) {
                    Text("RICOSTRUISCI L'EMOZIONE")
                        .font(.custom(Constants.font, size: 60))
                        .padding(.bottom, 50)
                    
                    showAsset(img: currentEyes, w: geo.size.width)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(ImageAsset.mouths) { mouth in
                                showAsset(img: mouth.img, w: geo.size.width)
                                    .containerRelativeFrame(.horizontal)
                                
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollPosition(id: $scrollID)
                    
                    
                    Button {
                        checkPoint()
                    } label : {
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(.white)
                                .stroke(.black)
                                .frame(width: geo.size.width*0.25, height: geo.size.height*0.1)
                            Text("CONFERMA")
                                .font(.custom(Constants.font, size: 40))
                        }
                    }
                    .padding(.top, 30)
                }
                .onAppear {
                    if !ImageAsset.mouths.isEmpty {
                        scrollID = ImageAsset.mouths[0].id
                    }
                    currentEyes = eyesArray.first ?? ""
                }
                .overlay {
                    ZStack{
                        if correctAlert || wrongAlert {
                            Rectangle()
                                .fill(.white.opacity(0.5))
                        }
                        if wrongAlert {
                            AlertView(alert: AlertModel(imageM: "StickerM0", imageF: "StickerF0", testo: "Non combacia", azione: "Riprova", bgRectColor: Color(hex: "E95454")), showAlert: $wrongAlert, nextView: EmptyView())
                        }
                        if correctAlert {
                            if currentIndex != eyesArray.count - 1 {
                                AlertView(alert: AlertModel(imageM: "StickerM1", imageF: "StickerF1", testo: "Complimenti!", azione: "Avanti", bgRectColor: Color(hex: "E95454")), showAlert: $correctAlert, nextView: EmptyView())
                                    .onDisappear{
                                        nextEyes()
                                    }
                            } else {
                                AlertView(alert: AlertModel(imageM: "StickerM1", imageF: "StickerF1", testo: "Ottimo!\nOra torniamo alla mappa", azione: "Fine", bgRectColor: Color(hex: "E95454")), showAlert: $wrongAlert, nextView: MapView(houses: housesData), lastQuestion: true)
                            }
                        }
                        
                    }
                }
                
            }
            .ignoresSafeArea()
            
        }
    }
    
    private func checkPoint() {
        if let scrollID {
            if ImageAsset.name(scrollID).hasPrefix(currentEyes.prefix(3)) {
                correctAlert = true
            } else {
                wrongAlert = true
            }
        }
    }
    private func showAsset(img: String, w: CGFloat) -> some View {
        Image(img)
            .resizable()
            .scaledToFit()
            .frame(width: w/2.4)
    }
    private func nextEyes() {
        if currentIndex < eyesArray.count - 1 {
            currentIndex += 1
            currentEyes = eyesArray[currentIndex]
        }
    }
}

struct ImageAsset : Identifiable {
    var id: Int
    var img: String
    
    static var mouths :[ImageAsset] =
    [
        .init(id: 1, img: "AngMouth"),
        .init(id: 2, img: "SadMouth"),
        .init(id: 3, img: "JoyMouth"),
        .init(id: 4, img: "FearMouth")
    ]
    
    static func name(_ id : Int) -> String {
        ImageAsset.mouths.first { $0.id == id}?.img ?? ""
    }
}

#Preview {
    AngActivityView()
}
