//
//  MealsViewController.swift
//  EjercicioRepaso
//
//  Created by Sergio Morón on 25/01/2024.
//

import UIKit
import Alamofire
import AlamofireImage

class MealsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tablaComidas: UITableView!
    
    var categoria: String!
    var listaRecetas:[Meal]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
print("Categoreia \(categoria)")
        listaRecetas = []
        cargarRecetas()
    }
    
    func cargarRecetas(){
        ApiConexiones.api.getComidas(categoria: categoria){
            respuesta in
            
            self.listaRecetas = respuesta
            self.tablaComidas.reloadData()
        }failure: {
            error in
            print(error.debugDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaRecetas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CELDAMEALS") as! CeldaTableViewCell
        
        celda.imNombre.text = listaRecetas[indexPath.row].strMeal
        
        AF.request(listaRecetas[indexPath.row].strMealThumb).responseImage{
            imagen in
            
            if case.success(let img) = imagen.result{
                celda.imFoto.image = img
            }
        }
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RECETA" {
            let destino = segue.destination as! RecetaViewController
            let fila = tablaComidas.indexPathForSelectedRow?.row
            destino.id = listaRecetas[fila!].idMeal
        }
    }
}
