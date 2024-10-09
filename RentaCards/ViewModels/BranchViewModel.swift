//
//  BranchViewModel.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-24.
//

import Foundation

class BranchViewModel {
    private var branches: [Branch] = branchesList
    var filteredBranches: [Branch] = []
    
    var isSearching = false
    
    func filterBranches(with searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredBranches = branches
        } else {
            isSearching = true
            filteredBranches = branches.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func numberOfBranches() -> Int {
        return isSearching ? filteredBranches.count : branches.count
    }
    
    func branch(at index: Int) -> Branch {
        return isSearching ? filteredBranches[index] : branches[index]
    }
    
    func branchImageURL(at index: Int) -> String {
        return branch(at: index).image
    }
}

