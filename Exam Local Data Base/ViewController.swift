//
//  ViewController.swift
//  Exam Local Data Base
//
//  Created by HARSHID PATEL on 12/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SqliteHelper.createFile()
    }

    @IBAction func addDataButtonAction(_ sender: UIButton) {
        if let x = idTextField.text,let y = Int(x){
            SqliteHelper.addData(id: y, name: nameTextField.text ?? "")
        }
    }
    
    @IBAction func deleteDataButtonAction(_ sender: Any) {
        if let x = idTextField.text,let y = Int(x){
            SqliteHelper.deleteData(id: y, name: nameTextField.text ?? "")
        }
    }
    
    @IBAction func getDataButtonAction(_ sender: Any) {
        var navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigate, animated: true)
        
    }
    
}

