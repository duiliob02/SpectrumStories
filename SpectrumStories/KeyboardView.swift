//
//  KeyboardView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 17/05/24.
//

import SwiftUI

struct KeyboardView: View {
    @State private var nameText : String = ""
    @State private var showAlert = false
    @AppStorage("userName") var userName = ""
    
    let house0 = houseJoy
    let house1 = houseSad
    let houses = housesData
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.verdio)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Come ti chiami?")
                    .textCase(.uppercase)
                    .font(.custom(Constants.font, size: 60))
                    .foregroundStyle(.white)
                
                HStack {
                    TextField("", text: $nameText)
                        .disabled(true)
                        .font(.custom(Constants.font, size: 50))
                        .frame(width: UIScreen.main.bounds.width / 2, height: 80)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                        }
                        .padding(.trailing)
                    Button(action: {
                        showAlert.toggle()
                        userName = nameText
                    }, label: {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 60))
                            .bold()
                            .foregroundStyle(.white)
                            .padding(.vertical)
                            .padding(.horizontal, 30)
                            .background{
                                RoundedRectangle(cornerRadius: 10.0)
                                    .frame(height: 110)
                                
                            }
                    })
                }
                .padding(.bottom, 100)
                
                
                ForEach(0..<KeyBoard._keyboard.count, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<KeyBoard._keyboard[rowIndex].count, id: \.self) { columnIndex in
                            Text(KeyBoard._keyboard[rowIndex][columnIndex])
                                .font(.custom(Constants.font, size: 50))
                                .padding()
                                .background(Color.giallio2)
                                .cornerRadius(5)
                                .onTapGesture {
                                    nameText.append(KeyBoard._keyboard[rowIndex][columnIndex])
                                }
                        }
                    }
                }
                
                HStack{
                    Rectangle()
                        .fill(Color.giallio2)
                        .frame(width: UIScreen.main.bounds.width / 3.5, height: 75)
                        .onTapGesture {
                            nameText.append(" ")
                        }
                    Image(systemName: "delete.left")
                        .font(.system(size: 40))
                        .bold()
                        .padding()
                        .background(Color.giallio2)
                        .onTapGesture {
                            _ = nameText.popLast()
                        }
                    
                }
                .padding()
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .alert("Confirm", isPresented: $showAlert) {
            Button("Cancel", role: .cancel) {
                
            }
            NavigationLink("OK") {
                MapView(house0: house0, house1: house1, houses: houses)
            }
        } message: {
            Text("Are you sure about your choice?")
        }
    }
}

struct KeyBoard {
    static let _keyboard = [
        ["Q", "W", "E","R","T","Y","U","I","O","P"],
        ["A","S","D","F","G","H","J","K","L"],
        ["Z","X","C","V","B","N","M"]
    ]
}


#Preview {
    KeyboardView()
}
