//
//  CarViewModel.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-24.
//

import Foundation

class CarViewModel {
    var cars: [Car] = carsList 
    var filteredCars: [Car] = []
    
    var isSearching = false


    func filterCars(with searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredCars = cars
        } else {
            isSearching = true
            filteredCars = cars.filter {
                $0.make.lowercased().contains(searchText.lowercased()) ||
                $0.model.lowercased().contains(searchText.lowercased())
            }
        }
    }


    func deleteCar(at index: Int) {
        if isSearching {
            let carToDelete = filteredCars[index]
            filteredCars.remove(at: index)
            if let indexInOriginal = cars.firstIndex(where: { $0.id == carToDelete.id }) {
                cars.remove(at: indexInOriginal)
            }
        } else {
            cars.remove(at: index)
        }
    }

  
    func numberOfCars() -> Int {
        return isSearching ? filteredCars.count : cars.count
    }

 
    func car(at index: Int) -> Car {
        return isSearching ? filteredCars[index] : cars[index]
    }
}
