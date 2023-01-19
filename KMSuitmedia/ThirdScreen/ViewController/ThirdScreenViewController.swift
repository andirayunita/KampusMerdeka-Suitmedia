//
//  ThirdScreenViewController.swift
//  KMSuitmedia
//
//  Created by Andira Yunita on 19/01/23.
//

import UIKit

protocol ThirdScreenViewControllerDelegate {
    func getDataUser(userData: UsersData)
}

class ThirdScreenViewController: UIViewController {
    
    @IBOutlet weak var thirdScreenTableView: UITableView!
    
    var infoUser = [DataUser]()
    var delegate: ThirdScreenViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdScreenTableView.delegate = self
        thirdScreenTableView.dataSource = self
        
        thirdScreenTableView.register(UINib(nibName: "ThirdScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        navigationItem.title = "Third Screen"
        getData()
        pullToRefresh()
    }
    
    func pullToRefresh(){
        thirdScreenTableView.refreshControl = UIRefreshControl()
        thirdScreenTableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }
    
    @objc private func didPullToRefresh(){
        getData()
    }
    
    func getData() {
        infoUser.removeAll()
        APIManager().parseJson { data in
            self.infoUser = data
            DispatchQueue.main.async {
                self.thirdScreenTableView.refreshControl?.endRefreshing()
                self.thirdScreenTableView.reloadData()
            }
        }
    }
}

extension ThirdScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ThirdScreenTableViewCell
        let imageURL = URL(string: infoUser[indexPath.row].avatar ?? "")
        cell.imageUser.downloaded(from: imageURL!)
        cell.firstNameLabel.text = infoUser[indexPath.row].first_name
        cell.lastNameLabel.text = infoUser[indexPath.row].last_name
        cell.emailLabel.text = infoUser[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        delegate?.getDataUser(userData: UsersData(first_name: infoUser[indexPath.row].first_name, last_name: infoUser[indexPath.row].last_name))
        navigationController?.popViewController(animated: true)
    }
}
