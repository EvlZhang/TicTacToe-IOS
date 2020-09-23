//
//  NameViewController.swift
//  tic2
//
//  Created by Evelyn Zhang on 9/20/20.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var uName: UITextField!
    @IBAction func Play(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let controller = segue.destination as? ViewController{
            controller.playerName = uName.text
            
            
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
