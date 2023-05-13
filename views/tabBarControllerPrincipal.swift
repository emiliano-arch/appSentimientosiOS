//
//  tabBarControllerPrincipal.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 10/05/23.
//

import SwiftUI

struct tabBarControllerPrincipal: View {
    let persistenceController = PersistenceController.shared
    @EnvironmentObject var sesion: Sesion
    @EnvironmentObject var funciones: FuncionesGenerales
    
    var body: some View {
        
        TabView{
            
            grids()
                .tabItem{
                    Text("nuevo sentimiento")
                    Image(systemName: "arrow.up.heart.fill")
                        .colorInvert()
                }
            
            BitacoraSentimientos().environment(\.managedObjectContext, persistenceController.container.viewContext)
                //.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            
                .tabItem{
                    Text("Bitacora")
                    Image(systemName: "book.closed.fill").foregroundColor(.blue)
                }
        }
    }
}

struct tabBarControllerPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        tabBarControllerPrincipal()
            .environmentObject(Sesion())
            .environmentObject(FuncionesGenerales())
    }
}
