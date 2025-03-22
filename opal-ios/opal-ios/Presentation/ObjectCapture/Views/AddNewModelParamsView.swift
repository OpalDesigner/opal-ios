//
//  AddNewModelParamsView.swift
//  opal-ios
//
//  Created by Cynara Costa on 22/03/25.
//

import SwiftUI

struct AddNewModelParamsView: View {
    @ObservedObject var viewModel: ObjectCaptureViewModel
    @ObservedObject var filtersViewModel: FilterViewModel
    
    var body: some View {
        VStack {
            OpalTextField(placeholder: "Model Name", text: $viewModel.modelName, style: .primary, isSecure: false)
                .padding(.vertical, 16)
                
            
            OpalPicker(
                placeholder: "Category",
                selection: $viewModel.modelCategory,
                options: filtersViewModel.filters.dropFirst().map { $0 },
                style: .primary
            )
            
            Spacer()
            NavigationLink(destination: ObjectCaptureCreationView()) {
                OpalButton(title: "Create model", style: .primary)
            }
        }.padding()
    }
}
