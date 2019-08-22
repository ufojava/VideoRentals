//
//  AllCatalogueVC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 22/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class AllCatalogueVC: UIViewController {
    
    //Outlet View controller
    @IBOutlet weak var navBarOutletNav: UINavigationBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function call from here
        formatVC() //Format function call
    }
    
    //Format process for View Controller
    func formatVC() {
        
        //Set background color
        self.view.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        
        //Format navigation bar
        navBarOutletNav.layer.shadowOpacity = 1
        navBarOutletNav.layer.shadowRadius = 5
        navBarOutletNav.layer.shadowOffset = CGSize(width: 3, height: 3)

        
    }
    
    
    //Function to call menu
    @IBAction func backToMenuActionItem(_ sender: UIBarButtonItem) {
        
        //Set MainStoryboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Report Menu Call
        let reportMenu = mainStoryBoard.instantiateViewController(withIdentifier:"rptMainMenuVC") as! ReportMainMenuVC
        
        //Call the Reports Menu fucntion
        self.present(reportMenu,animated: true,completion: nil)
        
    }
    
    



}
