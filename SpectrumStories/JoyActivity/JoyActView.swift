//
//  JoyActView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import SwiftUI

struct JoyActView: View {
    
    @State private var faces = facesJoyAct
    
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
        }
    }
}

#Preview {
    JoyActView()
}
