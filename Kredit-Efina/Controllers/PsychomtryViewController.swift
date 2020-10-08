//
//  PsychomtryViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 07/10/2020.
//

import UIKit

class PsychomtryViewController: UIViewController {

    //MARK: PSYCH QUESTIONS
    let listPsychQuestions = ["I am a leader in most of my groups", "Presentations are difficult for me?" ,"I worry others will fnd out about my weakness?","There are things in my past I wish I could change.","Its Hard to act naturally with strangers.","I only trust those I know well","I rarely live up to my own standards."]
    
    @IBOutlet weak var lblPageNumber: UILabel!
    @IBOutlet weak var collPyschometry: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collPyschometry.dataSource  = self
        collPyschometry.delegate = self
        collPyschometry.register(UINib(nibName: PsychoCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PsychoCollectionViewCell.identifier)
        collPyschometry.isPagingEnabled = true

    }
    
    @IBAction func goBack(_ sender: Any) {
        
    }
}


extension PsychomtryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let psychCell = collPyschometry.dequeueReusableCell(withReuseIdentifier: PsychoCollectionViewCell.identifier, for: indexPath) as! PsychoCollectionViewCell
        psychCell.lblNumber.text = "\(indexPath.row + 1)"
        psychCell.lblQuestion.text = listPsychQuestions[indexPath.row]
        return psychCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collPyschometry.frame.size.width, height: collPyschometry.frame.size.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = collPyschometry.contentOffset.x
        let width = collPyschometry.frame.width
        let horizontalCenter = width / 2

        let num = Int(offSet + horizontalCenter) / Int(width)
        
        lblPageNumber.text = "\(num + 1)/7"
    }
}
