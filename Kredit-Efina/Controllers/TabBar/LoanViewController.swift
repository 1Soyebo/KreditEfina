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
    @IBOutlet weak var btnAddLaon: UIButton!
    var switched:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblLoans.tag = 0
        tblLoanOffers.tag = 1
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
            let k = tblLoans.frame.origin
            tblLoans.frame.origin = tblLoanOffers.frame.origin
            tblLoanOffers.frame.origin = k
            switched = true
        }
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
        if tableView.tag == 1{
            return 3
        }
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let loanTVC = tblLoans.dequeueReusableCell(withIdentifier: LoanTableViewCell.identifier, for: indexPath)
        if tableView.tag == 1{
            let loanOfferTVC = tblLoans.dequeueReusableCell(withIdentifier: LoanTableViewCell.identifier, for: indexPath)
            return loanOfferTVC
        }
        return loanTVC
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblLoans.deselectRow(at: indexPath, animated: true)
        let loanDetalis = LoanDetailsViewController(nibName: "LoanDetailsViewController", bundle: nil)
        self.present(loanDetalis, animated: true)
    }
    
    
}
