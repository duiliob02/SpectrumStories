//
//  TreDButton.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 08/06/24.
//

import SwiftUI

struct TreDButton: View {
    let title: String
    let action: () -> Void
    let w: CGFloat
    let h: CGFloat
    var body: some View {
        ZStack {
            // Bottom layer
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color(hex: "A54F00"))
                .frame(width: w, height: h)
                .offset(x: 6, y: 6)
            
            // Top layer
            Button(action: action) {
                Text(title.uppercased())
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: w, height: h)
                    .background(
                        Color(hex: "E26D5A")
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                    
            }
        }
        
    }
}

#Preview {
    TreDButton(title: "Ciao", action: {print("pressed")}, w: 200, h: 100)
}
