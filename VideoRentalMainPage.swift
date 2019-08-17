//
//  VideoRentalMainPage.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 17/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class VideoRentalMainPage: UIViewController {
    
    //Outlets for Main Page
    @IBOutlet weak var slidebarOutletView: UIView!
    @IBOutlet weak var addVideoOutletLabel: UILabel!
    @IBOutlet weak var rentVideoOutletLabel: UILabel!
    @IBOutlet weak var reportMenuOutletLabel: UILabel!
    @IBOutlet weak var databaseUpdateOutletLabel: UILabel!
    
    
    
    //Outlet for leading Constraint


    @IBOutlet weak var slideBarLeadingOutletConstraint: NSLayoutConstraint!
    
    //Set Slidebar launch start point
    var menuShowing =  false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Insert custom functions
        formatVC() //Background for View Controller
        
        //Menu function
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    

//Format the MainPage
    func formatVC() {
        
        //Setbackground image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "videoRentalBackgorund.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Format Labels
        addVideoOutletLabel.textColor = UIColor.white
        rentVideoOutletLabel.textColor = UIColor.white
        reportMenuOutletLabel.textColor = UIColor.white
        databaseUpdateOutletLabel.textColor = UIColor.white
        
        //Set the background color for the slide bar
        slidebarOutletView.backgroundColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 0.3200717038)
        
        //Set slidebar starting point
        //leadingOutletConstraint.constant = -165
        slideBarLeadingOutletConstraint.constant = -165
        
        
        
    }
    
    //Menubar Action
    @IBAction func menuActionButton(_ sender: UIBarButtonItem) {
        
        //Check if Menubar is showing
        if(menuShowing) {
            slideBarLeadingOutletConstraint.constant = -165
            
        } else {
            
            slideBarLeadingOutletConstraint.constant = 0
            
            UIAnimate()
            
        }
        
        menuShowing = !menuShowing
        UIAnimate()
    }
    
    
    //Function to animate the slide bar
    func UIAnimate() {
        UIView.animate(withDuration: 0.3, animations: self.view.layoutIfNeeded)
        
    }
}
