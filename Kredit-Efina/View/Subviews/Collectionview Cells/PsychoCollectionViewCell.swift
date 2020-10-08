//
//  PsychoCollectionViewCell.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 07/10/2020.
//

import UIKit

class PsychoCollectionViewCell: UICollectionViewCell {

    static let identifier = "PsychoCollectionViewCell"
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet var bothButtons: [PsychButton]!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func handleButtonTap(_ sender: UIButton) {
        for oneButton in bothButtons{
            oneButton.backgroundColor = .white
            oneButton.setTitleColor(Constants.kreditDarkBlue, for: .normal)
        }
        sender.backgroundColor = Constants.kreditDarkBlue
        sender.setTitleColor(.white, for: .normal)
        
    }
}
