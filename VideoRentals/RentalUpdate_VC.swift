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
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Format ViewController
    func formatVC() {
        
    }
    
    
    //Call Update / Delete menu - UpdateCatalogueVC - identifier updateDeleteVC
    @IBAction func backToUpdateDeleteMenuItem(_ sender: UIBarButtonItem) {
        
        //Set StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Update / Delete menu
        let updateDelete = mainStoryBoard.instantiateViewController(withIdentifier: "updateDeleteVC") as! updateCatalogueVC
        
        self.present(updateDelete,animated: true,completion: nil)
        
    }
    



}
