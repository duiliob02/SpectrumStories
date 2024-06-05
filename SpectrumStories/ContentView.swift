//
//  ContentView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import SwiftUI

struct ContentView: View {
    var houses : [AnyHouse] = housesData
    var body: some View {
        LogoView()
    }
}

#Preview {
    ContentView()
}
