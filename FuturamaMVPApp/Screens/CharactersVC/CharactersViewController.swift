//
//  CharactersViewController.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 29.07.2022.
//

import UIKit

// MARK: - CharactersViewControllerProtocol
protocol CharactersViewControllerProtocol {
    func get(characters: [Characters])
}

// MARK: - CharactersViewController
class CharactersViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var cellType: String = String(describing: CharacterCell.self)
    private lazy var dataSource = configureDataSource()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    private var presenter: CharactersPresenterProtocol
    private var isEditingMode = false
    
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
        presenter.getCharacters(stingURL: API.stringURL.rawValue)
    }
    
}

// MARK: - Private Extension
private extension CharactersViewController {
    func setupUI() {
        setupNavigationBar()
        setupConstreints()
        setupTableView()
        setupEditButtonItem()
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
    
    func setupEditButtonItem() {
        navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.action = #selector(editButton(_:))
    }
    
    @objc func editButton(_ sender: UIBarButtonItem) {
        if !isEditingMode {
            isEditingMode = true
            editButtonItem.title = "Done"
        } else {
            isEditingMode = false
            editButtonItem.title = "Edit"
        }
        tableView.setEditing(isEditingMode, animated: true)
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
    func get(characters: [Characters]) {
        update(with: characters)
    }
}

// MARK: - UITableViewDelegate
extension CharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = dataSource.itemIdentifier(for: indexPath) else { return }
        presenter.showDetailedInfoVC(viewController: self, model: model)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //        let currentCharacter = presenter.characters.remove(at: sourceIndexPath.row)
        //        presenter.characters.insert(currentCharacter, at: destinationIndexPath.row)
        //    }
        
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            .delete
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            //        let character = presenter.characters[indexPath.row]
            //
            //        if editingStyle == .delete {
            //            presenter.characters.remove(at: indexPath.row)
            //            tableView.deleteRows(at: [indexPath], with: .automatic)
            //            //CoreDataManager.shared.delete(character: character)
            //        }
        }
        
        // MARK: - DataSource methods
        func configureDataSource() -> UITableViewDiffableDataSource <Int, Characters> {
            let dataSource = UITableViewDiffableDataSource<Int, Characters>(tableView: tableView) { tableView, indexPath, model in
                return(tableView.dequeueReusableCell(withIdentifier: self.cellType) as? CharacterCell)?.configure(with: model)
            }
            return dataSource
        }
        
        func update(with models: [Characters], and animated: Bool = false) {
            DispatchQueue.main.async {
                var snapShot = NSDiffableDataSourceSnapshot <Int, Characters>()
                
                snapShot.appendSections([0])
                snapShot.appendItems(models)
                
                if #available(iOS 15.0, *) {
                    self.dataSource.applySnapshotUsingReloadData(snapShot)
                } else {
                    self.dataSource.apply(snapShot, animatingDifferences: animated)
                }
            }
        }
    }
}
