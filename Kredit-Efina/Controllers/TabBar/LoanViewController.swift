//
//  LoanViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit
import PanModal

class LoanViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblLoans: UITableView!
    @IBOutlet weak var tblLoanOffers: UITableView!
    @IBOutlet weak var lblOne: UILabel!
    @IBOutlet weak var lblTwo: UILabel!
    @IBOutlet weak var btnAddLaon: UIButton!
    var switched:Bool = false
    
    var plentyLoans:[Loan] = [Loan]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblLoans.tag = 0
        tblLoanOffers.tag = 1
        tblLoans.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        configureTableViews(tableViews: tblLoans,tblLoanOffers)


    }
    
    fileprivate func configureTableViews(tableViews:UITableView...){
        for tableView in tableViews{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: LoanTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: LoanTableViewCell.identifier)
            tableView.separatorStyle = .none
        }
    }
    
    fileprivate func configureIfLender(){
        if switched{return}
        if HelperClass.currentUser!.usertype == .Lender{
            lblTitle.text = "Loan Requests"
            btnAddLaon.setImage(#imageLiteral(resourceName: "lenders settings"), for: .normal)
//            let k = tblLoans.frame.origin
//            tblLoans.frame.origin = tblLoanOffers.frame.origin
//            tblLoanOffers.frame.origin = k
            lblOne.text = "My Loan Offers 💸"
            lblTwo.text = "Loan Requets 🤲🏽"
            switched = true
        }else{
            lblOne.text = "My Loan Requests 🥺"
            lblTwo.text = "Loan Offers 💰"
        }
        tblLoans.reloadData()
        tblLoanOffers.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureIfLender()
    }
    
    @IBAction func goToSearchLoans(_ sender: Any) {
        let searchLoansVC = SearchLoansViewController(nibName: "SearchLoansViewController", bundle: nil)
        searchLoansVC.viewTitle = "Search"
        self.present(searchLoansVC, animated: true)
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if let presentableController = viewControllerToPresent as? PanModalPresentable, let controller = presentableController as? UIViewController {
            controller.modalPresentationStyle = .custom
            controller.modalPresentationCapturesStatusBarAppearance = true
            controller.transitioningDelegate = PanModalPresentationDelegate.default
            super.present(controller, animated: flag, completion: completion)
            return
        }
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    @IBAction func hanldeCreateLoan(_ sender: Any) {
        let searchLoansVC = SearchLoansViewController(nibName: "SearchLoansViewController", bundle: nil)
        searchLoansVC.viewTitle = (HelperClass.currentUser!.usertype == .Borrower) ? "Request for Loan 🙏🏽":"Make an Offer 🏧"
        searchLoansVC.isCreateLoan = true
        self.present(searchLoansVC, animated: true)
    }
    
}


extension LoanViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0{
            let hmm = HelperClass.someLoans.filter({element in
                element.isRequested == (HelperClass.currentUser!.usertype == .Lender)
            })
            plentyLoans = hmm
            return hmm.count
        }
        return HelperClass.currentUser?.loanRequested?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let loanTVC = tblLoans.dequeueReusableCell(withIdentifier: LoanTableViewCell.identifier, for: indexPath) as! LoanTableViewCell
        
        if tableView.tag == 1{
            if HelperClass.currentUser?.loanRequested == nil{
                let cell = tblLoans.dequeueReusableCell(withIdentifier: "cell")
                cell?.textLabel?.text = "Create a Loan in the \("+") button 🥺"
                return cell!
            }
        }
        
        if tableView.tag == 1{
            
            let loanOfferTVC = tblLoans.dequeueReusableCell(withIdentifier: LoanTableViewCell.identifier, for: indexPath) as! LoanTableViewCell
            
            if let hmm = HelperClass.currentUser?.loanRequested{
                loanTVC.lblSummary.text = hmm[indexPath.row].summary
                loanTVC.lblDuration.text = hmm[indexPath.row].duration
                loanTVC.lblTypeOfLoan.text = hmm[indexPath.row].loanType
            }
            
            return loanOfferTVC
        }else{
            loanTVC.lblSummary.text = plentyLoans[indexPath.row].summary
            loanTVC.lblDuration.text = plentyLoans[indexPath.row].duration
            loanTVC.lblTypeOfLoan.text = plentyLoans[indexPath.row].loanType
        }
        
        return loanTVC
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblLoans.deselectRow(at: indexPath, animated: true)
        var singleLoan:Loan!
        var isFromUser:Bool = false
        if tableView.tag == 0{
            singleLoan = plentyLoans[indexPath.row]
        }else{
            if let hmm = HelperClass.currentUser?.loanRequested{
                singleLoan = hmm[indexPath.row]
                isFromUser = true
            }
        }
        let loanDetalis = LoanDetailsViewController(nibName: "LoanDetailsViewController", bundle: nil)
        loanDetalis.amount = singleLoan.loanAmount
        loanDetalis.interest = singleLoan.intrestRate
        loanDetalis.paybackTime = singleLoan.duration
        loanDetalis.purpose = singleLoan.loanType
        loanDetalis.subTitle = singleLoan.username
        loanDetalis.isDisabled = isFromUser
        
        
        self.present(loanDetalis, animated: true)
    }
    
    
}
