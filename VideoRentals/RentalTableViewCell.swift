//
//  RentalTableViewCell.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 23/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class RentalTableViewCell: UITableViewCell {
    
    //Outlets for tableview cell
    @IBOutlet weak var catalogueNoOutletLabel: UILabel!
    @IBOutlet weak var filmTitleOutletLabel: UILabel!
    @IBOutlet weak var genreOutletLabel: UILabel!
    @IBOutlet weak var quantityOutletLabel: UILabel!
    @IBOutlet weak var rentalOutletLabel: UILabel!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



}
