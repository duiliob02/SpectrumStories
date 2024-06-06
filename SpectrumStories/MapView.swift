//
//  MapView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 03/06/24.
//

import SwiftUI

struct MapView: View {
    @AppStorage("gender") var gender = 42
    
    var houses: [AnyHouse]
    
    @State private var nav1 = false
    @State private var nav2 = false
    @State private var nav3 = false
    @State private var nav4 = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                
                let w = geo.size.width
                let h = geo.size.height
                
                ZStack {
                    Image("Map")
                        .resizable()
                        .frame(width: w, height: h)
                    Image((gender == 0) ? "StickerM1" : "StickerF1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: w*0.23)
                        .position(CGPoint(x: w/1.75, y: h*0.125))
                    
                    //                    ForEach(houses.indices, id: \.self) { index in
                    //                        let house = houses[index]
                    //                        let position = position(index: index, w: w, h: h)
                    //
                    //                        NavigationLink(destination: house.houseView) {
                    //                            Image(houseImageName(for: index))
                    //                                .resizable()
                    //                                .scaledToFit()
                    //                                .frame(width: w*0.23)
                    //                                .position(position)
                    //                        }
                    //                    }
                    houseView(index: 0, width: w, height: h, position: CGPoint(x: w * 0.225, y: h / 4.8), isPresented: $nav1)
                    houseView(index: 1, width: w, height: h, position: CGPoint(x: w / 1.165, y: h * 0.23), isPresented: $nav2)
                    houseView(index: 2, width: w, height: h, position: CGPoint(x: w * 0.135, y: h / 1.75), isPresented: $nav3)
                    houseView(index: 3, width: w, height: h, position: CGPoint(x: w / 1.135, y: h / 1.46), isPresented: $nav4)
                    
                    
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
    
    func houseView(index: Int, width: CGFloat, height: CGFloat, position: CGPoint, isPresented: Binding<Bool>) -> some View {
            Image(houseImageName(for: index))
                .resizable()
                .scaledToFit()
                .frame(width: width * 0.23)
                .position(position)
                .onTapGesture {
                    isPresented.wrappedValue.toggle()
                }
                .navigationDestination(isPresented: isPresented) {
                    HouseView<AnyView>(house: houses[index].house)
                }
        }
    
    func houseImageName(for index: Int) -> String {
        switch index {
        case 0:
            return "JoyHouse"
        case 1:
            return "SadnessHouse"
        case 2:
            return "AngerHouse"
        case 3:
            return "FearHouse"
        default:
            return ""
        }
    }
    
    func position(index: Int, w: CGFloat, h: CGFloat) -> CGPoint {
        switch index {
        case 0:
            return CGPoint(x: w*0.225, y: h/4.8)
        case 1:
            return CGPoint(x: w/1.165, y: h*0.23)
        case 2:
            return CGPoint(x: w*0.135, y: h/1.75)
        case 3:
            return CGPoint(x: w/1.135, y: h/1.46)
        default:
            return .zero
        }
    }
}



//#Preview {
//    MapView(houses: [])
//}
