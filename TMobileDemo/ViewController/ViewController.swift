//
//  ViewController.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 12/06/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tblList: UITableView!
    
    @IBOutlet var txtSearch: UISearchBar!
    
    
    var userListViewModel: UserListViewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = AppConstant.appName
        setupListner()
        login()
        txtSearch.isHidden = true
        tblList.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func login() {
        userListViewModel.login {[weak self] (isSuccess, errorMsg) in
            self?.txtSearch.isHidden = false
            self?.tblList.isHidden = false
            if isSuccess {
                self?.userListViewModel.getUserList()
            } else {
                print(errorMsg)
            }
        }
    }
    
    func setupListner() {
        
        self.userListViewModel.filtredList.bindAndFire { (list) in
            print(list.count)
            self.tblList.reloadData()
        }
        
        self.userListViewModel.errorMsg.bind {[weak self] (errorMsg) in
            print(errorMsg)
            self?.showAlert(title: "Error", message: errorMsg, actionTitles: ["Ok"], actions:  [{ action in
                self?.dismiss(animated: true, completion: nil)
                }])
        }
    }
}
//MARK:- TableView Delegate and Datasource Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListViewModel.filtredList.value.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellUserList") as? UserListTableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "cellUserList")
        }
        cell.user = userListViewModel.filtredList.value[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigateToDetail(userListViewModel.filtredList.value[indexPath.row])
        
    }
    
    func navigateToDetail(_ user: User) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.detailViewModel = DetailViewModel()
        detailVC.user = user
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
//MARK:- Search Bar Delegate
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.userListViewModel.searchUser(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.userListViewModel.searchUser(searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        self.userListViewModel.searchUser(searchBar.text ?? "")
    }
    
}

extension UIViewController {
    func showAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
