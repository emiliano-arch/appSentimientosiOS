//
//  DetalleSentimiento.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 11/05/23.
//

import SwiftUI

struct DetalleSentimiento: View {
    let persistenceController = PersistenceController.shared
    var emoji : Int64
    @EnvironmentObject var sesion: Sesion
    @EnvironmentObject var funciones: FuncionesGenerales
    @ObservedObject var newEmocion: EmocionTemp = EmocionTemp()
    
    //funciones.setImg(imgHexadecimal: Int64(String(format: "%04X", mensajeIcono.unicodeScalars.first?.value ?? 0)) ?? 0x1f644)
    var body: some View{
        ZStack{
            
            VStack{
                IconoSeleccionado(mensajeIcono: funciones.emoji(Int(emoji)) )
                    .frame(height: 100)
                
                CajaEditarTexto(texto: newEmocion,num: 30, placeholder: "Describe el sentimiento en una palabra", opcion: "nombre")
                    
                    
                    
                //texto
                CajaEditarTexto(texto: newEmocion,num: 400, placeholder: "Describe el sentimiento o los detonantes de este", opcion: "descripcion")
                
                //Boton guardar
                BotonGuardarTexto(newEmocion: newEmocion, img: emoji).environment(\.managedObjectContext, persistenceController.container.viewContext)
                    //.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("")
            }
            
        }
        
    }
}

struct DetalleSentimiento_Previews: PreviewProvider {
    static var previews: some View {
        DetalleSentimiento(emoji: 0x1f600)
            .environmentObject(Sesion())
            .environmentObject(FuncionesGenerales())
            
    }
}
