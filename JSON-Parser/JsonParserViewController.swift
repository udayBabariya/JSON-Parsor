//
//  JsonParserViewController.swift
//  JSON Parser
//
//  Created by uday on 8/17/17.
//  Copyright © 2017 uday. All rights reserved.
//

import UIKit

class JsonParserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let path  = Bundle.main.path(forResource: "usersAPI", ofType: "txt") else {return}
        let url = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            guard let array = json as? [Any] else {return}
            
            for user in array{
                
                guard let userDict = user as? [String:Any] else {return}
                guard let  userId = userDict["id"] as? Int else {return}
                guard let company = userDict["company"] as? [String:Any] else {return}
                guard let companyName = company["name"] as? String else {return}
                
                print(userId,companyName)
                
            }
            
            
            print(json )
        }
        catch{
            print(error)
        }
        
    }
}
