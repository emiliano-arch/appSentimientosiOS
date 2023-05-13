//
//  ControlerEmociones.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 10/05/23.
//

import Foundation
import SwiftUI



class EmocionTemp: ObservableObject{
    
    @Published var nombre : String = ""
    @Published var descripcion : String = ""
    @Published var imgHexa : Int64 = 0x1f600
    
    
}

class FuncionesGenerales: ObservableObject{
    
    
    func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
    
     let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
}

class Sesion: ObservableObject {
    @Published var isLogin: Bool = false
    
    func cerrarSesion() {
        isLogin = false
    }
    
    func iniciarSesion() {
        isLogin = true
    }
}
