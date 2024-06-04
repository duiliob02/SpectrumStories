//
//  MapView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 03/06/24.
//

import SwiftUI

struct MapView: View {
    @AppStorage("gender") var gender = 42
    
    // to do: navigazione carta quiz
    let houses = housesData
    
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
                    JoyPath()
                        .frame(width: w/2.3, height: h/2.3)
                        .position(CGPoint(x: w/2.5, y: h*0.22))
                    NavigationLink {
                        HouseView()
                    } label: {
                        Image("JoyHouse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: w*0.23)
                            .position(CGPoint(x: w*0.225, y: h/4.8))
                    }
                    NavigationLink {
                        HouseView()
                    } label: {
                        Image("SadnessHouse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: w*0.23)
                            .position(CGPoint(x: w/1.165, y: h*0.23))
                    }
                    NavigationLink {
                        HouseView()
                    } label: {
                        Image("AngerHouse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: w*0.23)
                            .position(CGPoint(x: w*0.135, y: h/1.75))
                    }
                    NavigationLink {
                        HouseView()
                    } label: {
                        Image("FearHouse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: w*0.23)
                            .position(CGPoint(x: w/1.135, y: h/1.46))
                    }
                        
                }
                
            }
            .ignoresSafeArea()
            
        }
        .onAppear{
            print(houses)
        }
    }
}

struct JoyPath : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.97314*width, y: 0.60884*height))
        path.addCurve(to: CGPoint(x: 0.93285*width, y: 0.00227*height), control1: CGPoint(x: 1.01877*width, y: 0.54667*height), control2: CGPoint(x: 0.97934*width, y: 0.18821*height))
        path.addLine(to: CGPoint(x: 0.93285*width, y: 0.56803*height))
        path.addCurve(to: CGPoint(x: 0.59091*width, y: 0.93651*height), control1: CGPoint(x: 0.84557*width, y: 0.54958*height), control2: CGPoint(x: 0.56095*width, y: 0.57256*height))
        path.addCurve(to: CGPoint(x: 0.00207*width, y: 0.87868*height), control1: CGPoint(x: 0.45837*width, y: 1.00836*height), control2: CGPoint(x: 0.17741*width, y: 0.90041*height))
        path.addCurve(to: CGPoint(x: 0.64773*width, y: 0.98073*height), control1: CGPoint(x: 0.3343*width, y: 1.00113*height), control2: CGPoint(x: 0.57094*width, y: 1.00869*height))
        path.addCurve(to: CGPoint(x: 0.97314*width, y: 0.60884*height), control1: CGPoint(x: 0.57438*width, y: 0.52041*height), control2: CGPoint(x: 0.94318*width, y: 0.64966*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    MapView()
}
