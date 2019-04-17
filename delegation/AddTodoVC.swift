//
//  AddTodoVC.swift
//  delegation
//
//  Created by argenis delarosa on 2/19/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit

protocol TodoDelegate {
    func addTodo(txt: String)
}

class AddTodoVC: UIViewController {
    
    var delegate: TodoDelegate?
    
    @IBOutlet weak var todoTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        view.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }

    @IBAction func addTodo(_ sender: Any) {
        if let todoTxt = todoTxtField.text, let myButler = delegate {
            delegate?.addTodo(txt: todoTxt)
            dismiss(animated: true, completion: nil)
        }
        hideKeyboard()
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
