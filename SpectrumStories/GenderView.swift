//
//  GenderView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 19/05/24.
//

import SwiftUI

struct GenderView: View {
    @State private var showAlert = false
    @AppStorage("gender") var gender : Int = 42
    let houses = housesData
    @State private var tempGen = 42
    @State private var navigate = false
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Rectangle()
                    .fill(Color.verdio)
                VStack{
                    Text("con chi vuoi giocare?")
                        .textCase(.uppercase)
                        .padding(.top)
                    
                    HStack(spacing: 10) {
                        Button(action: {
                            withAnimation {
                                tempGen = 0
                                showAlert.toggle()
                            }
                        }, label: {
                            VStack{
                                Image("male")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width/4.5)
                                Text("JOE")
                            }
                        })
                        
                        Button(action: {
                            withAnimation {
                                tempGen = 1
                                showAlert.toggle()
                            }
                            
                        }, label: {
                            VStack{
                                Image("female")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width/3.5)
                                Text("MIA")
                                
                            }
                        })
                        
                    }
                }
                .padding()
            }
            .foregroundStyle(Color(hex: "2F2F2F"))
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            .overlay {
                if showAlert{
                    
                    ZStack {
                        Rectangle()
                            .fill(.white.opacity(0.5))
                            .ignoresSafeArea()
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundStyle(.verdio)
                            .frame(width: geo.size.width/2, height: geo.size.height/2)
                        VStack(spacing:50){
                            Text("Confermi la\nscelta?".uppercased())
                                .multilineTextAlignment(.center)
                                .padding(.bottom)
                            HStack(spacing:50) {
                                ZStack {
                                    // Bottom layer
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(Color(hex: "A54F00"))
                                        .frame(width: geo.size.width/7, height: geo.size.height/9)
                                        .offset(x: 6, y: 6)
                                    
                                    // Top layer
                                        Text("SI")
                                            .foregroundColor(.white)
                                            .font(.custom(Constants.font, size: 60))
                                            .padding()
                                            .frame(width: geo.size.width/7, height: geo.size.height/9)
                                            .background(
                                                Color(hex: "E26D5A")
                                            )
                                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                                            
                                    
                                }
                                .onTapGesture {
                                    gender = tempGen
                                    navigate=true
                                    
                                }
                                .navigationDestination(isPresented: $navigate) {
                                    MapView(houses: housesData)
                                }
                                
                                
                                
                                TreDButton(title: "NO", action: {
                                    withAnimation {
                                        showAlert.toggle()
                                    }
                                }, w: geo.size.width/7, h: geo.size.height/9)
                                
                            }
                            
                        }
                    }
                    
                }
            }
        }
        .font(.custom(Constants.font, size: 60))
    }
}

#Preview {
    GenderView()
}
