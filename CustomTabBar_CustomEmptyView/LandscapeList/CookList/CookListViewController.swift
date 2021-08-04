//
//  CookListViewController.swift
//  CookList
//
//  Created by Dogukan Berk Ozer on 3.08.2021.
//

import UIKit
import CoreData

class CookListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cookNames = [String]()
    
    //MARK: Resmi cell de gösteriniz
    //Silme işlemi yapınız. Direk silmeden ziyade kullanıcıya uyarı gösterip silmek istediğinizden emin misiniz uyarısı ile işlemi yapınız.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCooks()
    }
    
    private func getCooks() {
        cookNames.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cook")
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    guard let name = result.value(forKey: "name") as? String else { return }
                    cookNames.append(name)
                }
                self.tableView.reloadData()
            } else {
                //TODO:
            }
        } catch {
            print("Error")
        }
        
    }

}



extension CookListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cookNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath)
        
        cell.textLabel?.text = cookNames[indexPath.row]
        
        return cell
    }
    
    
}
