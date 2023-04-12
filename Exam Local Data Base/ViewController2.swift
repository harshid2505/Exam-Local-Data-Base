//
//  ViewController2.swift
//  Exam Local Data Base
//
//  Created by HARSHID PATEL on 12/04/23.
//

import UIKit

class ViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tb: UITableView!
    
    var arr2 = SqliteHelper.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
       cell.idLable.text = arr2[indexPath.row].id.description
        cell.nameLable.text = arr2[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
