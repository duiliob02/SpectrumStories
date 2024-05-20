//
//  JoyHouseView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 20/05/24.
//

import SwiftUI

struct JoyHouseView: View {
    var gender : Int = UserDefaults.standard.value(forKey: "gender") as! Int
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("JoyHouseBG")
                    .resizable()
                    .scaledToFill()
                Image((gender == 0) ? "male" : "female")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.height/5)
                    .position(CGPoint(x: geo.size.width/10, y: geo.size.height/1.3))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    JoyHouseView(gender: 0)
}
