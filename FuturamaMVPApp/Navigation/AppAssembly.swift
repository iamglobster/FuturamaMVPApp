//
//  AppAssembly.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 29.07.2022.
//

import UIKit

class AppAssembly {
    
    func createCharactersList() -> UINavigationController {
        let presenter = CharactersPresenter()
        let charactersVC = CharactersViewController(presenter: presenter)
        presenter.set(delegate: charactersVC)
        let navigationVC = UINavigationController(rootViewController: charactersVC)
        
        return navigationVC
    }
}
