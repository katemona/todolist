//
//  TableViewController.swift
//  todo
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 KWK. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var toDos :  [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createToDos()
        
    }
    
    func createToDos() -> [ToDo] {
      
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        
        return [swift, dog]
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]

        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        }
        else {
            cell.textLabel?.text = toDo.name
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as?
            AddToDoTableViewController {
            addVC.previousVC = self
        }
    }

}


