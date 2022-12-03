//
//  ViewController.swift
//  ProfilePageCombine
//
//  Created by Павел Кай on 14.11.2022.
//

import UIKit


final class ProfileViewController: UIViewController {
    
    //MARK: Properties
    private let profileView = ProfileView()
    private let profileViewModel = ProfileViewModel()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .systemBackground
        setDelegates()
    }
    
    override func loadView() {
        view = profileView
    }
    
    //MARK: Logic
    private func setDelegates() {
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
    }
    
}

//MARK: Table DataSourse
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingItems.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell
        
        let title = SettingItems.allCases[indexPath.row].settingName()
        if let image = SettingItems.allCases[indexPath.row].settingsIcon() {
            cell?.configure(with: title, image: image)
        }
        
        return cell ?? UITableViewCell()
    }
    
    
}

//MARK: Table Delegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath)
        if let view = SettingItems.allCases[indexPath.row].selectedScreen() {
            navigationController?.pushViewController(view, animated: true)
        } else {
            let vc = LoginViewController()
            navigationController?.setViewControllers([vc], animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return CGFloat.leastNormalMagnitude
    }
}
