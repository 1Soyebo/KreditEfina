//
//  PsychomtryViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 07/10/2020.
//

import UIKit
import PKHUD

class PsychomtryViewController: UIViewController {

    //MARK: PSYCH QUESTIONS
    let listPsychQuestions = ["I am a leader in most of my groups", "Presentations are difficult for me?" ,"I worry others will fnd out about my weakness?","There are things in my past I wish I could change.","Its Hard to act naturally with strangers.","I only trust those I know well","I rarely live up to my own standards."]
    var arraySelected: [Int] = []
    var selectedCells = NSMutableIndexSet()
    @IBOutlet weak var lblPageNumber: UILabel!
    @IBOutlet weak var collPyschometry: UICollectionView!
    @IBOutlet weak var btnCalculateCreditScore: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collPyschometry.dataSource  = self
        collPyschometry.delegate = self
        collPyschometry.register(UINib(nibName: PsychoCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PsychoCollectionViewCell.identifier)
        collPyschometry.isPagingEnabled = true
        btnCalculateCreditScore.isHidden = true
        HelperClass.curveUiElements(views: btnCalculateCreditScore)
    }
    
    @IBAction func goBack(_ sender: Any) {
        
    }
    
    @IBAction func handleGoRight(_ sender: Any) {
            
        //get cell size
        let cellSize = CGSize(width: collPyschometry.frame.width, height: collPyschometry.frame.height);

        //get current content Offset of the Collection view
        let contentOffset = collPyschometry.contentOffset;

        //scroll to next cell
        collPyschometry.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true);
    }
    
    
    @IBAction func calculateCreditScore(_ sender: Any) {
        for hm in Constants.psychQuestions{
            if hm.answer == nil{
                HUD.flash(.label("Answer all questions 🙏🏽"))
                return
            }
        }
        if HelperClass.currentUser!.usertype == .Borrower{
            HelperClass.currentUser!.creditScore = Int.random(in: 400...850)
        }
        navigationController?.popToRootViewController(animated: true)
    }
}


extension PsychomtryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let psychCell = collPyschometry.dequeueReusableCell(withReuseIdentifier: PsychoCollectionViewCell.identifier, for: indexPath) as! PsychoCollectionViewCell
        psychCell.lblNumber.text = "\(indexPath.item + 1)"
        psychCell.lblQuestion.text = listPsychQuestions[indexPath.item]
        //psychCell.tag = indexPath.row
        
        func godAirpus(){
            if Constants.psychQuestions[indexPath.row].answer == nil{
                for but in psychCell.bothButtons{
                    but.backgroundColor = .white
                    but.setTitleColor(Constants.kreditDarkBlue, for: .normal)
                }
            }
            if let ans = Constants.psychQuestions[indexPath.row].answer{
            if ans{
                //YES
                psychCell.bothButtons[0].backgroundColor = Constants.kreditDarkBlue
                psychCell.bothButtons[0].setTitleColor(.white, for: .normal)
                psychCell.bothButtons[1].backgroundColor = .white
                psychCell.bothButtons[1].setTitleColor(Constants.kreditDarkBlue, for: .normal)
            }else{
                //NO
                psychCell.bothButtons[1].backgroundColor = Constants.kreditDarkBlue
                psychCell.bothButtons[1].setTitleColor(.white, for: .normal)
                psychCell.bothButtons[0].backgroundColor = .white
                psychCell.bothButtons[0].setTitleColor(Constants.kreditDarkBlue, for: .normal)
            }
            }
        }
        
        //psychCell.answer =
        if selectedCells.contains(indexPath.row){
            print(indexPath.row)
            godAirpus()
            
        }else{
            godAirpus()
                
        }
        
        psychCell.bothButtons[0].tag = indexPath.row
        psychCell.bothButtons[1].tag = indexPath.row
        psychCell.bothButtons[0].addTarget(self, action: #selector(changeColor(sender:)), for: .touchUpInside)
        psychCell.bothButtons[1].addTarget(self, action: #selector(changeColor(sender:)), for: .touchUpInside)
        
        return psychCell
    }
    
    @objc func changeColor(sender:UIButton){
        print(sender.tag)
        var g : IndexPath = IndexPath(item: sender.tag, section: 0)
        var t : PsychoCollectionViewCell = self.collPyschometry.cellForItem(at: g) as! PsychoCollectionViewCell
        for button in t.bothButtons{
            button.backgroundColor = .white
            button.setTitleColor(Constants.kreditDarkBlue, for: .normal)
        }
        Constants.psychQuestions[sender.tag].answer = (sender.title(for: .normal) == "Yes") ? true:false
        sender.backgroundColor = Constants.kreditDarkBlue
        sender.setTitleColor(.white, for: .normal)
        selectedCells.add(sender.tag)
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
        if num == 6{
            btnRight.isHidden = true
            btnCalculateCreditScore.isHidden = false
        }else{
            btnRight.isHidden = false
            btnCalculateCreditScore.isHidden = true
        }
    }
}
