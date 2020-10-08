//
//  CardTableViewCell.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    static let identifier = "CardTableViewCell"
    @IBOutlet weak var viewCreditCard: UIView!
    @IBOutlet weak var lblCardNumber: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCreditCard.layer.cornerRadius = 20
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
