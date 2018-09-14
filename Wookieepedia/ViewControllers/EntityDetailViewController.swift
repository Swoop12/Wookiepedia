//
//  EntityDetailViewController.swift
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import UIKit

class EntityDetailViewController: UIViewController {
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @objc var person: Person?{
        didSet{
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    func updateViews(){
        guard let person = person else {return}
        
        personNameLabel.text = person.name
        massLabel.text = "Mass:  " + person.massString
        heightLabel.text = "Height:  " + person.heightString
        
        let personImage = UIImage(named: person.name.lowercased()) ?? #imageLiteral(resourceName: "darth maul")
        personImageView.image = personImage
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
