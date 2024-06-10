//
//  SadActPresentingView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 10/06/24.
//

import SwiftUI

struct SadActPresentingView: View {
    @State private var navigate = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(Color(hex: "FFFBF4"))
                VStack{
                    Text("COMPONI TUTTI I PUZZLE")
                        .font(.custom(Constants.font, size: 60))
                        .padding(.bottom, 100)
                        .foregroundStyle(Color(hex: "181818"))
                    
                    NavigationLink {
                        SadActView()
                    } label: {
                        HStack {
                            Image("Puzzle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width/3)
                            
                            Image("Puzzle_")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width/3.7)
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    SadActPresentingView()
}
