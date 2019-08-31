//
//  updateCatalogueVCViewController.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 27/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//Update and Delete Main Menu
class updateCatalogueVC: UIViewController {
    
    //Outlets for Update and Deletions
    @IBOutlet weak var navbarOutletNav: UINavigationBar!
    @IBOutlet weak var catalogueRentalLabel: UILabel!
    @IBOutlet weak var rentalOutletLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //All Custom functions
        formatVC() //Call Format Function
    }
    
    //Format for Update and Deletion View Controller
    func formatVC() {
        
        //Set background colour
        self.view.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        
        //Format Navigation bar
        navbarOutletNav.layer.shadowOpacity = 1
        navbarOutletNav.layer.shadowRadius = 5
        navbarOutletNav.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Set Label text color
        catalogueRentalLabel.textColor = UIColor.white
        rentalOutletLabel.textColor = UIColor.white
        
        
    }
    
    //To Home Menu
    @IBAction func homeMainMenuItem(_ sender: UIBarButtonItem) {
        
        //Set Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Main Menu
        let mainMaenu = mainStoryBoard.instantiateViewController(withIdentifier: "HomePageVC") as! VideoRentalMainPage
        
        //Call Main Menu
        self.present(mainMaenu,animated: true,completion: nil)
    }
    
    //Update and Delete Button Action
    @IBAction func updateDeleteCat(_ sender: UIButton) {
        
        //Set Main StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Catalogue Update and Delete form
        let updateDeleteForm = mainStoryBoard.instantiateViewController(withIdentifier: "updateDeleteFromVC") as! updateDeleteVC
        
        //Call Updade and Delete form
        self.present(updateDeleteForm,animated: true,completion: nil)
    }
    
    
    
    
    

}
