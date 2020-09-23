//
//  ViewController.swift
//  tic2
//
//  Created by Evelyn Zhang on 9/20/20.
//
//
//  ViewController.swift
//  TicTacToe
//
//  Created by Evelyn Zhang on 9/18/20.
//  Copyright © 2020 Evelyn Zhang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var b1=UIImageView()
    var b2=UIImageView()
    var b3=UIImageView()
    var b4=UIImageView()
    var b5=UIImageView()
    var b6=UIImageView()
    var b7=UIImageView()
    var b8=UIImageView()
    var b9=UIImageView()
       
    var col1=UIStackView()
    var col2=UIStackView()
    var col3=UIStackView()
    var big=UIStackView()
    var pturn=true
    var game:move=move()
    var list=[UIImageView]()
    var currMove=0
    var pScore=0
    var cScore=0
    
    @IBOutlet weak var ob1: UIImageView!
    @IBOutlet weak var ob2: UIImageView!
    @IBOutlet weak var ob3: UIImageView!
    
    @IBOutlet weak var ob4: UIImageView!
    @IBOutlet weak var ob5: UIImageView!
    @IBOutlet weak var ob6: UIImageView!
    
    
    @IBOutlet weak var ob7: UIImageView!
    @IBOutlet weak var ob8: UIImageView!
    @IBOutlet weak var ob9: UIImageView!
    
    @IBOutlet weak var ocol1: UIStackView!
    @IBOutlet weak var ocol2: UIStackView!
    @IBOutlet weak var ocol3: UIStackView!
    @IBOutlet weak var playerScore: UILabel!
    
    @IBOutlet weak var pLabel: UILabel!
    @IBOutlet weak var aiScore: UILabel!
    var playerName:String!
    //@IBOutlet weak var pName: UILabel!
    //@IBOutlet weak var pScore: UILabel!
    
    //@IBOutlet weak var cScore: UILabel!
    @IBAction func reset(_ sender: Any) {
//        if(game.winner==1){
//            pScore+=1
//        }
//        else if(game.winner == 2){
//            cScore+=1
//        }
        game.reset()
        //cScore and pScore are backwards because of wrong story board layout
        playerScore.text="\(cScore)"
        aiScore.text="\(pScore)"
        
        ob1.image=UIImage(named: "Black_square")
        
        ob2.image=UIImage(named: "Black_square")

        ob3.image=UIImage(named: "Black_square")

        ob4.image=UIImage(named: "Black_square")
        
        ob5.image=UIImage(named: "Black_square")
        
        ob6.image=UIImage(named: "Black_square")
        
        ob7.image=UIImage(named: "Black_square")
        
        ob8.image=UIImage(named: "Black_square")
        
        ob9.image=UIImage(named: "Black_square")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pLabel.text = playerName
        ob1.image=UIImage(named: "Black_square")
        

        
         b2=UIImageView()
        
        ob2.image=UIImage(named: "Black_square")
        
        
        
         b3=UIImageView()
        
        ob3.image=UIImage(named: "Black_square")
         b4=UIImageView()
        
        ob4.image=UIImage(named: "Black_square")
         b5=UIImageView()
        
        ob5.image=UIImage(named: "Black_square")
         b6=UIImageView()
        
        ob6.image=UIImage(named: "Black_square")
         b7=UIImageView()
        
        ob7.image=UIImage(named: "Black_square")
         b8=UIImageView()
        
        ob8.image=UIImage(named: "Black_square")
         b9=UIImageView()
        
        ob9.image=UIImage(named: "Black_square")
           
         col1=UIStackView()
         col2=UIStackView()
         col3=UIStackView()
        
        createTap(on: ob1, type: .one)
        createTap(on: ob2, type: .two)
        createTap(on: ob3, type: .three)
        createTap(on: ob4, type: .four)
        createTap(on: ob5, type: .five)
        createTap(on: ob6, type: .six)
        createTap(on: ob7, type: .seven)
        createTap(on: ob8, type: .eight)
        createTap(on: ob9, type: .nine)
    
        list.append(ob1)
        list.append(ob2)
        list.append(ob3)
        list.append(ob4)
        list.append(ob5)
        list.append(ob6)
        list.append(ob7)
        list.append(ob8)
        list.append(ob9)
        
        //setImageConstraints()
        
       
        
        //setup()
        
        //setStackViewConstraints()
        
        // Do any additional setup after loading the view.
        
        
        
        
        
    }
    
    func setImageConstraints(){
        for b in list {
            let wc=NSLayoutConstraint(item: b, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 5)
            
            let hc=NSLayoutConstraint(item: b, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 5)
            
            b.addConstraints([wc, hc])
        }
    }
    func setStackViewConstraints(){
        col1.translatesAutoresizingMaskIntoConstraints = false
        col1.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant:200).isActive=true;
        col1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant:5).isActive=true
        col1.trailingAnchor.constraint(equalTo: col2.safeAreaLayoutGuide.leadingAnchor,constant: -5).isActive=true
        
        
        col2.translatesAutoresizingMaskIntoConstraints = false
        col2.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant:200).isActive=true;
        col2.leadingAnchor.constraint(equalTo: col1.trailingAnchor,constant:5).isActive=true
        col2.trailingAnchor.constraint(equalTo: col3.leadingAnchor,constant: -5).isActive=true

        col3.translatesAutoresizingMaskIntoConstraints = false
        col3.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant:200).isActive=true;
        col3.leadingAnchor.constraint(equalTo: col2.trailingAnchor,constant:5).isActive=true

        col3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -5).isActive=true
        
        
        
    }
    func setup() {
        col1.axis = .vertical
        
        col1.alignment = .fill
        
        col1.distribution = .fillProportionally
        
        col1.addArrangedSubview(b1)
        col1.addArrangedSubview(b2)
        col1.addArrangedSubview(b3)
        
        col2.axis = .vertical
        
        col2.alignment = .fill
        
        col2.distribution = .fillProportionally
        
        col2.addArrangedSubview(b4)
        col2.addArrangedSubview(b5)
        col2.addArrangedSubview(b6)
        
        col3.axis = .vertical
        
        col3.alignment = .fill
        
        col3.distribution = .fillProportionally
        
        col3.addArrangedSubview(b7)
        col3.addArrangedSubview(b8)
        col3.addArrangedSubview(b9)
        
        view.addSubview(col1)
        view.addSubview(col2)
        view.addSubview(col3)
        
       
        
        
    }
    
    func createTap(on imageView: UIImageView,type box:Box){
        let tap=UITapGestureRecognizer(target: self, action: #selector(imageTapped(tap:)))
        
        
        
        imageView.isUserInteractionEnabled=true
        imageView.addGestureRecognizer(tap)
        imageView.tag=box.rawValue
        
        
    }
    func moveC(move:Int){
        for b in list{
            if(b.tag==move){
                b.image=UIImage(named: "o")
            }
        }
    }
    @objc func imageTapped(tap:UITapGestureRecognizer){
        
        var tappedImage=tap.view as! UIImageView
        if(game.isAvail(num:tappedImage.tag)==true){
            tappedImage.image=UIImage(named:"x")
            //print(tappedImage.tag)
            game.pChoice(num: tappedImage.tag)
            
            currMove=game.bestMove()
           // print(currMove)
            moveC(move:currMove)

        }
        
        
    }
    enum Box: Int{
        case one = 1, two = 2, three = 3, four = 4, five = 5, six=6, seven=7, eight=8, nine=9
    }
   
    
    


}
