//
//  ViewController.swift
//  Dynamic View With Stack View and XIB
//
//  Created by Umesh Chauhan on 18/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var stackContainer: UIStackView!
    
    let str = "Mon : Closed\nTue : 24 hrs open\nWed : 24 hrs open\nThu :  01:49 PM  to  06:49 PM\nFri : Closed\nSat :  01:49 PM  to  06:49 PM\nSun : Closed"
    var data = [String]()
    
    var stack : UIStackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
         data = str.components(separatedBy: "\n")
        
        
        //increase this number , i want to scroll if increase than height of current device
        for i in 0...6{
            setupView(i: i)
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setupView(i : Int){
        let views = Bundle.main.loadNibNamed("dynamicView", owner: nil, options: nil)
        let calloutView = views?[0] as! dynamicSupport
        let splittedStringsArray = data[i].characters.split(separator: ":", maxSplits: 1, omittingEmptySubsequences: false).map(String.init)
        print(splittedStringsArray)
        calloutView.lblDay.text = splittedStringsArray[0]
        calloutView.lblTime.text = splittedStringsArray[1]
        calloutView.lblDay.sizeToFit()
        calloutView.lblTime.sizeToFit()
        calloutView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        //calloutView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true


        stackContainer.addArrangedSubview(calloutView)
      
        stackContainer.layoutIfNeeded()
        
    }


}

