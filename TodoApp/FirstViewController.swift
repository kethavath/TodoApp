//
//  FirstViewController.swift
//  TodoApp
//
//  Created by Thukaram Kethavath on 5/20/17.
//  Copyright © 2017 Thukaram Kethavath. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var items:[String] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
       override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidAppear(_ Animated:Bool){
            let userObject = UserDefaults.standard.object(forKey: "items")
            if let tempItems = userObject as? [String]
            {
                    items = tempItems
            }
 
            table.reloadData()
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if  editingStyle == UITableViewCellEditingStyle.delete{
            
            items.remove(at: indexPath.row)
            table.reloadData()
            
    UserDefaults.standard.set(items,forKey: "items")
            
        }
        
        
    }
    
}

