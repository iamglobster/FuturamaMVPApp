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
}

// MARK: - CharactersPresenter
class CharactersPresenter: CharactersPresenterProtocol {
  
    // MARK: - Properties
    private var delegat: CharactersViewControllerProtocol!
    private let navigator: NavigatorProtocol
    private let networkService: NetworkServiceProtocol
    var characters: [Character] = [] {
        didSet {
            delegat.get(characters: characters)
        }
    }
    
    // MARK: - Init
    init(navigator: NavigatorProtocol, networkService: NetworkServiceProtocol) {
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
}
