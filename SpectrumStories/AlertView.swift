//
//  AlertView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 23/05/24.
//

import SwiftUI


struct AlertView: View {
    var alert : AlertModel
    @Binding var showAlert: Bool
    @ScaledMetric(relativeTo: .body) var scaledPadding: CGFloat = 20
    @AppStorage("gender") var gender = 0
    
    
    var body: some View {
            VStack {
                Image((gender==0) ? alert.imageM : alert.imageF)
                    .resizable()
                    .scaledToFit()
                Text(alert.testo.uppercased())
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                
                
                    Button(action: {
                        withAnimation(.smooth) {
                            showAlert.toggle()
                        }
                    }, label: {
                        Text(alert.azione.uppercased())
                            .foregroundStyle(.black)
                            .padding(.horizontal, scaledPadding*2.5)
                            .padding(.vertical, scaledPadding*1.5)
                            .background{
                                Capsule()
                                    .foregroundStyle(.white)
                            }
                            .padding(scaledPadding)
                    })
            }
            .font(.custom(Constants.font, size: 50, relativeTo: .title))
            .padding(scaledPadding)
            .background{
                RoundedRectangle(cornerRadius: 30.0)
                    .foregroundStyle(alert.bgRectColor)
            }
        
    }
}

#Preview {
    AlertView(alert: AlertModel( imageM: "StickerM0", imageF: "StickerF", testo: "PROVIAMO DI NUOVO", azione: "Riprova", bgRectColor: .giallio), showAlert: .constant(true))
}
