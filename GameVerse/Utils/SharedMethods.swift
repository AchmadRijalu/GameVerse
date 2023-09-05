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
}
