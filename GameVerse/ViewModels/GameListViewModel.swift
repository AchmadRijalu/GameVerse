//
//  GameListViewModel.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 30/08/23.
//

import Foundation
import Alamofire
import Combine
class GameListviewModel: ObservableObject {
    @Published var gameListResult: [Result] = []
    @Published var gameListGenresResult: [Genre] = []
    @Published var gameListLoadingError: String = ""
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: APIRepositoryProtocol
    init(dataManager: APIRepositoryProtocol = APIRepository.shared) {
        self.dataManager = dataManager
        getGameList()
    }
    func getGameList() {
        isLoading = true
        dataManager.fetchGameList().sink {
            (dataResponse) in
            if dataResponse.error != nil {
                self.createAlert(with: dataResponse.error!)
            }
            else {
                self.gameListResult = dataResponse.value!.results
                self.isLoading = false
            }
        }.store(in: &cancellableSet)
    }
    func createAlert(with error: NetworkError) {
        gameListLoadingError = error.backendError == nil ? error.initialError.localizedDescription :
        error.backendError!.message
        self.showAlert = true
    }
}
