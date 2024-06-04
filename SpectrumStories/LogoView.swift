//
//  LogoView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 19/05/24.
//

import SwiftUI

struct LogoView: View {
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color.giallio)
                
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.size.width/1.5)
                        .padding(.bottom, 20)
                    
                    NavigationLink {
                        GenderView()
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
