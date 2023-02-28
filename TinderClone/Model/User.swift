//
//  User.swift
//  TinderClone
//
//  Created by Михаил on 26.02.2023.
//

import Foundation
import UIKit


struct User: ProducesCardViewModel{
    
    let name: String
    let age: Int
    let profession: String
    let imageNames: [String]
    
    init(dictionary: [String: Any]){
        let name = dictionary["fullName"] as? String ?? ""
        self.age = 0
        self.profession = "Jobless"
        self.name = name
        let imageUrl1 = dictionary["imageUrl1"] as? String ?? ""
        self.imageNames = [imageUrl1]
    }
    
    func toCardViewModel() -> CardViewModel{
        let attribetedText = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attribetedText.append(NSAttributedString(string: " \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        attribetedText.append(NSAttributedString(string: "\n\(profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        
        return CardViewModel(imageNames: imageNames, attributedString: attribetedText, textAligment: .left)
    }
    
    
}
