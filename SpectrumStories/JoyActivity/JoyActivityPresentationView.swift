//
//  JoyActivityPresentationView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import SwiftUI

struct JoyActivityPresentationView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(.bgAct)
                VStack{
                    Text("TROVA TUTTE LE FACCE FELICI")
                        .font(.custom(Constants.font, size: 60))
                    
                    NavigationLink {
                        JoyActView()
                    } label: {
                        Image("JoyActFace0")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width/2)
                    }

                        
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    JoyActivityPresentationView()
}
