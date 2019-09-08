//
//  AllVideoRentalRpt_VC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 08/09/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData


//All Video Rentals Report
class AllVideoRentalRpt_VC: UIViewController {
    
    //Navbar Outlets
    @IBOutlet weak var navbarOutletNavBar: UINavigationBar!
    
    //TableView Outlet
    @IBOutlet weak var tableviewOutletTableview: UITableView!
    
    
    //Array to hold tableview Rental records
    var firstnameArray: [String] = []
    var lastnameArray: [String] = []
    var titleArray: [String] = []
    var rtnDateArray: [Date] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Call custom function
        delDataCon() //Connect Delegate and Datasource
        getRentalData()
    }
    
    
    
    //Navigation bar action
    @IBAction func backToRptMenu(_ sender: UIBarButtonItem) {
        
        //Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Report Menu -  ReportMainMenuVC - rptMainMenuVC
        let reportMenu = mainStoryBoard.instantiateViewController(withIdentifier: "rptMainMenuVC") as! ReportMainMenuVC
        
        //Call the main menu
        self.present(reportMenu,animated: true,completion: nil)
        
    }
    
    //Function to get all rental records from CoreDat - Rentals Entiry
    func getRentalData() {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Rental Entity
        let rentalEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Rental")
        
        //SetObjetc result
        rentalEntity.returnsObjectsAsFaults = false
        
        //Get data from Database
        do {
            
            let results = try context.fetch(rentalEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        guard let resFirstname = result.value(forKey: "firstname") else {
                            print("Unable to get firstname")
                            return
                        }
                        
                        //Firstname
                        firstnameArray.append(resFirstname as! String)
                        
                        guard let resLastname = result.value(forKey: "lastname") else {
                            print("Unable to get lastname")
                            return
                        }
                        //Lastname
                        lastnameArray.append(resLastname as! String)
                        
                        guard let resTitle = result.value(forKey: "filmTitle") else {
                            print("Unable to get film title")
                            return
                        }
                        
                        titleArray.append(resTitle as! String)
                        
                        guard let resRtnDate = result.value(forKey: "returnDate") else {
                            print("Unable to get return date")
                            return
                        }
                        rtnDateArray.append(resRtnDate as! Date)
                    }
            
        }
        
        } catch {
            print("Unable to get records")
        }
    
    
    }
    
    //TableView connection
    func delDataCon() {
        
        tableviewOutletTableview.delegate = self
        tableviewOutletTableview.dataSource = self
        
    }


}

//Function to define tableview
extension AllVideoRentalRpt_VC: UITableViewDelegate, UITableViewDataSource {

    //Number of Table Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstnameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewOutletTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllRentalRpt_TVC
        
        //Format cell text and colors
        cell.firstnameOutletText.font = cell.firstnameOutletText.font?.withSize(14)
        cell.firstnameOutletText.text = firstnameArray[indexPath.row]
        
        cell.lastnameOutletText.font = cell.lastnameOutletText.font?.withSize(14)
        cell.lastnameOutletText.text = lastnameArray[indexPath.row]
        
        cell.titleOutletText.font = cell.titleOutletText.font?.withSize(14)
        cell.titleOutletText.text = titleArray[indexPath.row]
        
        cell.rtnDateOutletText.font = cell.rtnDateOutletText.font?.withSize(14)
        cell.rtnDateOutletText.text = "\(rtnDateArray[indexPath.row])"
        
        
        return cell
    }
}
