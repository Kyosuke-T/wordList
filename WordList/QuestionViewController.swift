//
//  QuestionViewController.swift
//  WordList
//
//  Created by 共田 恭輔 on 2016/02/06.
//  Copyright © 2016年 共田 恭輔. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var nextButton : UIButton!
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var answerLabel : UILabel!
    
    var isAnswered: Bool = false
    var wordArray : [AnyObject] = []
    var shuffledWordArray : [AnyObject] = []
    var nowNumber : Int = 0
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        
    }
    
    override func viewWillAppear(animated: Bool) {
        wordArray = saveData.arrayForKey("WORD")!
        
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
    }
    
    func shuffle(){
        while wordArray.count > 0 {
            let index = Int(rand()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.removeAtIndex(index)
        }
    }
    
    @IBAction func nextbuttonPushed(){
        
        if isAnswered{
            nowNumber++
            answerLabel.text = ""
            
            if nowNumber < shuffledWordArray.count {
                questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
                isAnswered = false
                nextButton.setTitle("答えを表示", forState: UIControlState.Normal)
            }else{
                self.performSegueWithIdentifier("toFinishView", sender: nil)
            }
            }
        else{
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
            isAnswered = true
            nextButton.setTitle("次へ", forState: UIControlState.Normal)
        }
    }
}
