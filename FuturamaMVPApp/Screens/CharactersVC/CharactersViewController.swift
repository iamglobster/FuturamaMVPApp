//
//  CharactersViewController.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 29.07.2022.
//

import UIKit

// MARK: - CharactersViewControllerProtocol
protocol CharactersViewControllerProtocol {
    
}

// MARK: - CharactersViewController
class CharactersViewController: UIViewController {

    // MARK: - Properties
    private lazy var cellType: String = String(describing: CharacterCell.self)
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
    
        return tableView
    }()
    
    private let presenter: CharactersPresenterProtocol
    
    // MARK: - Init
    init(presenter: CharactersPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.dataSource = self
    }

}

// MARK: - Private Extension
private extension CharactersViewController {
    func setupUI() {
        setupNavigationBar()
        setupConstreints()
        setupTableView()
    }
    
    func setupNavigationBar() {
        title = "Futurama Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(red: 30/255, green: 96/255, blue: 180/255, alpha: 180/255)
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    func setupConstreints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.register(.init(nibName: cellType, bundle: nil), forCellReuseIdentifier: cellType)
    }
}

// MARK: - CharactersViewControllerProtocol
extension CharactersViewController: CharactersViewControllerProtocol {
    
}

extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType) as! CharacterCell
        cell.nameLabel.text = "Hello"
        return cell
    }
}
