//
//  Login.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 10/05/23.
//

import SwiftUI

struct Login: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Bienvenido a tu diario 100% personal de emociones.")
                .font(.largeTitle)
                .foregroundColor(Color(hue: 0.577, saturation: 0.97, brightness: 0.957, opacity: 0.589))
                .multilineTextAlignment(.center)
                .bold()
                
            Spacer()
            VistaLogin().environmentObject(Sesion())
                
        }
       
    }
}




struct VistaLogin: View{
    @EnvironmentObject var sesion: Sesion
    @State var show = false
    
    var body: some View {
        
        VStack {
            Button(action: {
                
                if (sesion.isLogin){
                    sesion.cerrarSesion()
                } else {
                    sesion.iniciarSesion()
                    show.toggle()
                        
                    //presentationModeTarea.wrappedValue.dismiss()
                }
            }, label: {
                if (sesion.isLogin){
                    Text("Cerrar sesion").font(.largeTitle)
                } else {
                    Text("iniciar sesion").font(.largeTitle)
                }
        }).fullScreenCover(isPresented: $show, content: {
            tabBarControllerPrincipal()
                .environmentObject(FuncionesGenerales())
        })
            
        }
        
        
    }
}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

