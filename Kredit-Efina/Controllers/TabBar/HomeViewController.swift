//
//  HomeViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit
import PKHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var lblcreidtSubTitle: UILabel!
    @IBOutlet weak var lblCreditScore: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var blueCurvedView: UIView!
    @IBOutlet weak var creditScoreCardView: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var tblTransactions: UITableView!
    @IBOutlet weak var collLoans: UICollectionView!
    @IBOutlet weak var collectionPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HUD.flash(.label("Logged in as a \(HelperClass.currentUser!.usertype == .Borrower ? "Borrower":"Lender") 💰"),delay: 1)
        curveSomeUiElements()
        configureTblTransaactions()
        configureCollLoans()
        configureIfLender()
        collectionPageControl.numberOfPages = 5
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureCrediTScoreView()

    }
    
    func configureCrediTScoreView(){
        if HelperClass.currentUser!.usertype == .Borrower{
            lblcreidtSubTitle.text = "My Credit Score"
            if HelperClass.currentUser?.creditScore == nil{
                lblCreditScore.text = "Take Credit Score Test! 🚀"
            }
        }else{
            lblcreidtSubTitle.text = "Total Intrest Receieved 💰"
            lblCreditScore.text = "Make an Offer"
            
        }
        
    }
    
    fileprivate func configureIfLender(){
        if HelperClass.currentUser!.usertype == .Lender{
            blueCurvedView.backgroundColor = .clear
            lblTitle.text = "Dashboard"
            lblTitle.textColor = Constants.kreditDarkBlue
            
        }
    }

    fileprivate func curveSomeUiElements(){
        blueCurvedView.layer.cornerRadius = 20
        creditScoreCardView.layer.cornerRadius = 10
        imgUser.layer.cornerRadius = imgUser.frame.size.height/2
    }

    fileprivate func configureTblTransaactions(){
        tblTransactions.delegate = self
        tblTransactions.dataSource = self
        tblTransactions.register(UINib(nibName: TransactionsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TransactionsTableViewCell.identifier)
        tblTransactions.tableFooterView = UIView()
        tblTransactions.layer.cornerRadius = 5
        tblTransactions.backgroundColor = .clear
    }
    
    fileprivate func configureCollLoans(){
        collLoans.delegate = self
        collLoans.dataSource = self
        collLoans.register(UINib(nibName: LoanCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: LoanCollectionViewCell.identifier)
        collLoans.backgroundColor = .clear
        collLoans.showsHorizontalScrollIndicator = false
    }

    @IBAction func goToCreditScore(_ sender: Any) {
        print("k")
        if HelperClass.currentUser!.usertype == .Lender{
            return
        }
        if let myCreditInt = HelperClass.currentUser?.creditScore{
            lblCreditScore.text = "\(myCreditInt)"
            
        }
        
        let creditVc = CreditScoreViewController(nibName:"CreditScoreViewController", bundle:nil)
        self.navigationController?.pushViewController(creditVc, animated: true)
        
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transactionTVC = tblTransactions.dequeueReusableCell(withIdentifier: TransactionsTableViewCell.identifier, for: indexPath) as! TransactionsTableViewCell
        transactionTVC.imgIcon.image = (indexPath.row % 2 == 0 ) ? UIImage(named: "Credit Icon"): UIImage(named: "Debit Icon")
        transactionTVC.lblAmount.textColor = (indexPath.row % 2 == 0) ? .kreditDarkRed:.kreditDarkGreen
        transactionTVC.lblTitle.text = (indexPath.row % 2 == 0) ? "Loan Payback":"Loan Request"
        transactionTVC.selectionStyle = .none
        return transactionTVC
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblTransactions.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let loanCell = collLoans.dequeueReusableCell(withReuseIdentifier: LoanCollectionViewCell.identifier, for: indexPath)
        return loanCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 178.0, height: 88.0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = collLoans.contentOffset.x
        let width = CGFloat(178)
        let horizontalCenter = width / 2

        collectionPageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
    
}
