//
//  FirstScreenViewController.swift
//  KMSuitmedia
//
//  Created by Andira Yunita on 18/01/23.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var palindromeTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var nameTF: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.layer.cornerRadius = 12
        nameTextField.clipsToBounds = true
        
        palindromeTextField.layer.cornerRadius = 12
        palindromeTextField.clipsToBounds = true
        
        nextButton.layer.cornerRadius = 12
        nextButton.clipsToBounds = true
        
        checkButton.layer.cornerRadius = 12
        checkButton.clipsToBounds = true
        
        imageBackground.contentMode = .scaleAspectFill
        
        navigationItem.backButtonTitle = ""
    }

    func isPalindrome(_ s: String) -> Bool {
        let str = s.lowercased()
        let reversedString = String(str.reversed())
        return str == reversedString
    }
    
    @IBAction func checkTapped(_ sender: Any) {
        if isPalindrome(palindromeTextField.text ?? "") {
            let ac = UIAlertController(title: "\(palindromeTextField.text?.lowercased() ?? "")", message: "isPalindrome", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "\(palindromeTextField.text?.lowercased() ?? "")", message: "Not Palindrome", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        self.nameTF = nameTextField.text ?? ""
        let secondScreenViewController = SecondScreenViewController(nameUser: nameTF)
        navigationController?.pushViewController(secondScreenViewController, animated: true)
    }
}
