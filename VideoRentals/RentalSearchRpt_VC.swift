//
//  RentalSearchRpt_VC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 09/09/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData


//Rental Search Report
class RentalSearchRpt_VC: UIViewController {
    
    //Outltes for ViewController
    @IBOutlet weak var navbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var infoSearchResultOutlet: UILabel!
    
    //TableView Outlet
    @IBOutlet weak var tableviewOutletTableView: UITableView!
    
    //Outlet for Text
    @IBOutlet weak var firstnameOutletFormText: UITextField!
    @IBOutlet weak var lastnameOutletFromText: UITextField!
    @IBOutlet weak var searchOutletButton: UIButton!
    
    //Variable Array to store CoreDate
    var firstnameArray: [String] = []
    var lastnameArray: [String] = []
    var titleArray: [String] = []
    var costArray: [Double] = []
    var rentalDateArray: [Date] = []
    var rtnDateArray: [Date] = []
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function call
        formatVC() //Format Text Field and Buttons
        delDataConnect() //Connect DataSource and Delegate
    
    }
    
    //Format ViewControllers
    func formatVC() {

        
        //Format Navivagtion Bar
        navbarOutletNavbar.layer.shadowOpacity = 1
        navbarOutletNavbar.layer.shadowRadius = 5
        navbarOutletNavbar.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format the Text Fields
        firstnameOutletFormText.layer.shadowOpacity = 1
        firstnameOutletFormText.layer.shadowRadius = 5
        firstnameOutletFormText.layer.shadowOffset = CGSize(width: 3, height: 3)
        firstnameOutletFormText.clearButtonMode = .always
        
        lastnameOutletFromText.layer.shadowOpacity = 1
        lastnameOutletFromText.layer.shadowRadius = 5
        lastnameOutletFromText.layer.shadowOffset = CGSize(width: 3, height: 3)
        lastnameOutletFromText.clearButtonMode = .always
        
        //Format the Search Button
        searchOutletButton.setTitleColor(.white, for: .normal)
        searchOutletButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        searchOutletButton.layer.shadowOpacity = 1
        searchOutletButton.layer.shadowRadius = 5
        searchOutletButton.layer.cornerRadius = 8
        searchOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format Information label
        infoSearchResultOutlet.font = infoSearchResultOutlet.font.withSize(14)
        
        
    }
    
    //Delegate and Datasource conneciton
    func delDataConnect() {
        
        tableviewOutletTableView.delegate = self
        tableviewOutletTableView.dataSource = self
    }
    
    //Button Action
    //Search Button
    @IBAction func searchActionButton(_ sender: UIButton) {
        
        if firstnameOutletFormText.text == "" {
            srchVidRentals(inSrchParam: lastnameOutletFromText.text!)
            self.tableviewOutletTableView.reloadData()
            
        } else if lastnameOutletFromText.text == "" {
            srchVidRentals(inSrchParam: firstnameOutletFormText.text!)
            self.tableviewOutletTableView.reloadData()
            
        } else {
            print("Both fields are blank!!!")
        }
        
    }
    
    
    
    //Report Menu Action
    @IBAction func backToMenuItem(_ sender: UIBarButtonItem) {
        
        //Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Report Menu
        let rptMenu = mainStoryBoard.instantiateViewController(withIdentifier: "rptMainMenuVC") as! ReportMainMenuVC
        
        //Call REport Menu
        self.present(rptMenu,animated: true,completion: nil)
    }
    
    //Search Video Rentals
    func srchVidRentals(inSrchParam: String) { //Search Param may be either first or lastnames
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Entity
        let rentalEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Rental")
        
        //Predicate Search
        
        rentalEntity.predicate = NSPredicate(format: "firstname == %@ || lastname == %@", inSrchParam, inSrchParam)
        
        //Set result fault
        rentalEntity.returnsObjectsAsFaults = false
        
        //Loop through the Rental Database
        do {
            
            let results = try context.fetch(rentalEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        guard let resFirstname = result.value(forKey: "firstname") else {
                            print("No value found in firstname")
                            return
                        }
                        //Append value to the Firstname Array
                        firstnameArray.append(resFirstname as! String)
                        
                        guard let resLastname = result.value(forKey: "lastname") else {
                            print("No vlaue found in lastname")
                            return
                        }
                        //Append value to the Lastname Array
                        lastnameArray.append(resLastname as! String)
                        
                        
                        guard let resTitle = result.value(forKey: "filmTitle") else {
                            print("No value found in film tile")
                            return
                        }
                        //Append value to the Title Array
                        titleArray.append(resTitle as! String)
                        
                        guard let resCost = result.value(forKey: "cost") else {
                            print("Nil value in the cost field")
                            return
                        }
                        //Append result value to the Cost Array
                        costArray.append(resCost as! Double)
                        
                        guard let resRentalDate = result.value(forKey: "dateRented") else {
                            print("Nil value found in date field")
                            return
                        }
                        //Append result to Rental Date
                        rentalDateArray.append(resRentalDate as! Date)
                        
                        guard let resRtnDate = result.value(forKey: "returnDate") else {
                            print("Nil value in the return date field")
                            return
                        }
                        //Append result of Return Date Array
                        rtnDateArray.append(resRtnDate as! Date)
                        
                        
                    }
                    
                    //Test Array Data
                    print(firstnameArray)
                    print(lastnameArray)
                    print(titleArray)
                    
            }
        } catch {
            print("Unable to retreive records")
        }
        
        
    }
    
    

 

}

//TableView extension
extension RentalSearchRpt_VC: UITableViewDelegate, UITableViewDataSource {
    
    //Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstnameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewOutletTableView.dequeueReusableCell(withIdentifier: "SrchRptCell", for: indexPath) as! videoSearchRental_TVCell
        
        //Assign cell to array value
        cell.firstnameOutletCell.font = cell.firstnameOutletCell.font?.withSize(14)
        cell.firstnameOutletCell.textColor = UIColor.blue
        cell.firstnameOutletCell.text = "Firstname: \(firstnameArray[indexPath.row])"
        
        cell.lastnameOutletCell.font = cell.lastnameOutletCell.font?.withSize(14)
        cell.lastnameOutletCell.textColor = UIColor.blue
        cell.lastnameOutletCell.text = "Lastname: \(lastnameArray[indexPath.row])"
        
        cell.titleOutletCell.font = cell.titleOutletCell.font?.withSize(14)
        cell.titleOutletCell.text = "Title: \(titleArray[indexPath.row])"
        
        cell.costOutletCell.font = cell.costOutletCell.font?.withSize(14)
        cell.costOutletCell.textColor = UIColor.red
        cell.costOutletCell.text = "Cost: \(costArray[indexPath.row])"
        
        cell.rentalDateOutletCell.font = cell.rentalDateOutletCell.font?.withSize(14)
        cell.rentalDateOutletCell.text = "RentalDate: \(rentalDateArray[indexPath.row])"
        
        cell.rtnDateOutletCell.font = cell.rtnDateOutletCell.font?.withSize(14)
        cell.rtnDateOutletCell.text = "Return Date: \(rtnDateArray[indexPath.row])"
        
        
        return cell
    }
}
