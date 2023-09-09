//
//  SharedMethods.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 02/09/23.
//

import Foundation
import SwiftUI

struct SharedMethods {
    func openEmailApp() {
        if let url = URL(string: "mailto:achmad.rijalu@gmail.com") {
            UIApplication.shared.open(url)
        }
    }
    func saveAboutDataToUserDefaults(_ data: AboutModel, forKey key: String) {
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(data) {
                UserDefaults.standard.set(encodedData, forKey: key)
            }
        }

        // Function to load AboutModel data from UserDefaults
        func loadAboutDataFromUserDefaults(forKey key: String) -> AboutModel? {
            if let savedData = UserDefaults.standard.data(forKey: key) {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode(AboutModel.self, from: savedData) {
                    return decodedData
                }
            }
            return nil
        }

}
