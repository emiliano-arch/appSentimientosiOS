//
//  LibsViews.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 11/05/23.
//

import SwiftUI

struct LibsViews: View {
    @ObservedObject var newEmocion : EmocionTemp = EmocionTemp()
    var body: some View {
        VStack{
            ZStack{
                Color.gray
                CajaEditarTexto(texto: newEmocion ,num: 400, placeholder: "Ingresa la descripcion", opcion: "nombre")
                //IconoSeleccionado(mensajeIcono:"A")
            }
            Text(newEmocion.descripcion)
        }
        
        
    }
}

struct LibsViews_Previews: PreviewProvider {
    static var previews: some View {
        LibsViews()
            
            
    }
}



//MARK: libreria de vistas reusadas
struct IconoSeleccionado: View{
    var mensajeIcono : String
    
    var body: some View{
        //texto
        HStack{
            Text(mensajeIcono)
                .font(.largeTitle)
            
        }
        
    }
}

struct CajaEditarTexto: View{
    //@EnvironmentObject var funciones: FuncionesGenerales
    @ObservedObject var texto: EmocionTemp
    var num: CGFloat?
    let placeholder : String
    var opcion : String
    
    var body: some View{
        //texto
        ZStack{
            
            if(opcion == "nombre"){
                TextEditor(text: $texto.nombre)
                    .lineLimit(1)
                    .onTapGesture {
                                        // Ocultar el teclado al presionar "Intro"
                                        hideKeyboard()
                                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                                           .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(height: num)
                    .padding()
                
                
                Text(texto.nombre == "" ? placeholder : texto.nombre)
                                                         
                                    .padding(.leading, 5)
                                    .foregroundColor(Color.gray)
                                    .opacity(texto.nombre == "" ? 1 : 0)

            } else {
                TextEditor(text: $texto.descripcion)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                                           .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(height: num)
                    .padding()
                
                
                Text(texto.descripcion == "" ? placeholder : texto.descripcion)
                                                         
                                    .padding(.leading, 5)
                                    .foregroundColor(Color.gray)
                                    .opacity(texto.descripcion == "" ? 1 : 0)

            }
            

        }
        
    }
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct CajaMostrarTexto: View{
    //@EnvironmentObject var funciones: FuncionesGenerales
    @State var texto: String = ""
    var num: CGFloat?
    
    var body: some View{
        //texto
        TextEditor(text: $texto)

            .frame(height: num)
            .padding()
    }
}
struct BotonGuardarTexto: View{
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @ObservedObject var newEmocion: EmocionTemp
    var img : Int64
    
    @State var labelBoton = "Guardar"
    
    var body: some View{
        
        //Boton guardar
        Button(action: {
            if (newEmocion.nombre == "" && newEmocion.descripcion == ""){
                labelBoton = "No hay datos"
            } else{
                addItem(nombre: newEmocion.nombre, descripcion: newEmocion.descripcion, imgInt64: img)
                presentationMode.wrappedValue.dismiss()
            }
            
            
        }) {
            
            ZStack{
                Color.green
                Text(labelBoton)
                    
            }.frame(width: 100, height: 40)
                .cornerRadius(50)
                .shadow(radius: 20)
            
            
        }
        .foregroundColor(.blue)
    }
    
    private func addItem(nombre: String, descripcion: String, imgInt64: Int64) {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.descripcion = descripcion
            newItem.nombre = nombre
            newItem.sentimiento_img = imgInt64

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
