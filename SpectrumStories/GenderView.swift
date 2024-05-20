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
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.giallio)
            VStack{
                Text("WHAT'S YOUR GENDER")
                HStack{
                    Button(action: {
                        gender = 0
                        showAlert.toggle()
                    }, label: {
                        VStack{
                            Image("male")
                                .resizable()
                                .scaledToFit()
                                .padding(.trailing, 50)
                            Text("BOY")
                            
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
                                .padding(.trailing, 50)
                            Text("GIRL")
                            
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
            Button("Cancel", role: .cancel) {
                
            }
            NavigationLink("OK") {
                KeyboardView()
            }
        } message: {
            Text("Are you sure about your choice?")
        }
        
    }
}

#Preview {
    GenderView()
}
