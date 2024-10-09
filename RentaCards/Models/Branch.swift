//
//  Branch.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//

import Foundation
struct Branch {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
}

let branchesList = [
    Branch(id: 1, name: "Sucursal Centro", latitude: 19.4326, longitude: -99.1332),
    Branch(id: 2, name: "Sucursal Norte", latitude: 34.6037, longitude: -58.3816),
    Branch(id: 3, name: "Sucursal Sur", latitude: 40.7128, longitude: -74.0060)
]
