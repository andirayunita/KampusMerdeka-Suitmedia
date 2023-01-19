//
//  SecondScreenViewController.swift
//  KMSuitmedia
//
//  Created by Andira Yunita on 19/01/23.
//

import UIKit

class SecondScreenViewController: UIViewController {

    @IBOutlet weak var nameTF: UILabel!
    @IBOutlet weak var emptyStateLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    let thirdScreenViewController = ThirdScreenViewController()
    
    var nameUser = ""
    init(nameUser: String?) {
        self.nameUser = nameUser ?? ""
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdScreenViewController.delegate = self
        navigationItem.title = "Second Screen"
        navigationItem.backButtonTitle = ""
        nameTF.text = nameUser
        
        chooseButton.layer.cornerRadius = 12
        chooseButton.clipsToBounds = true
    }

    @IBAction func chooseTapped(_ sender: Any) {
        navigationController?.pushViewController(thirdScreenViewController, animated: true)
    }
}

extension SecondScreenViewController: ThirdScreenViewControllerDelegate {
    func getDataUser(userData: UsersData) {
        guard let firstName = userData.first_name else { return }
        guard let lastName = userData.last_name else { return }
        let fullName = firstName + " " + lastName
        emptyStateLabel.text = ""
        fullnameLabel.text = fullName
    }
}
