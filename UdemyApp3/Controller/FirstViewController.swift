//
//  FirstViewController.swift
//  UdemyApp3
//
//  Created by Cristian Misael Almendro Lazarte on 8/19/18.
//  Copyright © 2018 Cristian Misael Almendro Lazarte. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var TxbAge: UITextField!
    
    @IBOutlet weak var sliderAge: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.UpdateLabelAge();
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder();
        print("hemos pulsaso la tecla enter");
        return true;
    }
    
    
    @IBAction func sliderAgeMoves(_ sender: UISlider) {
       self.UpdateLabelAge();
    }
    
    func UpdateLabelAge()
    {
        self.lblAge.text = "\(Int(self.sliderAge.value))";
        self.TxbAge.text = "\(Int(self.sliderAge.value))";
    }
    
    @IBAction func ValidarEdad(_ sender: UIButton) {
        
        if self.TxbAge.text == "Cristian" {
            self.view.backgroundColor = UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 0.5);
        }
        else{
            if self.lblAge.text == "19"{
                self.view.backgroundColor = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 0.5);
            }
        }
    } 
}

