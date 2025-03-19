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

    init(filters: [OpalFilterEntity]) {
        self.filters = filters
    }

    func toggleFilter(at index: Int) {
        if index == 0 {
            showModal = true
        } else {
            filters[index].style = (filters[index].style == .selected) ? .unselected : .selected
        }
    }
}
