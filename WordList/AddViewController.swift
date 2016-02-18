//
//  AddViewController.swift
//  WordList
//
//  Created by 共田 恭輔 on 2016/02/06.
//  Copyright © 2016年 共田 恭輔. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet var englishTextField : UITextField!
    @IBOutlet var japaneseTextField : UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
    }
    
    @IBAction func saveWord() {
        let wordDictionary =
        ["english":englishTextField.text, "japanese":japaneseTextField.text]
        
        wordArray.append(wordDictionary)
        
        saveData.setObject(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
        
        self.presentViewController(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
    }
}
