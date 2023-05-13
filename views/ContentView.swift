//
//  ContentView.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 06/05/23.
//
/*
import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext)  var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    
     var items: FetchedResults<Item>
  

    var body: some View {
        NavigationView {
    
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        HStack{
                            Text("1")
                            if let img = Int?(Int(item.sentimiento_img)){
                                Text(emoji(Int(item.sentimiento_img)))
                            }
                            
                            Text(item.timestamp!, formatter: itemFormatter)
                            
                            if let nombre = item.nombre{
                                Text(item.nombre!)
                            }
                            if let descripcion = item.descripcion{
                                Text(item.descripcion!)
                            }
                            
                            
                        }
                        
                    }
                }
                .onDelete(perform: itemObj.deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: itemObj.addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }

}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
