//
//  grids.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 08/05/23.
//

import SwiftUI

struct grids: View {
    @EnvironmentObject var sesion: Sesion
    @EnvironmentObject var funciones: FuncionesGenerales

       var body: some View {
           
               navegador()
           
           
       }

       
}




struct navegador: View{
    @Environment(\.presentationMode) var presentationModeTarea
    @EnvironmentObject var sesion: Sesion
    @EnvironmentObject var funciones: FuncionesGenerales
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
       
    ]
    
    var body: some View{
        
        NavigationView {
            VStack{
                Text("¿Cómo te sientes hoy ?")
                Spacer()
                ScrollView {
                    LazyVGrid(columns: columns) {
                     ForEach(0x1f600...0x1f644, id: \.self) { value in
                         
                         NavigationLink {
                             // a donde se dirige
                             //print("-------\(funciones.emoji(value))---------")
                             DetalleSentimiento(emoji: Int64(value))
                             
                         } label: {
                             
                             
                             ZStack{
                                 Color
                                     .blue
                                     
                                 Text(" \(funciones.emoji(value))")
                                     .font(.largeTitle)


                             }
                             
                             .frame(width: 80, height: 80)
                             .cornerRadius(15)
                             .padding(.horizontal)
                                 
                                 
                         }
                             
                     }
                    }
                }
                
                Spacer()
                Spacer()
                Spacer()
                
            }
            
            
         .navigationTitle("Emociones")
         .toolbar{
             ToolbarItem {
                 Button(action: {presentationModeTarea.wrappedValue.dismiss()}) {
                     Label("Cerrar sesion", systemImage: "rectangle.portrait.and.arrow.forward.fill")
                         .foregroundColor(.red)
                 }
             }
         }
            
    }
        
    }

}

struct grids_Previews: PreviewProvider {
    static var previews: some View {
        grids()
            .environmentObject(Sesion())
            .environmentObject(FuncionesGenerales())
    }
}
