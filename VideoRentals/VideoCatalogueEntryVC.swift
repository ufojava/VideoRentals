//
//  VideoCatalogueEntryVC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 18/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData


class VideoCatalogueEntryVC: UIViewController {
    
    //Outlet for Record Entry
    @IBOutlet weak var backToMainPageOutletItem: UIBarButtonItem!
    @IBOutlet weak var navigationBarOutletNav: UINavigationBar!
    @IBOutlet weak var imageOutletView: UIImageView!
    @IBOutlet weak var cataloguOutletText: UITextField!
    @IBOutlet weak var filmTitleOutleuText: UITextField!
    @IBOutlet weak var fileGenreOutletLabel: UILabel!
    @IBOutlet weak var genrePickOutletPickerView: UIPickerView!
    @IBOutlet weak var quantityOutletText: UITextField!
    @IBOutlet weak var rentalCostOutletText: UITextField!
    @IBOutlet weak var addFilmOutletButton: UIButton!
    @IBOutlet weak var genreOutletLabel: UILabel!
    
    
    
    //Variable for Genre - PickerView
    var filmGenreArray = ["Horror","Thriller","Comedy","Action","General"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function
        formatVC() //Format Textfield and Buttons
        conPickerView() //Connect Pickerview
        createCatalogueNo()
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
        
        //Format the navigation bar
        navigationBarOutletNav.layer.shadowOpacity = 1
        navigationBarOutletNav.layer.shadowRadius = 5
        navigationBarOutletNav.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format fields
        cataloguOutletText.textColor = UIColor.red
        cataloguOutletText.isEnabled = false //To disable editing to text
        cataloguOutletText.isUserInteractionEnabled = false //Also to disable editing
        cataloguOutletText.textColor = UIColor.blue
        cataloguOutletText.autocapitalizationType = .allCharacters
        cataloguOutletText.layer.shadowOpacity = 1
        cataloguOutletText.layer.shadowRadius = 5
        cataloguOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        
       
        filmTitleOutleuText.layer.shadowOpacity = 1
        filmTitleOutleuText.layer.shadowRadius = 5
        filmTitleOutleuText.layer.shadowOffset = CGSize(width: 3, height: 3)
        filmTitleOutleuText.clearButtonMode = .always
        
        fileGenreOutletLabel.layer.shadowOpacity = 1
        fileGenreOutletLabel.layer.shadowRadius = 5
        fileGenreOutletLabel.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        imageOutletView.image = UIImage(named: "movieProjectorIcon.png")
        
        
        self.genrePickOutletPickerView.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        genrePickOutletPickerView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        genrePickOutletPickerView.layer.shadowOpacity = 1
        genrePickOutletPickerView.layer.shadowRadius = 5
        genrePickOutletPickerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        genrePickOutletPickerView.layer.cornerRadius = 15
        genrePickOutletPickerView.layer.masksToBounds = false
        
        
        
        quantityOutletText.layer.shadowOpacity = 1
        quantityOutletText.layer.shadowRadius = 5
        quantityOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        quantityOutletText.clearButtonMode = .always
        
        rentalCostOutletText.layer.shadowOpacity = 1
        rentalCostOutletText.layer.shadowRadius = 5
        rentalCostOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        rentalCostOutletText.clearButtonMode = .always
        
        //Format the Add Button
        
        addFilmOutletButton.setTitleColor(.white, for: .normal)
        addFilmOutletButton.backgroundColor = #colorLiteral(red: 0.506442913, green: 0.3871898624, blue: 0.574860394, alpha: 0.94)
        addFilmOutletButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addFilmOutletButton.layer.shadowOpacity = 1
        addFilmOutletButton.layer.shadowRadius = 5
        addFilmOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        addFilmOutletButton.layer.cornerRadius = 10
        
        
        
        
        
    }
    
    //Connect PickerView
    
    func conPickerView() {
        
        //Connect DataSource and Delegate
        genrePickOutletPickerView.delegate = self
        genrePickOutletPickerView.dataSource = self
    }
    
    
    //Function to autocreate cataloge number
    func createCatalogueNo() {
        
        //Variable to store counter
        var catalogueNo = 0
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Declare Entity
        let catalogueEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Catalogue")
        
        catalogueEntity.returnsObjectsAsFaults = false
        
        //Check CoreData
        do {
            let results = try context.count(for: catalogueEntity)
                catalogueNo = results + 1
                    cataloguOutletText.text = String(catalogueNo)
                        print("The next catalogue number is: \(catalogueNo)")
            
        } catch {
            print("Unable to get new number")
        }
        
    }
    


}

extension VideoCatalogueEntryVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Set number of sections
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Set number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filmGenreArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filmGenreArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        fileGenreOutletLabel.textColor = UIColor.red
        fileGenreOutletLabel.text = filmGenreArray[row]
    }
    
    
    
}
