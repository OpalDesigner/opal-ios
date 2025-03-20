//
//  FiltersViewModel.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/03/25.
//

import SwiftUI


class FilterViewModel: ObservableObject {
    @Published var filters: [OpalFilterEntity]
    @Published var showModal = false
    @Published var selectedFilterIndex: Int? = nil

    init(filters: [OpalFilterEntity]) {
        self.filters = filters
    }

    func toggleFilter(at index: Int) {
        if selectedFilterIndex == index {
            filters[index].style = .unselected
            selectedFilterIndex = nil
            
            if index == 0 {
                showModal = false
            }
        } else {
            if let previousIndex = selectedFilterIndex {
                filters[previousIndex].style = .unselected
            }

            filters[index].style = .selected
            selectedFilterIndex = index

            if index == 0 {
                showModal = true
            }
        }
    }
    
    func deselectFilter(at index: Int) {
        if selectedFilterIndex == index {
            filters[index].style = .unselected
            selectedFilterIndex = nil
        }
    }
}
