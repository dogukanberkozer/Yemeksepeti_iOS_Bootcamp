//
//  ViewController.swift
//  Week_3
//
//  Created by Dogukan Berk Ozer on 10.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        let userList = try? JSONDecoder().decode([User].self, from: Data(contentsOf: url))
        
        guard let users = userList else { return }
        self.users = users
        
        TableView.dataSource = self
    }

}

// nw_protocol_get_quic_image_block_invoke dlopen libquic failed


// extension for TableView
extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredUsers.count
        }
        return users.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
        let customCell = tableView.dequeueReusableCell(withIdentifier: "customCell")
        
        let user: User
        
        if isFiltering {
            user = filteredUsers[indexPath.row]
        }else {
            user = users[indexPath.row]
        }
        
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = users[indexPath.row].compony.name
        
        customCell?.textLabel?.text = "ERROR ⛔️"
        customCell?.detailTextLabel?.text = "No users were found matching your search criteria."
        
        if (isFiltering && filteredUsers.count == 0) {
            return customCell!
        }
        
        return cell!
    }
}

// extension for SearchBar
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredUsers = users.filter({ (user: User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
            
        })
        
        isFiltering = true
        TableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        TableView.reloadData()
    }
}

/*
 MARK: FRAME vs BOUNDS
    The bounds of an UIView is the rectangle, expressed as a location and size relative to its own coordinate system. The frame of an UIView is the rectangle, expressed as a location and size too but relative to the superview it is contained within.
 */

