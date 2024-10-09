//
//  Cars.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//

import Foundation

struct Car {
    let id: Int
    let make: String
    let model: String
    let year: Int
    let image: String
    let pricePerDay: Double
    let IdBranch: Int
}

let carsList = [
    Car(id: 1, make: "Toyota", model: "Corolla", year: 2020, image: "https://example.com/toyota_corolla.jpg", pricePerDay: 30, IdBranch: 1),
    Car(id: 2, make: "Ford", model: "Focus", year: 2019, image: "https://example.com/ford_focus.jpg", pricePerDay: 28, IdBranch: 1),
    Car(id: 3, make: "Honda", model: "Civic", year: 2021, image: "https://example.com/honda_civic.jpg", pricePerDay: 35, IdBranch: 2),
    Car(id: 4, make: "Chevrolet", model: "Malibu", year: 2020, image: "https://example.com/chevrolet_malibu.jpg", pricePerDay: 32, IdBranch: 2),
    Car(id: 5, make: "Nissan", model: "Altima", year: 2018, image: "https://example.com/nissan_altima.jpg", pricePerDay: 30, IdBranch: 3),
    Car(id: 6, make: "Hyundai", model: "Elantra", year: 2021, image: "https://example.com/hyundai_elantra.jpg", pricePerDay: 29, IdBranch: 3),
    Car(id: 7, make: "Kia", model: "Optima", year: 2022, image: "https://example.com/kia_optima.jpg", pricePerDay: 33, IdBranch: 1),
    Car(id: 8, make: "Volkswagen", model: "Jetta", year: 2020, image: "https://example.com/volkswagen_jetta.jpg", pricePerDay: 34, IdBranch: 1),
    Car(id: 9, make: "Subaru", model: "Impreza", year: 2019, image: "https://example.com/subaru_impreza.jpg", pricePerDay: 31, IdBranch: 2),
    Car(id: 10, make: "Mazda", model: "3", year: 2020, image: "https://example.com/mazda_3.jpg", pricePerDay: 30, IdBranch: 3),
    Car(id: 11, make: "Chrysler", model: "300", year: 2021, image: "https://example.com/chrysler_300.jpg", pricePerDay: 36, IdBranch: 1),
    Car(id: 12, make: "Dodge", model: "Charger", year: 2020, image: "https://example.com/dodge_charger.jpg", pricePerDay: 38, IdBranch: 2),
    Car(id: 13, make: "Toyota", model: "Camry", year: 2021, image: "https://example.com/toyota_camry.jpg", pricePerDay: 34, IdBranch: 3),
    Car(id: 14, make: "Ford", model: "Mustang", year: 2022, image: "https://example.com/ford_mustang.jpg", pricePerDay: 40, IdBranch: 1),
    Car(id: 15, make: "Honda", model: "Accord", year: 2019, image: "https://example.com/honda_accord.jpg", pricePerDay: 32, IdBranch: 2),
    Car(id: 16, make: "Chevrolet", model: "Impala", year: 2020, image: "https://example.com/chevrolet_impala.jpg", pricePerDay: 33, IdBranch: 3),
    Car(id: 17, make: "Nissan", model: "Sentra", year: 2021, image: "https://example.com/nissan_sentra.jpg", pricePerDay: 27, IdBranch: 1),
    Car(id: 18, make: "Hyundai", model: "Sonata", year: 2022, image: "https://example.com/hyundai_sonata.jpg", pricePerDay: 35, IdBranch: 2),
    Car(id: 19, make: "Kia", model: "Soul", year: 2019, image: "https://example.com/kia_soul.jpg", pricePerDay: 28, IdBranch: 3),
    Car(id: 20, make: "Volkswagen", model: "Passat", year: 2021, image: "https://example.com/volkswagen_passat.jpg", pricePerDay: 36, IdBranch: 1)
]
