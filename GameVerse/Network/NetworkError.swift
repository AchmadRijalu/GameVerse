//
//  NetworkError.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 04/09/23.
//

import Foundation
import Alamofire

struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
