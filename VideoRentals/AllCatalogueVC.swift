//
//  AllCatalogueVC.swift
//  VideoRentals
//
//  Created by Ufuoma Okoro on 22/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData



class AllCatalogueVC: UIViewController {
    
    //Outlet for the table view and cell
    @IBOutlet weak var tableviewOutletView: UITableView!
    @IBOutlet weak var navBarOutletNav: UINavigationBar!
    
    
    //TableView Array
    var catNoArray: [String] = []
    var filmTitleArray: [String] = []
    var genreArray: [String] = []
    var qtyArray: [String] = []
    var rentalArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function call from here
        formatVC() //Format function call
        tableViewConnections() //Delegate and Datasource connections
        getFilmCatalogue()
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
    
    //set TableView Conneciotns
    func tableViewConnections() {
        
        tableviewOutletView.delegate = self
        tableviewOutletView.dataSource = self
    }
    
    //STOPPED HERE - RETRIEVE DATA FROM COREDATA
    
    //Get Film catalogue
    func getFilmCatalogue() {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set CoreData Entity
        let catalogueEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Catalogue")
        
        //Set result faults
        catalogueEntity.returnsObjectsAsFaults = false
        
        
        //Loop through Catalogue data and display results
        
        do {
            
            let results = try context.fetch(catalogueEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        //Catalogue number for video
                        guard let resCatNo = result.value(forKey: "CatNo") else {
                            print("CatNo has nil value")
                            return
                        }
                        
                        let convertResCatNo = "\(resCatNo)"
                        catNoArray.append(convertResCatNo)
                        
                        //Film Title
                        guard let resFilmTitle = result.value(forKey: "filmTitle") else {
                            print("Nil value found in film title field")
                            return
                        }
                        
                        filmTitleArray.append(resFilmTitle as! String)
                        
                        //Genre
                        guard let resGrere = result.value(forKey: "genre") else {
                            print("Genre filed had a nil value")
                            return
                        }
                        
                        genreArray.append(resGrere as! String)
                        
                        
                        
                        
                    }
                    print(catNoArray)
                    print(genreArray)
                    
                    
        }
        } catch {
            print("Unable to fixnd record")
        }
    


}
    
}

//Extension to configure tableview
extension AllCatalogueVC: UITableViewDelegate, UITableViewDataSource {
    
    //Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catNoArray.count
    }
    
    //Cell reference
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewOutletView.dequeueReusableCell(withIdentifier: "rptCell") as! RentalTableViewCell
        
        cell.catalogueNoOutletLabel.text = catNoArray[indexPath.row]
        cell.filmTitleOutletLabel.text = filmTitleArray[indexPath.row]
        cell.genreOutletLabel.text = genreArray[indexPath.row]
        //cell.quantityOutletLabel.text = qtyArray[indexPath.row]
        //cell.rentalOutletLabel.text = rentalArray[indexPath.row]
        
        return cell
    }
}


