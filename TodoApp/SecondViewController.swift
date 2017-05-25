//
//  SecondViewController.swift
//  TodoApp
//
//  Created by Thukaram Kethavath on 5/20/17.
//  Copyright © 2017 Thukaram Kethavath. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var items:NSMutableArray = []
    
    @IBOutlet var userText: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        
  let userObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        if let tempItems = userObject as? [String]
        {
            items = tempItems
            items.append(userText.text!)
        }
        else{
            
        items = [userText.text!]
        }
        UserDefaults.standard.set(items,forKey: "items")
        
        userText.text = ""
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
    return true
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
     }



}

