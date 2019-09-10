//
//  ReportMainMenuVC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 21/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class ReportMainMenuVC: UIViewController {
    
    //Outlet for View Controller
    @IBOutlet weak var navigationBarOutlet: UINavigationBar!
    @IBOutlet weak var catalogueOutletLabel: UILabel!
    @IBOutlet weak var videoSrchOutletLabel: UILabel!
    @IBOutlet weak var allRentalOutletLabel: UILabel!
    @IBOutlet weak var rentalSrchOutletLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom functions
        formatRptVC() //Format View Controller
    }
    
    
    //Format Report manu View Controller
    func formatRptVC() {
        
        //Set backgroung color
        self.view.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        
        //Format the navigation bar
        navigationBarOutlet.layer.shadowOpacity = 1
        navigationBarOutlet.layer.shadowRadius = 5
        navigationBarOutlet.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Text Colour for Labels
        catalogueOutletLabel.textColor = UIColor.white
        videoSrchOutletLabel.textColor = UIColor.white
        allRentalOutletLabel.textColor = UIColor.white
        rentalSrchOutletLabel.textColor = UIColor.white
    }
    

//Call the main Home Page
    @IBAction func backToMainPage(_ sender: UIBarButtonItem) {
        
        //Set Main StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Main Main Page
        let mainMenu = mainStoryBoard.instantiateViewController(withIdentifier: "HomePageVC") as! VideoRentalMainPage
        
        //Call Main Menu
        self.present(mainMenu,animated: true,completion: nil)
        
    }
    
    //Action to call All Catalogue Report
    @IBAction func allCatalogueTableRpt(_ sender: UIButton) {
        
        //Set Main Menu
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set All Catalogue Report
        let allCatalogueTable = mainStoryBoard.instantiateViewController(withIdentifier: "allCatTableReportVC") as! AllCatalogueVC
        
        //Call the All Catalogue Report
        self.present(allCatalogueTable,animated: true,completion: nil)
    }
    
    //All Rentals Report - ViewController AllVideoRentalRpt_VC with identifier allVideoRentalRptVC
    @IBAction func allVideoRentalsRpt(_ sender: UIButton) {
        
        //Set StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Call All Video Report
        let allRentalsRpt = mainStoryBoard.instantiateViewController(withIdentifier: "allVideoRentalRptVC") as! AllVideoRentalRpt_VC
        
        //Call Rental Video
        self.present(allRentalsRpt,animated: true,completion: nil)
    }
    
    //Call Search Rental Reports
    @IBAction func searchRentalReport(_ sender: UIButton) {
        
        //Main StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Search Report
        let rentalSrchRpt = mainStoryBoard.instantiateViewController(withIdentifier: "rentalSearchRptVC") as! RentalSearchRpt_VC
        
        //Call Rental Search Report
        self.present(rentalSrchRpt,animated: true,completion: nil)
    }
    
    


}
