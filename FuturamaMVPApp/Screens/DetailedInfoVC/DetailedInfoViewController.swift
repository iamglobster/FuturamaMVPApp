//
//  DetailedInfoViewController.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 31.07.2022.
//

import UIKit

// MARK: - DetailedInfoViewControllerProtocol
protocol DetailedInfoViewControllerProtocol {
    
}

// MARK: - DetailedInfoViewController
class DetailedInfoViewController: UIViewController, DetailedInfoViewControllerProtocol {
    
    // MARK: - IBOutlet
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var planetLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var firstAppearanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    // MARK: - Properties
    private let presenter: DetailedInfoPresenterProtocol
    
    // MARK: - Init
    init(presenter: DetailedInfoPresenterProtocol) {
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
        setupNavigationBar()
    }
}

// MARK: - Private Extension
private extension DetailedInfoViewController {
    func setupUI() {
        guard let url = URL(string: presenter.characters.picURL ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error { print(error); return }
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = image
            }
        }.resume()
        
        speciesLabel.text = "Species: \(presenter.characters.species ?? "")"
        ageLabel.text = "Age: \(presenter.characters.age ?? "")"
        planetLabel.text = "Planet: \(presenter.characters.planet ?? "")"
        professionLabel.text = "Profession: \(presenter.characters.profession ?? "")"
        statusLabel.text = "Status: \(presenter.characters.status ?? "")"
        firstAppearanceLabel.text = "First Appearance: \(presenter.characters.firstAppearanse ?? "")"
        nameLabel.text = "Name: \(presenter.characters.name ?? "")"
    }
    
    func setupNavigationBar() {
        title = "Detailed Info"
        navigationItem.largeTitleDisplayMode = .never
    }
}
