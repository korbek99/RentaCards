//
//  Cards.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-19.
//

import UIKit

struct Card {
    let id: String
    let number: String
    let namecard: String
    let expirationDate: String
    let cvv: String
    let cardImage: UIImage
    let cardHolderName: String
}

let cards: [Card] = [
    Card(id: "1", number: "**** **** **** 1234", namecard: "Visa", expirationDate: "12/25", cvv: "123", cardImage: UIImage(named: "visa")!, cardHolderName: "Juan Pérez"),
    Card(id: "2", number: "**** **** **** 5678", namecard: "MasterCard", expirationDate: "03/26", cvv: "456", cardImage: UIImage(named: "mastercard")!, cardHolderName: "Juan Pérez"),
    Card(id: "3", number: "**** **** **** 9012", namecard: "Prepago", expirationDate: "08/24", cvv: "789", cardImage: UIImage(named: "Debito")!, cardHolderName: "Juan Pérez")
]

