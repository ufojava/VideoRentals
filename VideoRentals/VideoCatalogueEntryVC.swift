//
//  VideoCatalogueEntryVC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 18/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class VideoCatalogueEntryVC: UIViewController {
    
    //Outlet for Record Entry
    @IBOutlet weak var backToMainPageOutletItem: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function
        formatVC()
    }
    
    
    //Call Menu Action
    @IBAction func BackToMainPage(_ sender: UIBarButtonItem) {
        
        //Set MainStory Board
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Home Page
        let homePage = mainStoryBoard.instantiateViewController(withIdentifier: "HomePageVC") as! VideoRentalMainPage
        
        //Call the Main Page
        self.present(homePage,animated: true,completion: nil)
    }
    
    
    //Format View Controller
    func formatVC() {
        
        //Set the background for View Controller
        self.view.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
    }
    


}
