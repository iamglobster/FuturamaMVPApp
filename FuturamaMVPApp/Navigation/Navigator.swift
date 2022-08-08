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
    func createDetailedInfoVC(networkService: NetworkService, model: Characters) -> UIViewController
    func navigateToDetailedInfoVC(viewController: UIViewController,
                                  model: Characters,
                                  networkService: NetworkService)
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
    
    func createDetailedInfoVC(networkService: NetworkService, model: Characters) -> UIViewController {
        let detailedInfoVC = appAssembly.createDetailedInfoVC(networkService: networkService, model: model)
        
        return detailedInfoVC
    }
    
    func navigateToDetailedInfoVC(viewController: UIViewController,
                                  model: Characters,
                                  networkService: NetworkService) {
        
        let detailedInfoVC = appAssembly.createDetailedInfoVC(networkService: networkService, model: model)
        viewController.navigationController?.pushViewController(detailedInfoVC, animated: true)
    }
}
