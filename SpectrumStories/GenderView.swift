//
//  GenderView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 19/05/24.
//

import SwiftUI

struct GenderView: View {
    @State private var showAlert = false
    @AppStorage("gender") var gender : Int = 0
    let houses = housesData
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.verdio)
            VStack{
                Text("scegli il tuo personaggio!")
                    .textCase(.uppercase)
                    .foregroundStyle(Color(hex: "2F2F2F"))
                    .padding(.top)
                    
                HStack(spacing: 10) {
                    Button(action: {
                        gender = 0
                        showAlert.toggle()
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
                        gender = 1
                        showAlert.toggle()
                
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
        .font(.custom(Constants.font, size: 60))
        .foregroundStyle(.white)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .alert("Confirm", isPresented: $showAlert) {
            Button("Cancella", role: .cancel) {
                
            }
            NavigationLink("OK") {
                MapView(houses: houses)
            }
        } message: {
            Text("Sei sicuro della scelta?")
        }
        
    }
}

#Preview {
    GenderView()
}
