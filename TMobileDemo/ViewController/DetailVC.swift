//
//  DetailVC.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 07/12/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import UIKit
import KVNProgress

class DetailVC: UIViewController {
    //MARK:- Outlets
    @IBOutlet var imgUser: UIImageView!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblLocation: UILabel!
    @IBOutlet var lblJoinDate: UILabel!
    @IBOutlet var lblFollower: UILabel!
    @IBOutlet var lblFollowing: UILabel!
    @IBOutlet var lblBio: UILabel!
    @IBOutlet var txtSearch: UISearchBar!
    @IBOutlet var tblList: UITableView!
    
    //MARK:- Variables
    var detailViewModel: DetailViewModel!
    var user: User!
    let fetchDataGroup = DispatchGroup()
    var dataFetched: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = AppConstant.appName
        setupListner()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func setupListner() {
        detailViewModel.filtredList.bind {[weak self] (list) in
            if !(self?.dataFetched ?? true) {
                self?.fetchDataGroup.leave()
            }
            self?.tblList.reloadData()
        }
        
        detailViewModel.userDetail.bind {[weak self] (detail) in
            self?.setUserDetail(detail)
            if !(self?.dataFetched ?? true) {
                self?.fetchDataGroup.leave()
            }        }
        
        detailViewModel.errorMsg.bind {[weak self] (errorMsg) in
            print(errorMsg)
            if !(self?.dataFetched ?? true) {
                self?.fetchDataGroup.leave()
            }
            self?.showAlert(title: "Error", message: errorMsg, actionTitles: ["Ok"], actions: [{ action in
                self?.dismiss(animated: true, completion: nil)
            }])
        }
    }
    
    func fetchData() {
        KVNProgress.show()
        fetchDataGroup.enter()
        self.detailViewModel.getUserDetail(user.login ?? "")
        fetchDataGroup.enter()
        self.detailViewModel.getRepoList(user.login ?? "")
        fetchDataGroup.notify(queue: DispatchQueue.main) {
            KVNProgress.dismiss()
            self.dataFetched = true
        }
        
    }
    
    func setUserDetail(_ detail: UserDetail) {
        lblUserName.text = "UserName: \(detail.name ?? "")"
        lblEmail.text = "Email: \(detail.email ?? "N/A")"
        lblLocation.text = "Location: \(detail.location ?? "N/A")"
        lblJoinDate.text = "DOJ: \(detail.createdAt?.getJoinDate() ?? "N/A")"
        lblFollower.text = "\(detail.followers ?? 0) followers"
        lblFollowing.text = "Following \(detail.following ?? 0)"
        lblBio.text = "\(detail.bio ?? "")"
        if let url = URL(string: detail.avatarUrl ?? "") {
            imgUser.kf.setImage(with: url)
        }
    }

}
//MARK:- TableView Delegate and Datasource Methods
extension DetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailViewModel.filtredList.value.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetail") as? DetailTableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "cellDetail")
        }
        cell.repo = detailViewModel.filtredList.value[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let url = URL(string: "\(detailViewModel.filtredList.value[indexPath.row].htmlUrl ?? "")") {
            UIApplication.shared.open(url)
        }
    }
}
//MARK:- Search Bar Delegate
extension DetailVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.detailViewModel.searchUser(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.detailViewModel.searchUser(searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        self.detailViewModel.searchUser(searchBar.text ?? "")
    }
    
}

extension String {
    func getJoinDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" //2007-10-20T05:24:19Z
        guard let date = dateFormatter.date(from: self) else {
            return "N/A"
        }
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
