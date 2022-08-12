//
//  detailsContrroller.swift
//  superKahramanKitabi
//
//  Created by Recep Akkoyun on 29.07.2022.
//

import UIKit

class detailsContrroller: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var labell: UILabel!
    
    var girilenKahramanIsmi = ""
    var girilenKahramanResmiIsmi = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labell.text = girilenKahramanIsmi
        imageview.image = UIImage(named: girilenKahramanResmiIsmi)
        
        
    }

}
