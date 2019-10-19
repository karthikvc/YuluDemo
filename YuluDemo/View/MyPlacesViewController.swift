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
        
        viewModel.loadMyPlaces()
        
    }
    
}

extension MyPlacesViewController : UITableViewDelegate, UITableViewDataSource {
    
//    func registerCell()  {
//
//        self.myPlaceTableView.register(MyPlaceTableViewCell.self, forCellReuseIdentifier: "myPlaceTableViewCell")
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPlaceTableViewCell",
                                                 for: indexPath) as? MyPlaceTableViewCell
        
        cell?.pTitle.text = "welcome"
        cell?.PDescription.text = "this nice place"
        //cell.textLabel?.text = "My Places"
        return cell!
    }
    
    
    
}
