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
    @Published var filters: [OpalFilterEntity] = []
    

    @Published var selectedCategory: String? = nil
    private var allModels: [ModelCardViewModel] = []
    
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    
    private let user: AuthUserEntity
    private let sessionManager: SessionManager
    
    private let getAllModelsUseCase: GetAllModelsUseCase
    private let downloadAssetDataUseCase: DownloadAssetDataUseCase
    private let modelAssetRepository: ModelAssetRepositoryImpl
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        user: AuthUserEntity,
        sessionManager: SessionManager,
        getAllModelsUseCase: GetAllModelsUseCase = GetAllModelsUseCaseImpl(repository: ModelAssetRepositoryImpl()),
        downloadAssetDataUseCase: DownloadAssetDataUseCase = DownloadAssetDataUseCaseImpl(repository: ModelAssetRepositoryImpl()),
        modelAssetRepository: ModelAssetRepositoryImpl = ModelAssetRepositoryImpl()
    ) {
        self.user = user
        self.sessionManager = sessionManager
        self.getAllModelsUseCase = getAllModelsUseCase
        self.downloadAssetDataUseCase = downloadAssetDataUseCase
        self.modelAssetRepository = modelAssetRepository
        
        loadFilters()
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

                self.allModels = models
                self.applyFilter()
            }
            .store(in: &cancellables)
    }
    

    func applyFilter() {
        let filteredModels = selectedCategory == nil
            ? allModels
        : allModels.filter { $0.model.category?.lowercased() == selectedCategory?.lowercased() }
        
        self.state = .success(filteredModels)
    }
    
    func loadFilters() {
        let defaultFilter = OpalFilterEntity(
            text: "Filters",
            category: "filters",
            style: .unselected,
            icon: OpalIcon(iconName: context.icons.arrowDown, size: OpalIconSize.extraSmall)
        )
        
        let categories = [
            OpalFilterEntity(text: "Anatomy", category: "anatomy", style: .unselected),
            OpalFilterEntity(text: "Space", category: "space", style: .unselected),
            OpalFilterEntity(text: "Interior Design", category: "interior_design", style: .unselected),
            OpalFilterEntity(text: "Other", category: "other", style: .unselected)
        ]
        
        filters = [defaultFilter] + categories
    }
}
