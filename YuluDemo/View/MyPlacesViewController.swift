//
//  MyPlacesViewController.swift
//  YuluDemo
//
//  Created by Admin on 10/18/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MyPlacesViewController: UIViewController {

    @IBOutlet weak var myPlaceTableView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

extension MyPlacesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPlaceTableViewCell",
                                                 for: indexPath)
        
        cell.textLabel?.text = "My Places"
        return cell
    }
    
    
    
}
