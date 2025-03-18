import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    @State private var currentStyle: OpalFilterStyle = .unselected
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                OpalText(text: "Find the best models for you", style: .headingOne)
                    .frame(maxWidth: .infinity)
                    .safeAreaPadding(.vertical)
                
                OpalTextField(placeholder: "Search", text: $viewModel.search, style: .tertiary, isSecure: false, trailingIcon: context.icons.search, trailingIconColor: context.colors.font.two).padding()
                
                OpalFilter(text: "Anatomy", style: currentStyle) {
                    currentStyle = (currentStyle == .selected) ? .unselected : .selected
                    print("CYNARA \(currentStyle)")
                }.padding(.horizontal)
                
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
