//
//  rentalUpdateDelete_TVC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 15/09/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//


//TableView Cell for Delete and update of Delete
import UIKit

class rentalUpdateDelete_TVC: UITableViewCell {
    
    //Outlets Tableview Cells for Rental and Updates
    @IBOutlet weak var firstnameOutletCell: UITextField!
    @IBOutlet weak var lastnameOutletCell: UITextField!
    @IBOutlet weak var titleOutletCell: UITextField!
    @IBOutlet weak var costOutletCell: UITextField!
    @IBOutlet weak var dateOutletCell: UITextField!
    @IBOutlet weak var returnOutletCell: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



}
