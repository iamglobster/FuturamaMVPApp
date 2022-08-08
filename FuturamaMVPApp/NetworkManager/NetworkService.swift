//
//  NetworkService.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 31.07.2022.
//

import Foundation

// MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
    func getCharacters(with stringURL: String, completion: @escaping ([Characters]) -> Void)
}

// MARK: - NetworkService
class NetworkService: NetworkServiceProtocol {
    func getCharacters(with stringURL: String, completion: @escaping ([Characters]) -> Void) {
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error { print(error); return }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()

            do {
                let characters = try decoder.decode([Characters].self, from: data)
                completion(characters)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
