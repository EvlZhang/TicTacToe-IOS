//
//  P2.swift
//  tic2
//
//  Created by Evelyn Zhang on 9/24/20.
//

import UIKit

class P2: UIViewController {

    @IBOutlet weak var uName: UITextField!
    let tap=UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing(_:)))
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let controller = segue.destination as? ViewController{
            controller.playerName = uName.text
            
            controller.isTwo=false
            }
            
        
        }
    
    func textFieldShouldReturn(_ textField:UITextField)-> Bool{
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return true;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(tap)
        
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
