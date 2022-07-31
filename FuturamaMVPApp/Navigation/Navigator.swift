//
//  Navigator.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 29.07.2022.
//

import UIKit

// MARK: - NavigatorProtocol
protocol NavigatorProtocol {
    func createCharactersList(networkService: NetworkService) -> UINavigationController
}

// MARK: - Navigator
class Navigator: NavigatorProtocol {
    
    // MARK: - Properties
    private let appAssembly = AppAssembly()
    
    // MARK: - Methods
    func createCharactersList(networkService: NetworkService) -> UINavigationController {
        let navigationVC = appAssembly.createCharactersList(navigator: self, networkService: networkService)
        
        return navigationVC
    }
}
