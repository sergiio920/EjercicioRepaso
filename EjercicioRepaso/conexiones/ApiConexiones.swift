//
//  ApiConexiones.swift
//  EjercicioRepaso
//
//  Created by Sergio Morón on 25/01/2024.
//

import Foundation
import Alamofire

final class ApiConexiones{
    static let api = ApiConexiones()
    
    let BASE_URL = "https://www.themealdb.com"
    
    func getCategorias(succes: @escaping(_ resouesta: [Category])->(),
                       failure: @escaping(_ error: Error?)->()){
        let url = "\(BASE_URL)/api/json/v1/1/categories.php"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: Categories.self){
            respuesta in
            
            if let res = respuesta.value{
                succes(res.categories)
            }else{
                failure(respuesta.error)
            }
        }
    }
    
    func getComidas(categoria: String, succes: @escaping(_ resouesta: [Meal])->(),
                    failure: @escaping(_ error: Error?)->()){
        let url = "\(BASE_URL)/api/json/v1/1/filter.php"
        let parameters: Parameters = ["c" : categoria]
        
        AF.request(url, method: .get, parameters: parameters).validate(statusCode: 200...299).responseDecodable(of: Meals.self){
            respuesta in
            
            if let res = respuesta.value{
                succes(res.meals)
            }else{
                failure(respuesta.error)
            }
        }
    }
    
    func getReceta(id: String, succes: @escaping(_ resouesta: Meal)->(),
                    failure: @escaping(_ error: Error?)->()){
        let url = "\(BASE_URL)/api/json/v1/1/lookup.php"
        let parameters: Parameters = ["i" : id]
        
        AF.request(url, method: .get, parameters: parameters).validate(statusCode: 200...299).responseDecodable(of: Meals.self){
            respuesta in
            
            if let res = respuesta.value{
                succes(res.meals[0])
            }else{
                failure(respuesta.error)
            }
        }
    }
}
