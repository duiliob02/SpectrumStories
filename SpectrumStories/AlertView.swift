//
//  AlertView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 23/05/24.
//

import SwiftUI
import PopupView

struct AlertView: View {
    var alert : AlertModel
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            VStack {
                Image((alert.gender==0) ? alert.imageM : alert.imageF)
                    .resizable()
                    .scaledToFit()
                    .frame(width: w/3, height: h/3)
                Text(alert.testo.uppercased())
                    .multilineTextAlignment(.center)
                
                if alert.risposta == 0 {
                    Text(alert.azione.uppercased())
                        .foregroundStyle(.black)
                        .padding(25)
                        .background{
                            Capsule()
                                .foregroundStyle(.white)
                                .frame(width: w/3)
                        }
                        .padding()
                } else {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Text(alert.azione.uppercased())
                            .foregroundStyle(.black)
                            .padding(25)
                            .background{
                                Capsule()
                                    .foregroundStyle(.white)
                                    .frame(width: w/3)
                            }
                    }
                    
                }
            }
            .font(.custom(Constants.font, size: 50))
            .background{
                RoundedRectangle(cornerRadius: 30.0)
                    .foregroundStyle(alert.bgRectColor)
                    .frame(width: w/1.7, height: h/1.6)
            }
            .position(x:geo.size.width/2, y: geo.size.height/2)
        }
        
    }
}

#Preview {
    AlertView(alert: AlertModel( risposta: 0, imageM: "StickerM0", imageF: "StickerF", gender: 0, testo: "PROVIAMO DI NUOVO", azione: "Riprova", bgRectColor: .giallio))
}
