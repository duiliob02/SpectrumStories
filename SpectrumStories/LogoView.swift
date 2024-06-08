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
            GeometryReader { geo in
                ZStack {
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                    VStack{
                        Image("nomeApp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width/1.5)
                            .padding(.bottom, 50)
                        
                        NavigationLink {
                            if gender != 42 {
                                MapView(houses: housesData)
                            } else {
                                GenderView()
                            }
                        } label: {
                            ZStack {
                                // Bottom layer
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color(hex: "A54F00"))
                                    .frame(width: geo.size.width/3, height: geo.size.height/8)
                                    .offset(x: 6, y: 6)
                                
                                // Top layer
                                    Text("INIZIA")
                                        .foregroundColor(.white)
                                        .font(.custom(Constants.font, size: 60))
                                        .padding()
                                        .frame(width: geo.size.width/3, height: geo.size.height/8)
                                        .background(
                                            Color(hex: "E26D5A")
                                        )
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                                        
                                
                            }
                        }
                        
                        
                        
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    LogoView()
}
