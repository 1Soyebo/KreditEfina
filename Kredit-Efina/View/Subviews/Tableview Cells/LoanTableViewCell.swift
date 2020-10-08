//
//  LoanTableViewCell.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit

class LoanTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTypeOfLoan: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    static let identifier = "LoanTableViewCell"
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = Constants.kreditlightGrey.withAlphaComponent(0.125).cgColor
        mainView.layer.cornerRadius = 5
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
