//
//  LoginViewController.swift
//  EjercicioRepaso
//
//  Created by Sergio Morón on 26/01/2024.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text{
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in
                
                if let res = result, error == nil{
                    self.navigationController?.popViewController(animated: true)
                }else{
                    let alert = UIAlertController(title: "ERROR", message: "Error en el login \(error.debugDescription)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ACEPTAR", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func btnRegistro(_ sender: Any) {
        
    }
    
}
