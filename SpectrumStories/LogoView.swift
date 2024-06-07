//
//  LogoView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 19/05/24.
//

import SwiftUI

struct LogoView: View {
    @AppStorage("gender") var gender = 42
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                VStack{
                    Image("nomeApp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.size.width/1.5)
                        .padding(.bottom, 20)
                    
                    NavigationLink {
                        if gender != 42 {
                            MapView(houses: housesData)
                        } else {
                            GenderView()
                        }
                    } label: {
                        Image("start")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.size.width/2.5)
                    }
                    
                    
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LogoView()
}
