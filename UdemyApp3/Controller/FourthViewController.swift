//
//  FourthViewController.swift
//  UdemyApp3
//
//  Created by Cristian Misael Almendro Lazarte on 9/2/18.
//  Copyright © 2018 Cristian Misael Almendro Lazarte. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    var pesos : [String] = [];
    var tallas : [String] = [];
    
    @IBOutlet weak var pickerViewPesos: UIPickerView!
    @IBOutlet weak var pickerViewTallas: UIPickerView!
    @IBOutlet weak var imc: UILabel!
    
    @IBOutlet weak var imagenPeso: UIImageView!
    @IBOutlet weak var resultadoTexto: UILabel!
    
    var pesoActual = 0.0;
    var tallaActual = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.LlenarPesos();
        self.LlenarTallas();
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var cantidad = 0;
        
        if self.pickerViewPesos == pickerView {
            cantidad = self.pesos.count;
        }
        
        if self.pickerViewTallas == pickerView {
            cantidad = self.tallas.count;
        }
        return cantidad;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        var titulo = "";
        
        if self.pickerViewPesos == pickerView {
            titulo = self.pesos[row];
        }
        
        if self.pickerViewTallas == pickerView {
            titulo = self.tallas[row];
        }
        return titulo;
        
    }
    
    func LlenarPesos(){
        
        let inicio = 20 ;
        let fin = 100 ;
        
        for n in inicio...fin{
            pesos.append("\(n)");
        } 
    }
    

    func LlenarTallas(){
        let inicio = 120 ;
        let fin = 220 ;
        
        for n in inicio...fin{
            tallas.append("\(n)");
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if self.pickerViewPesos == pickerView {
            self.pesoActual = Double(self.pesos[row])!;
        }
        
        if self.pickerViewTallas == pickerView {
            self.tallaActual = Double(self.tallas[row])!;
        }
        
        let resultado = Double(pesoActual / (tallaActual/100 * tallaActual/100))
        
        print(resultado);
        
        self.imc.text = "\(resultado)";
        
        if resultado > 18.5 && resultado < 24.99 {
            self.imagenPeso.image = UIImage(named: "NORMAL");
            resultadoTexto.text = "Normal";
        }
        
        if resultado > 25.00 && resultado < 29.99 {
            self.imagenPeso.image = UIImage(named: "SOBREPESO");
            resultadoTexto.text = "Sobrepeso";
        }
        
        if resultado > 30.00 {
           self.imagenPeso.image = UIImage(named: "OBESIDAD");
            resultadoTexto.text = "Obsesidad";
        }
    }
}
