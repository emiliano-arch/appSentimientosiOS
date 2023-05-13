//
//  BitacoraSentimientos.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 10/05/23.
//

import SwiftUI
import CoreData

struct BitacoraSentimientos: View {
    @Environment(\.presentationMode) var presentationModeTarea
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var sesion: Sesion
    @EnvironmentObject var funciones: FuncionesGenerales

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        //TODO: implementar vista de detalle
                        
                        DetalleBitacora(objContenedor: item)
                        
                    } label: {
                        HStack{
                            
                            if item.nombre != nil{
                                Text(funciones.emoji(Int(item.sentimiento_img)))
                            }
                            if item.nombre != nil{
                                Text("|   "+item.nombre!)
                            }
                            Spacer()
                            Text(item.timestamp!, formatter: funciones.itemFormatter)
                            
                        
                        }
                        
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .background(Image("fondoEdif").resizable())
            .scrollContentBackground(.hidden)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {presentationModeTarea.wrappedValue.dismiss()}) {
                        Label("Cerrar sesion", systemImage: "rectangle.portrait.and.arrow.forward.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .frame(width: 70)
                        .foregroundColor(.blue)
                        
                }
                
            }
            
            
        }
    }
    

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

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


struct DetalleBitacora: View{
    var objContenedor : Item
    @EnvironmentObject var sesion: Sesion
    @EnvironmentObject var funciones: FuncionesGenerales

    var body: some View{
        
        VStack{
            IconoSeleccionado(mensajeIcono: funciones.emoji(Int(objContenedor.sentimiento_img)))
                .frame( height: 100, alignment: .center)
                
            Spacer()
            CajaMostrarTexto(texto: objContenedor.nombre!,num:30).disabled(true)
                .background()
                .cornerRadius(70)
                .multilineTextAlignment(.center)
                
            //texto
            CajaMostrarTexto(texto: objContenedor.descripcion!).disabled(true)
                .font(.body)
                .bold()
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()
        }
        .background(Image("fondoRio").resizable())
        .scrollContentBackground(.hidden)

    }

}



struct BitacoraSentimientos_Previews: PreviewProvider {
    static var previews: some View {
        BitacoraSentimientos().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(Sesion())
            .environmentObject(FuncionesGenerales())
    }
}

