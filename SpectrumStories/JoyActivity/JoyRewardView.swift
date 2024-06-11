//
//  JoyRewardView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 11/06/24.
//

import SwiftUI

struct JoyRewardView: View {
    @State private var navigate = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hex: "F2D434"))
            VStack{
                HStack {
                    Text("HAI VINTO")
                        .font(.custom(Constants.font, size: 60))
                    Image("JoyRewardName")
                        .padding(.bottom, 15)
                    Text("!")
                        .font(.custom(Constants.font, size: 60))
                }
                Image("JoyReward")
                    .onTapGesture {
                        navigate = true
                    }
                    .navigationDestination(isPresented: $navigate) {
                        MapView(houses: housesData)
                    }
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    JoyRewardView()
}
