import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    @Published var models: [ModelCardViewModel] = []
    
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
        getAllModelsUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Erro ao carregar modelos: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { assets in
                self.models = assets.map { model in
                    ModelCardViewModel(
                        model: model,
                        downloadAssetDataUseCase: self.downloadAssetDataUseCase
                    )
                }
            }
            .store(in: &cancellables)
    }
}
