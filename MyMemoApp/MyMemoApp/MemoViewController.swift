//
//  MemoViewController.swift
//  MyMemoApp
//
//  Created by 山本 沙季 on 2020/04/24.
//  Copyright © 2020 山本 沙季. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {

    var memo: String?
    
    @IBOutlet weak var MemoTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // self.saveButton.isEnabled = false
        if let memo = self.memo{
            self.MemoTextField.text = memo
            self.navigationItem.title = "Edit Memo"
        }
        self.updateSaveButtonState()
    }
    
    private func updateSaveButtonState(){
        let memo = self.MemoTextField.text ?? ""
        self.saveButton.isEnabled = !memo.isEmpty
    }
    
    @IBAction func MemoTextFieldChanged(_ sender: Any) {
        self.updateSaveButtonState()
    }
    @IBAction func cancel(_ sender: Any) {
        if self.presentingViewController is UINavigationController{
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
            
        }
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            return
        }
        self.memo = self.MemoTextField.text ?? ""
        
    }
    

}
