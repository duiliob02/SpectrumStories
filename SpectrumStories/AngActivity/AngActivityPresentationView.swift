//
//  AngActivityPresentationView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 10/06/24.
//

import SwiftUI

struct AngActivityPresentationView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(.bgAct)
                VStack{
                    Text("RICOSTRUISCI L'EMOZIONE")
                        .font(.custom(Constants.font, size: 60))
                        .padding(.bottom, 50)
                    
                    NavigationLink {
                        AngActivityView()
                    } label : {
                        VStack {
                            showAsset(img: "AngEyes", w: geo.size.width)
                            showAsset(img: "AngMouth", w: geo.size.width)
                        }
                    }
                    
                }
            }
            .ignoresSafeArea()
            
        }
    }
    
    private func showAsset(img: String, w: CGFloat) -> some View {
        Image(img)
            .resizable()
            .scaledToFit()
            .frame(width: w/2)
    }
}

#Preview {
    AngActivityPresentationView()
}
