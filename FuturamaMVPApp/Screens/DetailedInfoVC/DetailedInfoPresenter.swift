//
//  DetailedInfoPresenter.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 31.07.2022.
//

import UIKit

// MARK: - DetailedInfoPresenterProtocol
protocol DetailedInfoPresenterProtocol {
    var characters: Character { get }
}

// MARK: - DetailedInfoPresenter
class DetailedInfoPresenter: DetailedInfoPresenterProtocol {
    
    // MARK: - Properties
    private var delegate: DetailedInfoViewControllerProtocol!
    private let networkService: NetworkServiceProtocol
    var characters: Character
    
    // MARK: - Init
    init(networkService: NetworkServiceProtocol, characters: Character) {
        self.networkService = networkService
        self.characters = characters
    }
    
    // MARK: - Methods
    func set(delegat: DetailedInfoViewControllerProtocol) {
        self.delegate = delegat
    }
}
