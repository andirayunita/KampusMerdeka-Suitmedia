//
//  ThirdScreenTableViewCell.swift
//  KMSuitmedia
//
//  Created by Andira Yunita on 19/01/23.
//

import UIKit

class ThirdScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageUser: UIImageView! {
        didSet {
            imageUser.layer.cornerRadius = imageUser.frame.height/2
        }
    }
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    class func nib() -> UINib { UINib(nibName: "ThirdScreenTableViewCell", bundle: nil) }
    
}
