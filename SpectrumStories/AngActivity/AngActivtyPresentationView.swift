//
//  AngActivtyPresentationView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 11/06/24.
//

import SwiftUI

struct AngActivtyPresentationView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(.bgAct)
                VStack{
                    Text("ricostruisci l'emozione")
                        .textCase(.uppercase)
                        .font(.custom(Constants.font, size: 60))
                        .padding(.bottom, 70)
                    NavigationLink {
                        AngActivityView()
                    } label : {
                        VStack {
                            showAsset(img: "AngEyes", _width: geo.size.width)
                            showAsset(img: "AngMouth", _width: geo.size.width)
                        }
                    }
                }
            }
        }
    }
    
    private func showAsset(img: String, _width: CGFloat) -> some View {
        Image(img)
            .resizable()
            .scaledToFit()
            .frame(width: _width/2.2)
    }
}

#Preview {
    AngActivtyPresentationView()
}
