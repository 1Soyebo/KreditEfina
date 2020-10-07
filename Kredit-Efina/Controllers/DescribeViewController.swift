//
//  DescribeViewController.swift
//  Kredit-Efina
//
//  Created by Ibukunoluwa Soyebo on 05/10/2020.
//

import UIKit

struct DescribeOptions {
    let title:String
    let subtitle:String
}

class DescribeViewController: UIViewController {

    var selectedIndes:Int?
    
    @IBOutlet weak var tblDescribe: UITableView!
    
    var arrayDescribeOptions:[DescribeOptions]{
        let desc_1 = DescribeOptions(title: "Lender", subtitle: "Doggy ipsizzle dolizzle i'm in the shizzle amizzle, away adipiscing. ")
        let desc_2 = DescribeOptions(title: "Borrower", subtitle: "Doggy ipsizzle dolizzle i'm in the shizzle amizzle, away adipiscing. ")
        
        return [desc_1,desc_2]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblDescribe.register(UINib(nibName: DescriptionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        tblDescribe.delegate = self
        tblDescribe.dataSource = self
        tblDescribe.separatorStyle = .none
        tblDescribe.backgroundColor = .clear
        
    }

    @IBAction func handleBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleCreateAccount(_ sender: Any) {
        let createAccount = CreateAccountViewController(nibName: "CreateAccountViewController", bundle: nil)
        self.navigationController?.pushViewController(createAccount, animated: true)
    }
    

}

extension DescribeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let describeTVC = tblDescribe.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as! DescriptionTableViewCell
        describeTVC.lblMain.text = arrayDescribeOptions[indexPath.row].title
        describeTVC.lblSub.text = arrayDescribeOptions[indexPath.row].subtitle
        
        if(selectedIndes == indexPath.row){
            describeTVC.imgCheck.isHidden = false
            describeTVC.mainView.layer.borderWidth = 0
            describeTVC.mainView.backgroundColor = Constants.kreditLightBlue
        }else{
            describeTVC.imgCheck.isHidden = true
            describeTVC.mainView.layer.borderWidth = 1
            describeTVC.mainView.layer.borderColor = UIColor.white.cgColor
            describeTVC.mainView.backgroundColor = .clear
        }
        return describeTVC
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblDescribe.deselectRow(at: indexPath, animated: true)
        selectedIndes = indexPath.row

        tblDescribe.reloadData()
    }
    
    
}
