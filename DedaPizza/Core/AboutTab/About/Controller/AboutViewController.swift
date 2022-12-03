//
//  RecipeViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 28.10.2022.
//

import UIKit

class AboutViewController: UIViewController {
    
    let aboutView = AboutView()
    let aboutViewModel = AboutViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegates()
    }
    
    override func loadView() {
        view = aboutView
    }
    
    private func setDelegates() {
        aboutView.tableView.delegate = self
        aboutView.tableView.dataSource = self
    }
    
}

//MARK: Table DataSourse
extension AboutViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AboutItems.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AboutTableViewCell.identifier, for: indexPath) as? AboutTableViewCell
        
        let title = AboutItems.allCases[indexPath.row].settingName()
        if let image = AboutItems.allCases[indexPath.row].settingsIcon() {
            cell?.configure(with: title, image: image)
        }
        
        return cell ?? UITableViewCell()
    }
    
    
}

//MARK: Table Delegate
extension AboutViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let view = AboutItems.allCases[indexPath.row].selectedScreen()
        navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return CGFloat.leastNormalMagnitude
    }
}
