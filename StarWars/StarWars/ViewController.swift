//
//  ViewController.swift
//  StarWars
//
//  Created by Basila Nathan on 4/13/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    //need reference to all the people in the viewController
    var people = [Person]()
    
    @IBAction func getButtonTapped() {
        print("get")
        NetwrokingService.shared.getPeople { response in
            print(response) //response that's being passed in is the GetPeopleResponse
            self.people = response.people
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "PeopleToDetails",
            let detailsVC = segue.destination as? DetailsVC,
            let person = sender as AnyObject as? Person
            else { return }
        detailsVC.person = person
    }

}

extension ViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    } // Default is 1 if not implemented
    
}

//add delegate that will allow us to click on the cell
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PeopleToDetails", sender: people[indexPath.row])
    }
    
}

