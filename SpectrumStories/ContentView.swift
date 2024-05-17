//
//  ContentView.swift
//  SpectrumStories
//
//  Created by Duilio Barbato on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var nameText : String = ""
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.giallio)
                .ignoresSafeArea()
            VStack {
                Text("WHAT'S YOUR NAME?")
                    .font(.custom("Coiny-Regular", size: 60))
                    .foregroundStyle(.white)
                
                HStack {
                    TextField("", text: $nameText)
                        .font(.custom("Coiny-Regular", size: 50))
                        .frame(width: UIScreen.main.bounds.width / 2, height: 80)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                        }
                    Button(action: {}, label: {Image(systemName: "circle.fill")})
                }
                .padding(.bottom)
                
                ForEach(0..<KeyBoard._keyboard.count, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<KeyBoard._keyboard[rowIndex].count, id: \.self) { columnIndex in
                            Text(KeyBoard._keyboard[rowIndex][columnIndex])
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
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width / 3.5, height: 50)
                        .onTapGesture {
                            nameText.append(" ")
                        }
                    Image(systemName: "delete.left")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .onTapGesture {
                            _ = nameText.popLast()
                        }
                }
                .padding()
            }
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
    ContentView()
}
