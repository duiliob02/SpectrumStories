//
//  AngActivityView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 10/06/24.
//

import SwiftUI

struct AngActivityView: View {
    @State private var selectedMouth : String = ""
    @State private var correctPair : Bool? = nil
    @State private var currentEyes = "AngEyes"
    @State private var mouthIndex : Int?
    
    let eyesArray = ["AngEyes", "FearEyes", "SadEyes", "JoyEyes"]
    let mouthArray = ["AngMouth", "FearMouth", "SadMouth", "JoyMouth"]
    
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
                            ForEach(mouthArray, id: \.self) { mouth in
                                showAsset(img: mouth, w: geo.size.width)
                                    .containerRelativeFrame(.horizontal)
                                    
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollPosition(id: $mouthIndex)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    
                    Button {
                        print(mouthIndex!)
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
            }
            .ignoresSafeArea()
            
        }
        .onAppear {
            if mouthIndex == nil {
                mouthIndex = 0
            }
        }
        .onChange(of: mouthIndex ?? 0) {
            oldValue, newValue in
            selectedMouth = mouthArray[newValue]
        }
        
    }
    
    private func showAsset(img: String, w: CGFloat) -> some View {
        Image(img)
            .resizable()
            .scaledToFit()
            .frame(width: w/2.4)
    }
}

#Preview {
    AngActivityView()
}
