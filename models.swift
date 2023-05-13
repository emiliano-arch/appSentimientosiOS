//
//  models.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 10/05/23.
//

import Foundation


struct Emocion: Identifiable {
    var id = UUID()
    var nombre : String
    var imgHexadecimal: Int64
    var descripcion: String
}
