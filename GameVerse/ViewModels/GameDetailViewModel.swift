//
//  GameDetailViewModel.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 05/09/23.
//

import Foundation
import Combine
class GameDetailViewModel: ObservableObject {
    @Published var gameDetailLoadingError: String = ""
    @Published var gameDetail: GameDetailModel?
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: APIRepositoryProtocol
    init(dataManager: APIRepositoryProtocol = APIRepository.shared) {
        self.dataManager = dataManager
    }
    func getGameDetail(id: Int) {
        isLoading = true
        dataManager.fetchGameDetail(id).sink {
            (dataResponse) in
            if dataResponse.error != nil {
                self.createAlert(with: dataResponse.error!)
            }
            else {
                //                self.gameListResult = dataResponse.value!.
                self.gameDetail = dataResponse.value
                self.isLoading = false
            }
        }.store(in: &cancellableSet)
    }
    func createAlert(with error: NetworkError) {
        gameDetailLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}
