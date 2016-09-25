//
//  ViewController.swift
//  OpenLibrary
//
//  Created by jesus serrano on 24/09/16.
//  Copyright © 2016 gezuzm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var tfISBN: UITextField!
    @IBOutlet weak var tvResultado: UITextView!
    
    
    func sincrono()
    {
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + tfISBN.text!
        // se convierte a URL
        let url = NSURL(string: urls)
        // HACE UNA PETCION AL SERVIDOR
        
        let datos: NSData? = NSData(contentsOfURL: url!)
                // para mostrarlo hay qye decirel en que formato esta
        
        if datos != nil
        {
              let texto = NSString(data: datos!, encoding:NSUTF8StringEncoding)
                tvResultado.text = String(texto)
        }
        else
        {
            tvResultado.text = "Ocurrió un error, no hay conexion..."
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfISBN.text = "978-84-376-0494-7"
        
    }
    
    
    
    
    @IBAction func MostrarTeclado(sender: AnyObject) {
     //sender.becomeFirstResponder()
    }
    
    
    @IBAction func OcultaTeclado(sender: AnyObject) {
      //  sender.resignFirstResponder()
    }
    
    @IBAction func btnLimpiar(sender: AnyObject) {
        
        tfISBN.text = ""
        tvResultado.text = ""
    
    }
    
    
    
    @IBAction func btnBuscar(sender: AnyObject) {
        
        // cerrar teclado
        tfISBN.resignFirstResponder()
        
        if tfISBN.text != ""
        {
            sincrono()
        }
        else
        {
            muestraMensaje("Es necesario escribir el ISBN")
        }
        
    }
    
    func muestraMensaje(cadena : String)
    {
        let alertController = UIAlertController(title: "Aviso", message:
            cadena, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Continuar", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    // oculta el teclado cuando presiona enter
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }
    
    // oculta el teclado cuando presiona esoacio vacio
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        tfISBN.resignFirstResponder()
        
    }

}

