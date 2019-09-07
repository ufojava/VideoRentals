//
//  videoRental.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 04/09/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//Video Rental Form
class videoRental: UIViewController {
    
//Navigation bar Outlets
    @IBOutlet weak var navbarOutletNav: UINavigationBar!
    

    //Text field Outlets
    @IBOutlet weak var catNoOutletText: UITextField!
    @IBOutlet weak var filmTitleOutletText: UITextField!
    @IBOutlet weak var remtalCostOutletText: UITextField!
    @IBOutlet weak var firstnameOutletText: UITextField!
    @IBOutlet weak var genreOutletText: UITextField!
    @IBOutlet weak var lastnameOutletText: UITextField!
    @IBOutlet weak var infoOutletText: UILabel!
    
    
    //Button Outlet
    @IBOutlet weak var searchOutletButton: UIButton!
    @IBOutlet weak var saveOutletButton: UIButton!
    
    //Date Label
    @IBOutlet weak var rentalDateOutletLabel: UILabel!
    @IBOutlet weak var returnDateOutletLabel: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function
        formatVC()
    }
    
    
    //Action Buttons
    
    //Search Record
    @IBAction func searchCataloguButton(_ sender: UIButton) {
        //Call function to search
        srchCatlogue(inCatNo: catNoOutletText.text!)
    }
    
    
    //Save new video rental
    @IBAction func saveNewRecord(_ sender: UIButton) {
        
        //Save new video record
        newVideoRecord()
        
        //Test get record
        //getVideo()
    }
    
    
    
    //Fromat Viewcontroller
    func formatVC() {
        
        //Format the background
        self.view.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        
        //Format Navigation bar
        navbarOutletNav.layer.shadowOpacity = 1
        navbarOutletNav.layer.shadowRadius = 5
        navbarOutletNav.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format Text fields
        catNoOutletText.layer.shadowOpacity = 1
        catNoOutletText.layer.shadowRadius = 5
        catNoOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        filmTitleOutletText.layer.shadowOpacity = 1
        filmTitleOutletText.layer.shadowRadius = 5
        filmTitleOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        filmTitleOutletText.isEnabled = false //Disable editing
        filmTitleOutletText.isUserInteractionEnabled = false
        
        genreOutletText.layer.shadowOpacity = 1
        genreOutletText.layer.shadowRadius = 5
        genreOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        genreOutletText.isEnabled = false
        genreOutletText.isUserInteractionEnabled = false
        
        remtalCostOutletText.layer.shadowOpacity = 1
        remtalCostOutletText.layer.shadowRadius = 5
        remtalCostOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        remtalCostOutletText.isEnabled = false
        remtalCostOutletText.isUserInteractionEnabled = false
        
        firstnameOutletText.layer.shadowOpacity = 1
        firstnameOutletText.layer.shadowRadius = 5
        firstnameOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        lastnameOutletText.layer.shadowOpacity = 1
        lastnameOutletText.layer.shadowRadius = 5
        lastnameOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format Date Labels
        returnDateOutletLabel.textColor = UIColor.white
        returnDateOutletLabel.font = returnDateOutletLabel.font.withSize(14)
        rentalDateOutletLabel.textColor = UIColor.white
        rentalDateOutletLabel.font = rentalDateOutletLabel.font.withSize(14)
        
       
        
        //Format Buttons
        searchOutletButton.setTitleColor(.white, for: .normal)
        searchOutletButton.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        searchOutletButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        searchOutletButton.layer.shadowOpacity = 1
        searchOutletButton.layer.shadowRadius = 5
        searchOutletButton.layer.cornerRadius = 10
        searchOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        saveOutletButton.setTitleColor(.white, for: .normal)
        saveOutletButton.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        saveOutletButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        saveOutletButton.layer.shadowOpacity = 1
        saveOutletButton.layer.shadowRadius = 5
        saveOutletButton.layer.cornerRadius = 10
        saveOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        
        
        
        
        
    }
    
    //Functions to call menu
    @IBAction func callHomePageItem(_ sender: UIBarButtonItem) {
        
        //Set StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Home Page
        let RentalHomePage = mainStoryBoard.instantiateViewController(withIdentifier: "HomePageVC") as! VideoRentalMainPage
        
        //Call Home page
        self.present(RentalHomePage,animated: true,completion: nil)
    }
    
    
    //Search Catalogue Entity for predicated data
    func srchCatlogue(inCatNo: String) {
        
        //Set Catalogue Entity
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set catalogueEntity
        let catEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Catalogue")
        
        //Search Predicate
        catEntity.predicate = NSPredicate(format: "catNo == %@", inCatNo)
        
        //Set fault result
        catEntity.returnsObjectsAsFaults = false
        
        //Loop through Entity to get lookup result
        do {
            
            let Results = try context.fetch(catEntity)
                if Results.count > 0 {
                    for result in Results as! [NSManagedObject] {
                        guard result.value(forKey: "catNo") != nil else {
                            print("Nil value in catNo field")
                            return
                        }
                        
                        guard let resFilmTitle = result.value(forKey: "filmTitle") as? String else {
                            print("Nil value found in film title field")
                            return
                        }
                        //Assign form text field with value
                        filmTitleOutletText.text = resFilmTitle
                        
                        guard let resGenre = result.value(forKey: "genre") as? String else {
                            print("Genre has nil value in field")
                            return
                        }
                        //Assign form text field with value
                        genreOutletText.text = resGenre
                        
                        guard let resRentalCost = result.value(forKey: "rentalCost") else {
                            print("Nil value found in Ental Cost field")
                            return
                        }
                        //Assign Rental cost
                        remtalCostOutletText.text = "\(resRentalCost)"
                    }
                    
        }
        
        
        
        } catch {
            print("Unable to get result from Database")
        }
    
    }
    
    //Create new Video Rental entry
    func newVideoRecord() {
        
        
        
        
        //Set context for Rental
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Rental Entity
        let rentalEntity = NSEntityDescription.entity(forEntityName: "Rental", in: context)
        
        //New Video Rental
        let newVideoRental = NSManagedObject(entity: rentalEntity!, insertInto: context)
        
        //Enter new record
        newVideoRental.setValue(filmTitleOutletText.text, forKey: "filmTitle")
        
        //Conver the cost to a double
        let costConvert = (remtalCostOutletText.text! as NSString).doubleValue
        newVideoRental.setValue(costConvert, forKey: "cost")
        
        newVideoRental.setValue(firstnameOutletText.text, forKey: "firstname")
        newVideoRental.setValue(lastnameOutletText.text, forKey: "lastname")
        
        newVideoRental.setValue(Date(), forKey: "dateRented")
        rentalDateOutletLabel.text = "\(Date())"
        
        let returnDate = Calendar.current.date(byAdding: .day, value: 5, to: Date())
        newVideoRental.setValue(returnDate, forKey: "returnDate")
        returnDateOutletLabel.text = "\(returnDate!)"
        
        //Save new record
        
        do {
            
            try context.save()
            
        } catch {
            
            print("Unable to save new record")
        }
        
    }
    
    //Get video Record test
    func getVideo() {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Rental Entity
        let videoRentalEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Rental")
        
        //Set fault result
        videoRentalEntity.returnsObjectsAsFaults = false
        
        //Get Record
        do {
            let results = try context.fetch(videoRentalEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        guard let resFirstname = result.value(forKey: "firstname") else {
                            print("Nil value in firstname")
                            return
                        }
                        guard let resLastname = result.value(forKey: "lastname") else {
                            print("Nil Value in lastname")
                            return
                        }
                        guard let resTitle = result.value(forKey: "filmTitle") else {
                            print("Nil value in Title")
                            return
                        }
                        guard let resRentalDate = result.value(forKey: "dateRented") else {
                            print("Nil value in rental date")
                            return
                        }
                        guard let resCost = result.value(forKey: "cost") else {
                            print("Nil value in Rental Cost")
                            return
                        }
                        
                        guard let resReturnDate = result.value(forKey: "returnDate") else {
                            print("Nil value on return date")
                            return
                        }
                        
                     //Print the retreived data
                        print(resFirstname)
                        print(resLastname)
                        print(resTitle)
                        print(resRentalDate)
                        print(resCost)
                        print(resReturnDate)
                    }
            }
        } catch {
            print("Unable to fetch records")
        }
        
    }



}
