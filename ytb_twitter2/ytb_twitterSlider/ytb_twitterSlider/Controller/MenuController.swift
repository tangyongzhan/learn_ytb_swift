
import UIKit

struct MenuItem {
    var title: String
    var icon: UIImage
}

class MenuController: UITableViewController {
    let cellId = "cellId"
    
    fileprivate var menuItems: [MenuItem] = [
        MenuItem(title: "MyCar", icon: UIImage(named: "AutoCar")!),
        MenuItem(title: "List", icon: UIImage(named: "Global")!),
        MenuItem(title: "Profile", icon: UIImage(named: "Function")!),
        MenuItem(title: "Video", icon: UIImage(named: "Video")!),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MenuItemCell
        let menuItem = menuItems[indexPath.row]
        cell.titleLable.text = menuItem.title
        cell.iconImageView.image = menuItem.icon
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customMenuHeaderview = CustomMenuHeaderView()
        return customMenuHeaderview
    }

}

extension MenuController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseslidingController = UIApplication.shared.keyWindow?.rootViewController as! BaseslidingController
        baseslidingController.didSelectMenuItem(indexPath: indexPath)
    }
}



