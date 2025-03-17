import SwiftUI
import Combine

import SwiftUI
import Combine

enum HomeViewState {
    case loading
    case success([ModelCardViewModel])
    case error(String)
}

final class HomeViewModel: ObservableObject {
    @Published var state: HomeViewState = .loading
    @Published var search: String = ""
    
    private let user: AuthUserEntity
    private let sessionManager: SessionManager
    
    private let getAllModelsUseCase: GetAllModelsUseCase
    private let downloadAssetDataUseCase: DownloadAssetDataUseCase
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        user: AuthUserEntity,
        sessionManager: SessionManager,
        getAllModelsUseCase: GetAllModelsUseCase = GetAllModelsUseCaseImpl(repository: ModelAssetRepositoryImpl()),
        downloadAssetDataUseCase: DownloadAssetDataUseCase = DownloadAssetDataUseCaseImpl(repository: ModelAssetRepositoryImpl())
    ) {
        self.user = user
        self.sessionManager = sessionManager
        self.getAllModelsUseCase = getAllModelsUseCase
        self.downloadAssetDataUseCase = downloadAssetDataUseCase
    }
    
    func signOut() {
        sessionManager.signOut()
    }
    
    func loadAllObjects() {
        state = .loading
        
        getAllModelsUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.state = .error("Error fetching models: \(error.localizedDescription)")
                case .finished:
                    break
                }
            } receiveValue: { assets in
                let models = assets.map { model in
                    ModelCardViewModel(
                        model: model,
                        downloadAssetDataUseCase: self.downloadAssetDataUseCase
                    )
                }
                self.state = .success(models)
            }
            .store(in: &cancellables)
    }
}
