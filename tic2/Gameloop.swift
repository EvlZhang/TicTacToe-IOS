//
//  Gameloop.swift
//  TicTacToe
//
//  Created by Evelyn Zhang on 9/18/20.
//  Copyright © 2020 Evelyn Zhang. All rights reserved.
//

import Foundation
class main{
    
}
class move{
    
    var isMaximizing:Bool = false
    
    var board=[[Int]]()
    //var xmove:Int
    //var ymove:Int
    var player:Int
    var ai:Int
    var turn:Int
    var pScore=0
    var cScore=0
    var winner=0
    init(){
      //  xmove=5
      //  ymove=0
        player=1
        ai=2
        turn=player
        self.setUpBoard()
    }
    func isAvail(num:Int)->Bool{
        if(num==1){
            if(board[0][0]==0){
                return true
            }
            
        }
        else if(num==2){
            if(board[0][1]==0){
                return true
            }
        }
        else if(num==3){
            if(board[0][2]==0){
                return true
            }
        }
        else if(num==4){
            if(board[1][0]==0){
                return true
            }
        }
        else if(num==5){
            if(board[1][1]==0){
                return true
            }
        }
        else if(num==6){
            if(board[1][2]==0){
                return true;
            }
        }
        else if(num==7){
            if(board[2][0]==0){
                return true
            }
        }
        else if(num==8){
            if(board[2][1]==0){
                return true
            }
        }
        else if(num==9){
            if(board[2][2]==0){
                return true
            }
        }
        return false;
    }
    func pChoice(num:Int,turn:Int){
        if(num==1){
            if(board[0][0]==0){
                board[0][0]=turn
            }
            
        }
        else if(num==2){
            if(board[0][1]==0){
                board[0][1]=turn
            }
        }
        else if(num==3){
            if(board[0][2]==0){
                board[0][2]=turn
            }
        }
        else if(num==4){
            if(board[1][0]==0){
                board[1][0]=turn
            }
        }
        else if(num==5){
            if(board[1][1]==0){
                board[1][1]=turn
            }
        }
        else if(num==6){
            if(board[1][2]==0){
                board[1][2]=turn
            }
        }
        else if(num==7){
            if(board[2][0]==0){
                board[2][0]=turn
            }
        }
        else if(num==8){
            if(board[2][1]==0){
                board[2][1]=turn
            }
        }
        else if(num==9){
            if(board[2][2]==0){
                board[2][2]=turn
            }
        }
        //turn=ai
        isMaximizing=true
        //print(board)
        
        
    }
    func reset(){
        board=[[Int]]()
        for i in 0...2{
            board.append([0,0,0])
            winner=0
        }
    }
    func setUpBoard(){
        for i in 0...2{
            board.append([0,0,0])
    }
}
    func bestMove() -> Int {
        var win:Int=checkWin(board:board)
        var xmove=0
        var ymove=0
        if(win == 0){
                
            var score=0.0
            var bestScore:Double  = -Double.infinity
                for i in 0...2{
                    for j in 0...2{
                        if (board[i][j]==0){
                            
                            board[i][j]=2
                            
                            score = minimax(board:board,depth:0,maxi:false)
                            print(score)
                            board[i][j]=0
                            
                            
                            if (score >= bestScore){
                                print("b")
                                bestScore=score
                                xmove=i
                                ymove=j
                            }
                            
                            
                        }
                    }
                }
                
            
        }
        else{
            print("end")
            return 0;
        }
      //  print(xmove,ymove)
        board[xmove][ymove]=2
      //  print(board)
        
        var ret=0
        ret=xmove*3+ymove+1
        
        return ret
    }

    
    func minimax(board:[[Int]],depth:Int,maxi:Bool) -> Double{
        
        
        var n=0.0
        var copyBoard=board
        var bestScore=0.0
        var score=0.0
        var best2=0.0
        var score2=0.0
        let res=checkWin(board:copyBoard)
        
        
        if(res==1){
            n = -10.0
           // print("pwin")
            return n
        }
        else if(res==2){
            n = 10.0
            //print("cwin")
            return n
        }
        else if(res==3){
            n=0.0
            return n
        }
        else{
            if (maxi==true){
                bestScore = -Double.infinity
                
                for i in 0...2{
                    for j in 0...2{
                        if (copyBoard[i][j]==0){
                            
                            copyBoard[i][j]=2
                            score = minimax(board:copyBoard,depth:depth+1,maxi:false)
                            copyBoard[i][j]=0
                            bestScore=max(bestScore,score)
                        }
                    }
                }
                print("best",bestScore)
                return bestScore
            }
            else{
                best2=Double.infinity
                for i in 0...2{
                    for j in 0...2{
                        if(copyBoard[i][j]==0){
                           
                            copyBoard[i][j]=1
                            score2 = minimax(board: copyBoard, depth: depth+1, maxi: true)
                            copyBoard[i][j]=0
                            best2=min(best2,score2)
                        }
                    }
                }
               // print("best" ,best2)
                return best2
            }
        
        }
        
    }
    
    func checkWin(board:[[Int]])->Int{
        var full=true
        for i in 1...2{
            for j in 0...2{
                //vertical
                
                if(board[0][j]==i&&board[1][j]==i&&board[2][j]==i){
                    if i==1{
                        pScore+=1
                        winner=1
                    }
                    else{
                        cScore+=1
                        winner=2
                    }
                    return i;
                }
                else if(board[j][0]==i&&board[j][1]==i&&board[j][2]==i){
                    if i==1{
                        pScore+=1
                        winner=1
                    }
                    else{
                        winner=2
                        cScore+=1
                    }
                    return i;
                }
                else if(board[0][0]==i&&board[1][1]==i&&board[2][2]==i){
                    if i==1{
                        winner=1
                        pScore+=1
                    }
                    else{
                        winner=2
                        cScore+=1
                    }
                    return i;
                }
                else if(board[1][1]==1&&board[0][2]==i&&board[2][0]==i){
                    if i==1{
                        winner=1
                        pScore+=1
                    }
                    else{
                        winner=2
                        cScore+=1
                    }
                    return i;
                }
                
            }
        }
        for i in 0...2{
            for j in 0...2{
                if(board[i][j]==0){
                    full=false
                }
            }
        }
        if(full==true){
            return 3
        }
        
        return 0;
    }
    
    
}


