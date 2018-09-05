//
//  SecondViewController.swift
//  UdemyApp3
//
//  Created by Cristian Misael Almendro Lazarte on 8/19/18.
//  Copyright © 2018 Cristian Misael Almendro Lazarte. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var fibonacci : [Int] = [0,1];
    var fibId = 2;
    
    @IBOutlet weak var LblFibId: UILabel!
    
    @IBOutlet weak var textViewResult: UITextView!
    
    @IBOutlet weak var lblGoldNum: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    var wantsGoldNum = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateLabel(id: Int(self.stepper.value))
        
    }
    
    
    
    func generateFibNumbers(){
        
        
        /*if(fibId<=1||fibId>100){
         return
         }*/
        
        //Generar numeros de fib. hasta el fibId
        fibonacci = [0,1]
        
        for i in 2...fibId {
            fibonacci.append(fibonacci[i-1]+fibonacci[i-2])
        }
        
        let fibStr : [String] = fibonacci.compactMap({ String($0)});
        let result : String = fibStr.joined(separator: "\n");
        self.textViewResult.text = result;
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        
        updateLabel(id: Int(sender.value))
    }
    
    func updateLabel(id: Int){
        self.fibId = id
        self.LblFibId.text = "\(self.fibId)"
        generateFibNumbers()
        calculateGoldNum()
    }
    
    func calculateGoldNum() {
        if (self.wantsGoldNum){
            //hay que generar el número de oro como cociente entre los dos últimos de fibonacci
            let last = Double(fibonacci[fibonacci.count-1])
            let previous = Double(fibonacci[fibonacci.count-2])
            let goldNum = last / previous
            self.lblGoldNum.text = "\(goldNum)"
        } else {
            //ponemos un texto por defcto en la etiqueta...
            self.lblGoldNum.text = "Ver el número de oro"
        }
    }
    
    @IBAction func switchMoved(_ sender: UISwitch) {
        self.wantsGoldNum = sender.isOn
        calculateGoldNum()
    }
    
}

