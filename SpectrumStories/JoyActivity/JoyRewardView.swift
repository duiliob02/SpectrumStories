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
        Image("JoyReward")
            .onTapGesture {
                navigate = true
            }
            .navigationDestination(isPresented: $navigate) {
                MapView(houses: housesData)
            }
    }
}

#Preview {
    JoyRewardView()
}
