//
//  CharactersPresenterViewController.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 29.07.2022.
//

import UIKit

// MARK: - CharactersPresenterProtocol
protocol CharactersPresenterProtocol {
    
}

// MARK: - CharactersPresenter
class CharactersPresenter: CharactersPresenterProtocol {
    
    // MARK: - Properties
    private var delegat: CharactersViewControllerProtocol!
    
    // MARK: - Methods
    func set(delegate: CharactersViewControllerProtocol) {
        self.delegat = delegate
    }
}
