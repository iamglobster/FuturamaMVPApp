//
//  CharactersPresenterViewController.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 29.07.2022.
//

import UIKit

// MARK: - CharactersPresenterProtocol
protocol CharactersPresenterProtocol {
    func getCharacters(stingURL: String)
    func showDetailedInfoVC(viewController: UIViewController, model: Character)
}

// MARK: - CharactersPresenter
class CharactersPresenter: CharactersPresenterProtocol {
  
    // MARK: - Properties
    private var delegat: CharactersViewControllerProtocol!
    private let navigator: NavigatorProtocol
    private let networkService: NetworkService
    var characters: [Character] = [] {
        didSet {
            delegat.get(characters: characters)
        }
    }
    
    // MARK: - Init
    init(navigator: NavigatorProtocol, networkService: NetworkService) {
        self.navigator = navigator
        self.networkService = networkService
    }
    
    // MARK: - Methods
    func set(delegate: CharactersViewControllerProtocol) {
        self.delegat = delegate
    }
    
    func getCharacters(stingURL: String) {
        networkService.getCharacters(with: API.stringURL.rawValue) { characters in
            self.characters = characters
        }
    }
    
    func showDetailedInfoVC(viewController: UIViewController, model: Character) {
        navigator.navigateToDetailedInfoVC(viewController: viewController,
                                           model: model,
                                           networkService: networkService)
    }
}
