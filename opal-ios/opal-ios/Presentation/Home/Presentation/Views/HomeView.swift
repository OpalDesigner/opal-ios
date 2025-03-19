import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @StateObject var filterViewModel: FilterViewModel
    
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    
    let horizontalPadding = 24.0
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _filterViewModel = StateObject(wrappedValue: FilterViewModel(filters: viewModel.filters))
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                OpalText(text: "Find the best models for you", style: .headingOne)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, horizontalPadding)
                
                OpalTextField(placeholder: "Search", text: $viewModel.search, style: .tertiary, isSecure: false, trailingIcon: context.icons.search, trailingIconColor: context.colors.font.two)
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: horizontalPadding,
                            bottom: 8,
                            trailing: horizontalPadding)
                    )
                
                FilterGridView(
                    viewModel: filterViewModel
                )
                                    .padding(.horizontal, horizontalPadding)
                
                switch viewModel.state {
                case .loading:
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                case .success(let models):
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(models, id: \.model.name) { modelViewModel in
                                NavigationLink(destination: ModelView(model: modelViewModel.model)) {
                                    ModelCardView(viewModel: modelViewModel)
                                }
                            }
                        }
                        .padding()
                    }
                    
                case .error(let message):
                    VStack {
                        Text(message)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button("Retry") {
                            viewModel.loadAllObjects()
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                
                Spacer()
                OpalButton(title: "Sign Out", style: .secondary, action: viewModel.signOut)
                    .padding(.horizontal)
            }
            .navigationBarHidden(false)
        }
        .tint(context.colors.font.one)
        .onAppear {
            viewModel.loadAllObjects()
        }
    }
}

//#Preview {
//    HomeView(
//        viewModel: HomeViewModel(
//            user: AuthUserEntity(id: "", username: ""),
//            sessionManager: SessionManager()
//        )
//    )
//}
