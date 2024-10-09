//
//  Branch.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-19.
//

import Foundation

struct Branch {
    let id: Int
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
}

let branchesList = [
    Branch(id: 1, name: "Sucursal Centro", image: "https://autonoticias.cl/wp-content/uploads/2022/04/Toyota-Fachada-Lionel-Kovacs-scaled.jpeg", latitude: 19.4326, longitude: -99.1332),
    Branch(id: 2, name: "Sucursal Norte", image: "https://www.cronista.com/files/image/469/469793/62d5a7bfc0cfd.jpg", latitude: 34.6037, longitude: -58.3816),
    Branch(id: 3, name: "Sucursal Sur", image: "https://pictures.dealer.com/t/townetoyotanj/1901/7a94df6fbec897ca329b65c0952c290ex.jpg", latitude: 40.7128, longitude: -74.0060)
]
