//
//  AngActivityPresentationView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 07/06/24.
//

import SwiftUI

struct AngActivityPresentationView: View {
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
                    
                    angerActView(imgName: "AngEyes", width: geo.size.width)
                    angerActView(imgName: "AngMouth", width: geo.size.width)
                    
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
    AngActivityPresentationView()
}
