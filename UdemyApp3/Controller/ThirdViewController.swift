//
//  ThirdViewController.swift
//  UdemyApp3
//
//  Created by Cristian Misael Almendro Lazarte on 8/20/18.
//  Copyright © 2018 Cristian Misael Almendro Lazarte. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
 
    var families : [String] = [];
    
    var fonts : [String: [String]] = [:];
    
    @IBOutlet weak var Tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        families = UIFont.familyNames.sorted(by: { return $0 < $1 })
        
        for fam in families{
            fonts[fam] = UIFont.fontNames(forFamilyName: fam);
        }
        
        print(fonts);
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        if  segue.identifier == "ShowFontsForFamily"
        {
            let navigation = segue.destination as! UINavigationController;
            let destinationVC = navigation.topViewController as! FontDetailViewController;
            
            let idx = self.Tabla.indexPathForSelectedRow!.row; 
            destinationVC.FamilyName = self.families[idx];
            destinationVC.fonts = self.fonts[self.families[idx]]!;
        }
         
    }
 
    
    // MARK: - Métodos del protocolo UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.families.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for: indexPath);
        
        let fontFamily = families[indexPath.row];
        cell.textLabel?.text = fontFamily;
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20.0);
        return cell;
    }
    
    //MARK: - Métodos del protocolo UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row;
        let fontFamily = families[row];
        let familyFonts = fonts[fontFamily];
        
        print(familyFonts);
    }
}
