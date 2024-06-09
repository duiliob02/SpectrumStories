//
//  AngActivityView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 08/06/24.
//

import SwiftUI

struct AngActivityView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(.bgAct)
                VStack {
                    Text("ricostruisci\nl'emozione")
                        .textCase(.uppercase)
                        .multilineTextAlignment(.center)
                        .font(.custom(Constants.font, size: 60))
                    Image("AngEyes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/2.7)
                    ScrollView(.horizontal) {
                        angerActView(imgName: "AngMouth", width: geo.size.width)
                        angerActView(imgName: "SadMouth", width: geo.size.width)
                    }
                    
                    
                    
                }
            }
        }
    }
    
    private func angerActView(imgName: String, width: CGFloat) -> some View {
        Image(imgName)
            .resizable()
            .scaledToFit()
            .frame(width: width/2.7)
    }
}

#Preview {
    AngActivityView()
}
