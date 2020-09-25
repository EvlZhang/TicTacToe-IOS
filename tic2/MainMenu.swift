//
//  MainMenu.swift
//  tic2
//
//  Created by Evelyn Zhang on 9/24/20.
//

import UIKit

class MainMenu: UIViewController {

    
    @IBOutlet weak var p2: UIButton!
    @IBOutlet weak var p1: UIButton!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            if let controller=segue.destination as? NameViewController{
                //controller.hide()
            }
        
            
        
        
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
