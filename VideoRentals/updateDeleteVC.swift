//
//  updateDeleteVC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 30/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData


//Update and Delete Form
class updateDeleteVC: UIViewController {
    
    //Outlets for Update and Delete Record Form
    @IBOutlet weak var updateDeleteOutletNavbar: UINavigationBar!
    
    //Outlets for the images
    @IBOutlet weak var updateOutletImage: UIImageView!
    @IBOutlet weak var deleteOutletImage: UIImageView!
    
    //Outlet for the Buttons
    @IBOutlet weak var searchRecordOutletButton: UIButton!
    @IBOutlet weak var updateOutletButton: UIButton!
    @IBOutlet weak var deleteOutletButton: UIButton!
    @IBOutlet weak var resetScreenOutletButton: UIButton!
    
    //Outlet Text Fields
    @IBOutlet weak var catalogueOutletText: UITextField!
    @IBOutlet weak var titleOutletText: UITextField!
    @IBOutlet weak var qtyOutletText: UITextField!
    @IBOutlet weak var rentalCostOutletText: UITextField!
    
    //Outlet Labels
    @IBOutlet weak var pickerviewOutletLabel: UILabel!
    @IBOutlet weak var formInfoOutletLabel: UILabel!
    
    
    //Outlet for Pickerview
    @IBOutlet weak var pickerviewOutletView: UIPickerView!
    
    
    //Variable for Genre - PickerView
    var filmGenreArray = ["Horror","Thriller","Comedy","Action","General"]
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Call custom functions
        formatVC() //Format the view controller
        conDelData() //Connect Delegate and Datasource
    }
    
    
    //Button Action
    @IBAction func searchButtonAction(_ sender: UIButton) {
        
        //Call Function
        //let catNoConvert = (catalogueOutletText.text! as NSString).intValue
        
        srchCatalogue(inCatNo: catalogueOutletText.text!)
    }
    
    //Call update record
    @IBAction func updateCatAction(_ sender: UIButton) {
        
        //Call function
        
        if catalogueOutletText.text != "" {
            
            //call function
            updateCatEntity(inCatNo: catalogueOutletText.text!)
            
            //Set information action
            formInfoOutletLabel.textColor = UIColor.white
            formInfoOutletLabel.text = "Catalogue Updated!!"
            
            //Reset Fields
            resetField() //reset fields
            
            
            //Delay clear information
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.formInfoOutletLabel.text = ""
            }
            
        }
        
    }
    
    //Reset Screen Button
    @IBAction func resetScreenButton(_ sender: UIButton) {
        resetField() //Reset the screen
    }
    
    
    
    //Format ViewController
    func formatVC() {
        
        //Background Color
        self.view.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        
        //Format the Navbar
        updateDeleteOutletNavbar.layer.shadowOpacity = 1
        updateDeleteOutletNavbar.layer.shadowRadius = 5
        updateDeleteOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Add images to the image
        updateOutletImage.image = UIImage(named: "updateRecords2.png")
        deleteOutletImage.image = UIImage(named: "deleteRcord2.png")
        
        //Change Button Text color
        searchRecordOutletButton.setTitleColor(.white, for: .normal)
        searchRecordOutletButton.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        searchRecordOutletButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        searchRecordOutletButton.layer.shadowOpacity = 1
        searchRecordOutletButton.layer.shadowRadius = 5
        searchRecordOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        searchRecordOutletButton.layer.cornerRadius = 10
        
        updateOutletButton.setTitleColor(.white, for: .normal)
        updateOutletButton.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        updateOutletButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        updateOutletButton.layer.shadowOpacity = 1
        updateOutletButton.layer.shadowRadius = 5
        updateOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        updateOutletButton.layer.cornerRadius = 10
        
        deleteOutletButton.setTitleColor(.white, for: .normal)
        deleteOutletButton.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        deleteOutletButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        deleteOutletButton.layer.shadowOpacity = 1
        deleteOutletButton.layer.shadowRadius = 5
        deleteOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        deleteOutletButton.layer.cornerRadius = 10
        
        resetScreenOutletButton.setTitleColor(.white, for: .normal)
        resetScreenOutletButton.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        resetScreenOutletButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        resetScreenOutletButton.layer.shadowOpacity = 1
        resetScreenOutletButton.layer.shadowRadius = 5
        resetScreenOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        resetScreenOutletButton.layer.cornerRadius = 10
        
        //Format Text fields
        catalogueOutletText.layer.shadowOpacity = 1
        catalogueOutletText.layer.shadowRadius = 5
        catalogueOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        catalogueOutletText.clearButtonMode = .always
        
        titleOutletText.layer.shadowOpacity = 1
        titleOutletText.layer.shadowRadius = 5
        titleOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        titleOutletText.clearButtonMode = .always
        
        qtyOutletText.layer.shadowOpacity = 1
        qtyOutletText.layer.shadowRadius = 5
        qtyOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        qtyOutletText.clearButtonMode = .always
        
        rentalCostOutletText.layer.shadowOpacity = 1
        rentalCostOutletText.layer.shadowRadius = 5
        rentalCostOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        rentalCostOutletText.clearButtonMode = .always
        
        //Set Pickerview colour
        pickerviewOutletView.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        pickerviewOutletView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pickerviewOutletView.layer.shadowOpacity = 1
        pickerviewOutletView.layer.shadowRadius = 5
        pickerviewOutletView.layer.shadowOffset = CGSize(width: 5, height: 5)
        pickerviewOutletView.layer.cornerRadius = 10
        pickerviewOutletView.layer.masksToBounds = false
        
        
       
        
    }
    
    //Viewcontroller navigation action
    @IBAction func backActionItem(_ sender: UIBarButtonItem) {
        
        //Set Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Update / Delete Menu
        let updateDeleteMenu = mainStoryBoard.instantiateViewController(withIdentifier: "updateDeleteVC") as! updateCatalogueVC
        
        //Call the Update and Delete Menu
        self.present(updateDeleteMenu,animated: true,completion: nil)
        
    }
    
    //PickerView Delegate and DataSource Connection
    func conDelData() {
        
        pickerviewOutletView.delegate = self
        pickerviewOutletView.dataSource = self
    }
    
    //Modify Catalogue records
    func srchCatalogue(inCatNo: String) {
        
        
        //Get Catalogue Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Get Catalogue Entity
        let catalogueEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Catalogue")
        
        catalogueEntity.predicate = NSPredicate(format: "catNo == %@", inCatNo)
        
        //Set fault results to false
        catalogueEntity.returnsObjectsAsFaults = false
        
        //Query Catalogue Entity
        
        do {
            
            let results = try context.fetch(catalogueEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        guard let resCatNo = result.value(forKey: "catNo") else {
                            print("Catalogue Number has nil value")
                            return
                        }
                        
                        guard let resFilmTitle = result.value(forKey: "filmTitle") as? String else {
                            print("Nil value found in the titles field")
                            return
                        }
                        
                        guard let resGenre = result.value(forKey: "genre") as? String else {
                            print("Nil value found in Genre field")
                            return
                        }
                        
                        guard let resQty = result.value(forKey: "quantity") else {
                            print("Nil value found in quantity feild")
                            return
                        }
                        
                        guard let resCost = result.value(forKey: "rentalCost") else {
                            print("Nil value found in Cost field")
                            return
                        }
                        
                        //Get results from search - Test Output
                        print(resCatNo)
                        print(resFilmTitle)
                        print(resGenre)
                        print(resQty)
                        print(resCost)
                        
                        //Assign the search result to the form field
                        catalogueOutletText.text = "\(resCatNo)" //Integer
                        titleOutletText.text = resFilmTitle
                        pickerviewOutletLabel.text = resGenre
                        qtyOutletText.text = "\(resQty)" //Interger
                        rentalCostOutletText.text = "\(resCost)" //Double

                    }
                }
        } catch {
            print("Unable to get record")
        }
        
    }
    
    //Function to update the Catalogue Entity
    func updateCatEntity(inCatNo: String) {
        
        //Set CoreData contex
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set the CoreData Entity
        let cataEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Catalogue")
        
        //Predicate Catalogue Entity
        cataEntity.predicate = NSPredicate(format: "catNo == %@", inCatNo)
        
        //Set fault result
        cataEntity.returnsObjectsAsFaults = false
        
        
        //Retreive predicated result from Catalogue Entity
        do {
            
            let results = try context.fetch(cataEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        guard result.value(forKey: "catNo") != nil else {
                            print("Nil value found in Cat No")
                            return
                        }
                        
                        //Update catalogue entity
                        result.setValue(Int(catalogueOutletText.text!), forKey: "catNo") //Set to integer
                        result.setValue(titleOutletText.text, forKey: "filmTitle")
                        result.setValue(pickerviewOutletLabel.text, forKey: "genre")
                        result.setValue(Int(qtyOutletText.text!), forKey: "quantity") //Set to integer
                        result.setValue(Double(rentalCostOutletText.text!), forKey: "rentalCost") //Set to double
                    }
        }
        } catch {
            print("Unable to retreive record")
        }
    
        //Save record
        
        do {
           try context.save()
            
            
        } catch {
            print("Unable to save record")
        }
        
        
        
    }
    
    //Function to reset form fields
    func resetField() {
        catalogueOutletText.text = ""
        titleOutletText.text = ""
        pickerviewOutletLabel.text = ""
        qtyOutletText.text = ""
        rentalCostOutletText.text = ""
    }


}

//Setup the Pickerview
extension updateDeleteVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Number of Components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filmGenreArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filmGenreArray[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerviewOutletLabel.textColor = UIColor.red
        pickerviewOutletLabel.text = filmGenreArray[row]
    }
}
