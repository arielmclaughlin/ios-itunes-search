import UIKit

class PersonSearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        personController.searchForPeople(with: searchTerm) { (people, error) in
            self.people = people ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWars", for: indexPath) as! PersonTableViewCell
        
        let person = people[indexPath.row]
        cell.nameLabel.text = person.name
        cell.genderLabel.text = person.gender
        cell.birthYearLabel.text = person.birthYear
        
        return cell
    }
    
    //MARK: - Properties and Outlets
    
    let personController = PersonController()
    
    var people = [Person]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBOutlet weak var searchBar: UISearchBar!
}

