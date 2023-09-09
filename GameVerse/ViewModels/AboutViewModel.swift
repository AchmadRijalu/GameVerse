//
//  AboutViewModel.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 09/09/23.
//

import Foundation

class AboutViewModel: ObservableObject {
    @Published var aboutData = SharedMethods().loadAboutDataFromUserDefaults(forKey: "aboutKey")
    ?? AboutModel(name: "Achmad Rijalu", description: "iOS Developer Intern at Apple Developer Academyhh @UC")
}
