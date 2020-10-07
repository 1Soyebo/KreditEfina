//
//  LoanViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit
import PanModal

class LoanViewController: UIViewController {

    @IBOutlet weak var tblLoans: UITableView!
    @IBOutlet weak var viewDivider: UIView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewInformation: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblLoans.dataSource = self
        tblLoans.delegate = self
        tblLoans.register(UINib(nibName: LoanTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: LoanTableViewCell.identifier)
        tblLoans.separatorStyle = .none
        viewHeader.layer.cornerRadius = 5
        viewHeader.layer.borderWidth = 1
        viewHeader.layer.borderColor = Constants.kreditlightGrey.withAlphaComponent(0.125).cgColor
        viewInformation.layer.borderWidth = 1
        viewInformation.layer.borderColor = Constants.kreditlightGrey.withAlphaComponent(0.125).cgColor
        viewInformation.layer.cornerRadius = 5
        viewDivider.backgroundColor = Constants.kreditlightGrey.withAlphaComponent(0.125)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToSearchLoans(_ sender: Any) {
        let searchLoansVC = SearchLoansViewController(nibName: "SearchLoansViewController", bundle: nil)
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
    

}


extension LoanViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let loanTVC = tblLoans.dequeueReusableCell(withIdentifier: LoanTableViewCell.identifier, for: indexPath)
        return loanTVC
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblLoans.deselectRow(at: indexPath, animated: true)
    }
    
    
}
