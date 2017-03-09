//
//  ViewController.swift
//  AgingPeople
//
//  Created by Basila Nathan on 3/9/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let names = ["Basila", "Tanjeev", "Saloni", "Manish", "Karanvir", "Omer", "Neal", "Patrick", "Deepak", "Poonam", "KJ", "Ghupshup"]
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    } //this function is assigning the things you want
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        let randomNumber = arc4random_uniform(95 - 5) + 4
        cell.detailTextLabel?.text = String(randomNumber)
        return cell
    } //this function is for assigning things for each cell
}
