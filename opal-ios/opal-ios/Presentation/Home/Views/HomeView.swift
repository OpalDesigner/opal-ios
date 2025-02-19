import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                OpalText(text: "Find the best models for you", style: .headingOne)
                    .frame(maxWidth: .infinity)
                    .safeAreaPadding(.vertical)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.models, id: \.model.name) { modelViewModel in
                            NavigationLink(destination: {
                                ARModelScreen(model: modelViewModel.model)
                                
                            }) {
                                ModelCardView(
                                    viewModel: modelViewModel
                                )
                            }.tint(context.colors.font.one)
                        }
                    }
                    .padding()
                }
                
                Spacer()
                OpalButton(title: "Sign Out", style: .secondary, action: viewModel.signOut)
                    .padding(.horizontal)
            }
            .navigationBarHidden(true)
        }
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
