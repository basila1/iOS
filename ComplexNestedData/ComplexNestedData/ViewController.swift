//
//  ViewController.swift
//  ComplexNestedData
//
//  Created by Basila Nathan on 4/17/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var batters = [Batter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.shared.getData { (data) in
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else { return }
                //initialize the object
                //debugPrint(json)
                let itemResponse = ItemResponse(json: json)
                //debugPrint(itemResponse)
                guard let batters = itemResponse?.items.first?.batters.batters else { return }
                self.batters = batters
                print(batters)
            } catch {
                debugPrint(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return batters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = batters[indexPath.row].type
        cell.detailTextLabel?.text = batters[indexPath.row].id
        return cell
    }
}

