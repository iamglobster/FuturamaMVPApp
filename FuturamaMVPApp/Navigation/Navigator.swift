//
//  Navigator.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 29.07.2022.
//

import UIKit

// MARK: - NavigatorProtocol
protocol NavigatorProtocol {
    func createCharactersList() -> UINavigationController
}

// MARK: - Navigator
class Navigator: NavigatorProtocol {
    
    // MARK: - Properties
    private let appAssembly = AppAssembly()
    
    // MARK: - Methods
    func createCharactersList() -> UINavigationController {
        let navigationVC = appAssembly.createCharactersList()
        
        return navigationVC
    }
}
