//
//  MyPlacesViewController.swift
//  YuluDemo
//
//  Created by Admin on 10/18/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MyPlacesViewController: UIViewController {

    private var viewModel:MyPlacesViewModel! // ViewModel
    
    @IBOutlet weak var myPlaceTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MyPlacesViewModel(dataProvider: MyPlacesAPIDataProvider())
        setUpViewModel()
        viewModel.loadMyPlaces()
        
    }
    
    
    /// Initialize ViewModel class and setus up its callback closures
    private func setUpViewModel() {
        
        viewModel.reloadList = { [weak self] in
            self?.myPlaceTableView.reloadData()
            
        }
    }
    
}



extension MyPlacesViewController : UITableViewDelegate, UITableViewDataSource {
    
//    func registerCell()  {
//
//        self.myPlaceTableView.register(MyPlaceTableViewCell.self, forCellReuseIdentifier: "myPlaceTableViewCell")
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return viewModel.numberofItems();
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPlaceTableViewCell",
                                                 for: indexPath) as? MyPlaceTableViewCell
        
        let myplace = self.viewModel.myPlacesListItem(at: indexPath)
        cell?.pTitle.text = myplace?.title
        cell?.PDescription.text = "this nice place"
        //cell.textLabel?.text = "My Places"
        return cell!
    }
    
    
    
}
