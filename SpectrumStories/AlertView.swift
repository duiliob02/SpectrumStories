//
//  AlertView.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 23/05/24.
//

import SwiftUI


struct AlertView < NextView: View >: View {
    var alert : AlertModel
    @Binding var showAlert: Bool
    @ScaledMetric(relativeTo: .body) var scaledPadding: CGFloat = 20
    @AppStorage("gender") var gender = 0
    var nextView : NextView?
    var lastQuestion: Bool?
    
    var body: some View {
        GeometryReader { geo in
        VStack {
            Image((gender==0) ? alert.imageM : alert.imageF)
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width/3)
            Text(alert.testo.uppercased())
                .multilineTextAlignment(.center)
            
            if let _ = lastQuestion {
                NavigationLink {
                    nextView
                } label: {
                    Text(alert.azione.uppercased())
                        .foregroundStyle(.black)
                        .padding(.horizontal, scaledPadding*2.5)
                        .padding(.vertical, scaledPadding*1.5)
                        .background{
                            Capsule()
                                .foregroundStyle(.white)
                        }
                        .padding(scaledPadding)
                }
                
                
            } else {
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
            
        }
        .font(.custom(Constants.font, size: 30, relativeTo: .title))
        .background{
            RoundedRectangle(cornerRadius: 30.0)
                .foregroundStyle(alert.bgRectColor)
                .frame(width: geo.size.width/2)
        }
        .position(CGPoint(x: geo.size.width/2, y: geo.size.height/2))
    }
        
    }
}

//#Preview {
//    AlertView<<#NextView: View#>>(alert: AlertModel( imageM: "StickerM0", imageF: "StickerF", testo: "PROVIAMO DI NUOVO", azione: "Riprova", bgRectColor: .giallio), showAlert: .constant(true))
//}
