//
//  JoyActView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import SwiftUI

struct JoyActView: View {
    
    @State private var faces = facesJoyAct
    @State private var taskCompleted = false
    @State private var countFaces = 0
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
   
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("TROVA TUTTE LE FACCE FELICI")
                    .font(.custom(Constants.font, size: 60))
                
                LazyVGrid(columns: columns) {
                    ForEach(faces) { face in
                                    Image(face.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geo.size.width/4)
                                        .onTapGesture(perform: {
                                            if face.correct{
                                                face.tapped = true
                                                countFaces += 1
                                                if countFaces == 3 {
                                                    taskCompleted.toggle()
                                                }
                                            }
                                            
                                        })
                                        .overlay {
                                            if face.tapped{
                                                Image(systemName: "xmark")
                                                    .resizable()
                                                    .scaledToFit()
                                            }
                                        }
                                    
                                }
                    }
            }
                if countFaces == 3 {
                    AlertView(alert: AlertModel(imageM: "StickerM1", imageF: "StickerF1", testo: "Congratulazioni!\nOra torniamo alla mappa!", azione: "Ok", bgRectColor: .giallio), showAlert: $taskCompleted, nextView: MapView(houses: housesData), lastQuestion: true)
                }
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    JoyActView()
}
