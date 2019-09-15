//
//  RentalUpdate_VC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 13/09/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class RentalUpdate_VC: UIViewController {
    
    //Rental Update / Delete Outlets
    @IBOutlet weak var rentalUpdateDeleteOutletNavbar: UINavigationBar!
    
    //TableView Outlet
    @IBOutlet weak var tableviewOutletTableview: UITableView!
    
    
    //Text Fields
    @IBOutlet weak var firstnameOutletText: UITextField!
    @IBOutlet weak var lastnameOutletText: UITextField!
    
    //Button Outlets
    @IBOutlet weak var searchOutletButton: UIButton!
    @IBOutlet weak var deleteOutletButton: UIButton!
    
    //Lable Outlets
    @IBOutlet weak var infoOutletLabel: UILabel!
    
    
    //Array to hold retreive records
    var firstnameArray: [String] = []
    var lastnameArray: [String] = []
    var titleArray: [String] = []
    var costArray: [Double] = []
    var rentalDateArray: [Date] = []
    var rtnDateArray: [Date] = []
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom function
        formatVC() //Format Form
        conDatSourceDelegate() //Connect TableView
    }
    
    //Format ViewController
    func formatVC() {
        
        //Format the text fields
        firstnameOutletText.layer.shadowOpacity = 1
        firstnameOutletText.layer.shadowRadius = 5
        firstnameOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        firstnameOutletText.clearButtonMode = .always
        
        lastnameOutletText.layer.shadowOpacity = 1
        lastnameOutletText.layer.shadowRadius = 5
        lastnameOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        lastnameOutletText.clearButtonMode = .always
        
        
        //Format Navigation bar
        rentalUpdateDeleteOutletNavbar.layer.shadowOpacity = 1
        rentalUpdateDeleteOutletNavbar.layer.shadowRadius = 5
        rentalUpdateDeleteOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format buttons
        searchOutletButton.setTitleColor(.white, for: .normal)
        searchOutletButton.backgroundColor = UIColor.black
        searchOutletButton.layer.shadowOpacity = 1
        searchOutletButton.layer.shadowRadius = 5
        searchOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        searchOutletButton.layer.cornerRadius = 10
        
        
        deleteOutletButton.setTitleColor(.white, for: .normal)
        deleteOutletButton.backgroundColor = UIColor.black
        deleteOutletButton.layer.shadowOpacity = 1
        deleteOutletButton.layer.shadowRadius = 5
        deleteOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        deleteOutletButton.layer.cornerRadius = 10
        
        //Hide unused cells
        tableviewOutletTableview.tableFooterView = UIView()
        
        
    }
    
    
    //Call Update / Delete menu - UpdateCatalogueVC - identifier updateDeleteVC
    @IBAction func backToUpdateDeleteMenuItem(_ sender: UIBarButtonItem) {
        
        //Set StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Update / Delete menu
        let updateDelete = mainStoryBoard.instantiateViewController(withIdentifier: "updateDeleteVC") as! updateCatalogueVC
        
        self.present(updateDelete,animated: true,completion: nil)
        
    }
    
    //Funtion to connect Delegate and Datasource
    func conDatSourceDelegate() {
        
        tableviewOutletTableview.delegate = self
        tableviewOutletTableview.dataSource = self
    }
    



}

//Extension for Rental Tableview cell
extension RentalUpdate_VC: UITableViewDelegate, UITableViewDataSource {
    
    //Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstnameArray.count
    }
    
    //Number cell for Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewOutletTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! rentalUpdateDelete_TVC
        
            //Assign the cell value to the arrays
            cell.firstnameOutletCell.textColor = UIColor.blue
            cell.firstnameOutletCell.font = cell.firstnameOutletCell.font?.withSize(14)
            cell.firstnameOutletCell.text = "Firstname: \(firstnameArray[indexPath.row])"
        
            cell.lastnameOutletCell.textColor = UIColor.blue
            cell.lastnameOutletCell.font = cell.lastnameOutletCell.font?.withSize(14)
            cell.lastnameOutletCell.text = "Lastname: \(lastnameArray[indexPath.row])"
        
            cell.titleOutletCell.font = cell.titleOutletCell.font?.withSize(14)
            cell.titleOutletCell.text = "Title: \(titleArray[indexPath.row])"
        
            cell.costOutletCell.font = cell.costOutletCell.font?.withSize(14)
            cell.costOutletCell.text = "Cost: \(costArray[indexPath.row])"
        
            cell.dateOutletCell.font = cell.dateOutletCell.font?.withSize(14)
            cell.dateOutletCell.text = "Date:   \(rentalDateArray[indexPath.row])"
        
            cell.returnOutletCell.textColor = UIColor.red
            cell.returnOutletCell.font = cell.returnOutletCell.font?.withSize(14)
            cell.returnOutletCell.text = "Return Date: \(rtnDateArray[indexPath.row])"
        
        return cell
    }
    
    
}
