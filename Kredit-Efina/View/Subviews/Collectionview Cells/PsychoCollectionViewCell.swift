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
    var answer:Bool?
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        if let ans = answer{
//            if ans{
//                btnYes.backgroundColor = Constants.kreditDarkBlue
//                btnYes.setTitleColor(.white, for: .normal)
//            }else{
//                btnNo.backgroundColor = .white
//                btnNo.setTitleColor(Constants.kreditDarkBlue, for: .normal)
//            }
//        }
        // Initialization code
    }

    @IBAction func handleButtonTap(_ sender: UIButton) {
//        for oneButton in bothButtons{
//            oneButton.backgroundColor = .white
//            oneButton.setTitleColor(Constants.kreditDarkBlue, for: .normal)
//        }
//        print(self.tag)
//        Constants.psychQuestions[self.tag].answer = sender.title(for: .normal) == "Yes" ? true:false
//        sender.backgroundColor = Constants.kreditDarkBlue
//        sender.setTitleColor(.white, for: .normal)
        
    }
}
