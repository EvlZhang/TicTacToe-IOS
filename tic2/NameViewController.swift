//
//  NameViewController.swift
//  tic2
//
//  Created by Evelyn Zhang on 9/20/20.
//

import UIKit

class NameViewController: UIViewController {
    var isTwo=false;
    @IBOutlet weak var uName: UITextField!
    
    @IBOutlet weak var p2Labe: UILabel!
    @IBOutlet weak var u2Name: UITextField!
    @IBAction func Play(_ sender: Any) {
    }
    @IBAction func p2Click(_ sender: UIButton) {
 
        
        print(2)
    }
    @IBAction func p1Click(_ sender: Any) {

        print(1)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let controller = segue.destination as? ViewController{
            controller.playerName = uName.text
            controller.player2Name=u2Name.text
            controller.isTwo=true
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
