//
//  secViewController.swift
//  weatherAppIos
//
//  Created by CH 002 on 11/10/22.
//
protocol secViewControllerDelegate {
    func weatherUpdate(outputData:[ String:Any]?)

}

import UIKit
import Alamofire

class secViewController: UIViewController {
    
    var delegate : secViewControllerDelegate?

    var respResult : [String:Any]?
    
    @IBOutlet weak var locationSearchTF: UITextField!
    
    var locationString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    func apicall(location:String){
        let url = "https://api.weatherapi.com/v1/current.json?key=996c40312f9b49bbb1a112859220610&q=\(location)&aqi=no"
        AF.request(url, method:.get, parameters:nil , encoding:JSONEncoding.default , headers:nil)
            .responseJSON { [self] response in
                print(response.response)
                switch response.result {
                case.success(let value):
                    if let responseData = value as? [String:Any]{
                        print(responseData)
                        self.respResult = responseData
                                if ((respResult?["error"] as? [String:Any]) != nil) {
                         let alert = UIAlertController(title: "Error!!!", message: "No matching Location Found.", preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
                                self.present(alert, animated: true, completion:nil)
                           }
                        else {
                         self.delegate?.weatherUpdate(outputData: self.respResult)
                     }
                        self.dismiss(animated: true)
                    }
                
                case.failure(let error):
                    print(error)
                }
            }
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        locationString = locationSearchTF.text!
        print( locationString)
        apicall(location: locationString)
       
        }
    }
    
