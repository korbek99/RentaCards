//
//  Reservation.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//

import Foundation

struct Reservation {
    let customer: Int
    let carId: Int
    let startDate: Date
    let endDate: Date
}
let reservation = Reservation(customer: 1, carId: 1, startDate: Date(), endDate: Date().addingTimeInterval(86400 * 3))

