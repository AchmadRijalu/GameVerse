//
//  APIRepository.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 25/08/23.
//

import Foundation
import Combine
import Alamofire
protocol APIRepositoryProtocol {
    func fetchGameList() -> AnyPublisher<DataResponse<GameListModel, NetworkError>, Never>
    func fetchGameDetail(_ id: Int) -> AnyPublisher<DataResponse<GameDetailModel, NetworkError>, Never>
}
class APIRepository {
    static let shared: APIRepositoryProtocol = APIRepository()
    private init(){}
}
extension APIRepository: APIRepositoryProtocol {
    //MARK: - GET THE GAME DETAIL API
    func fetchGameDetail(_ id: Int) -> AnyPublisher<DataResponse<GameDetailModel, NetworkError>, Never> {
        let key = "b1494a83929f42e48dfed97ef6f5c956"
        let url = URL(string: "https://api.rawg.io/api/games/\(id)?key=\(key)")!
        return AF.request(url, method: .get, parameters: nil, headers: [:]).validate().publishDecodable(type: GameDetailModel.self).map {
            response in response.mapError {
                error in
                let backendError = response.data.flatMap {
                    try? JSONDecoder().decode(BackendError.self, from: $0)
                }
                return NetworkError(initialError: error, backendError: backendError)
            }
        }.receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    //MARK: - GET THE GAME LIST API
    func fetchGameList() -> AnyPublisher<DataResponse<GameListModel, NetworkError>, Never> {
        let key = "b1494a83929f42e48dfed97ef6f5c956"
        let url = URL(string: "https://api.rawg.io/api/games?key=\(key)")!
        return AF.request(url, method: .get, parameters: nil, headers: [:]).validate().publishDecodable(type: GameListModel.self).map {
            response in response.mapError {
                error in
                let backendError = response.data.flatMap {
                    try? JSONDecoder().decode(BackendError.self, from: $0)
                }
                return NetworkError(initialError: error, backendError: backendError)
            }
        }.receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
