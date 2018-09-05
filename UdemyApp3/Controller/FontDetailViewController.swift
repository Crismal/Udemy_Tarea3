//
//  FontDetailViewController.swift
//  UdemyApp3
//
//  Created by Cristian Misael Almendro Lazarte on 9/2/18.
//  Copyright © 2018 Cristian Misael Almendro Lazarte. All rights reserved.
//

import UIKit

class FontDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    var FamilyName : String = "";
    
    var fonts : [String] = [];
    
    
    @IBOutlet weak var labelTittle: UILabel!
    
    @IBOutlet weak var pickerFonts: UIPickerView!
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.labelTittle.text = FamilyName;
        self.labelTittle.font =  UIFont(name: FamilyName, size: 20);
        
        self.pickerFonts.dataSource = self;
        self.pickerFonts.delegate = self;
        
        self.textView.font = UIFont(name: self.fonts[0], size: 15.0);
        
        if fonts.count == 0
        {
            self.pickerFonts.isHidden = true;
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil);
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UIPickerView Data source methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fonts.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.fonts[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textView.font = UIFont(name: fonts[row], size: 15.0);
        
    }
}
