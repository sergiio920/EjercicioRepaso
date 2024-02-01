//
//  RecetaViewController.swift
//  EjercicioRepaso
//
//  Created by Sergio Morón on 26/01/2024.
//

import UIKit
import Alamofire
import AlamofireImage
import FirebaseAuth

class RecetaViewController: UIViewController {

    @IBOutlet var imFoto: UIImageView!
    @IBOutlet var lbNombre: UILabel!
    @IBOutlet var lbCategoria: UILabel!
    @IBOutlet var lbArea: UILabel!
    @IBOutlet var lbInstrucciones: UILabel!
    @IBOutlet var btnLogout: UIBarButtonItem!
    
    var id: String!
    var receta: Meal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnLogout.isEnabled = false
        if let user = Auth.auth().currentUser {
            self.btnLogout.isEnabled = true
        }

        cargarReceta()
    }
    
    func cargarReceta(){
        ApiConexiones.api.getReceta(id: id){
            respuesta in
            
            self.receta = respuesta
            
            self.lbNombre.text = self.receta.strMeal
            self.lbCategoria.text = self.receta.strCategory
            self.lbArea.text = self.receta.strArea
            self.lbInstrucciones.text = self.receta.strInstructions
            
            AF.request(self.receta.strMealThumb).responseImage{
                imagen in
                if case .success(let img) = imagen.result{
                    self.imFoto.image = img
                }
            }
        }failure: {
            error in
            print(error.debugDescription)
        }
    }
    
    @IBAction func btnGuardar(_ sender: Any) {
        if let user = Auth.auth().currentUser{
            //ESTÁ LOGEADO
            self.btnLogout.isEnabled = true
        }else{
            //NO ESTÁ LOGEADO
            self.btnLogout.isEnabled = false
            
            let ventana = self.storyboard?.instantiateViewController(identifier: "LOGIN") as! LoginViewController
            self.navigationController?.pushViewController(ventana, animated: true)
        }
    }
    
    @IBAction func btnLogoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.btnLogout.isEnabled = false
        if let user = Auth.auth().currentUser {
            self.btnLogout.isEnabled = true
        }
    }
    
}
