//
//  WalletViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 06/10/2020.
//

import UIKit
import PanModal

class WalletViewController: UIViewController {

    @IBOutlet weak var btnAddWallet: UIButton!
    @IBOutlet weak var tblWallets: UITableView!
    var array_Card_Dets:[CardDetails] = [CardDetails]()
    override func viewDidLoad() {
        super.viewDidLoad()

        tblWallets.delegate = self
        tblWallets.dataSource = self
        tblWallets.register(UINib(nibName: CardTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CardTableViewCell.identifier)
        tblWallets.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblWallets.separatorStyle = .none
        tblWallets.backgroundColor = .clear
        btnAddWallet.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureCardEts()
        tblWallets.reloadData()
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
    
    @IBAction func goToAddNewCard(_ sender: Any) {
        let addCardVc = AddNewCardViewController(nibName: "AddNewCardViewController", bundle: nil)
        self.present(addCardVc, animated: true, completion: nil)
    }
    
    func configureCardEts(){
        if let unwrappedArrayCardEts = HelperClass.currentUser?.userCardDets{
            array_Card_Dets = unwrappedArrayCardEts
            tblWallets.reloadData()
        }
    }
    
}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if array_Card_Dets.isEmpty{
            return 1
        }else{
            return array_Card_Dets.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cardCell = tblWallets.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as! CardTableViewCell
        print(array_Card_Dets.count)
        if !(array_Card_Dets.isEmpty){
            
            cardCell.lblCardNumber.text = array_Card_Dets[indexPath.row].cardNumer
            cardCell.lblDate.text = array_Card_Dets[indexPath.row].dateOFExpiry

        }else{
            let basicCEll = tblWallets.dequeueReusableCell(withIdentifier: "cell")
            basicCEll?.textLabel?.text = "Please add a Card 💳"
            return basicCEll!
        }
        return cardCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblWallets.deselectRow(at: indexPath, animated: true)
    }
    
}
