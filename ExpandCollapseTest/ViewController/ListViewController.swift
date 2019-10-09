//
//  ListViewController.swift
//  ExpandCollapseTest
//
//  Created by Krishna on 09/10/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - IBOutlets and Variables -
    @IBOutlet weak var tblCatagoryList: UITableView!
    var arrCategotyList = [CategoryList]()
    
    //MARK: - View lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        arrCategotyList = loadJson()!
        self.tblCatagoryList.reloadData()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - UITableView Delegates and DataSource -
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrCategotyList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrCategotyList[section].isExpand == true {
            return arrCategotyList[section].subCategoty.count
        }
        return 0
       // return arrCategotyList[section].subCategoty.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        cell.lblSubCategoryTitle.text = arrCategotyList[indexPath.section].subCategoty[indexPath.row].name?.capitalized
        cell.lblDisplayName.text = arrCategotyList[indexPath.section].subCategoty[indexPath.row].displayName
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        headerView.backgroundColor = UIColor.groupTableViewBackground
        let shadowView = UIView(frame: CGRect(x: 8, y: 0, width: headerView.frame.width - 30, height: headerView.frame.height - 10))
        shadowView.addShadow(cornerRadius: 6, opacity: 0.5, radius: 7, offset: (x: 0, y: 0), color: UIColor.lightGray)
        let label = UILabel(frame: CGRect(x: 8, y: 8, width: shadowView.frame.width, height: shadowView.frame.height))
        label.text = "  " + (arrCategotyList[section].categotyName?.uppercased() ?? "")
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = UIColor.white
        headerView.addSubview(shadowView)
        shadowView.addSubview(label)
        headerView.tag = section
        headerView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        headerView.addGestureRecognizer(tap)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    //MARK: - Fetch Data -
    func loadJson() -> [CategoryList]? {
        if let url = Bundle.main.url(forResource: "AllMenu", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([CategoryList].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    // function which is triggered when handleTap is called
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let section = sender.view?.tag else { return }
        arrCategotyList[section].isExpand = !(arrCategotyList[section].isExpand ?? false)
        self.tblCatagoryList.reloadSections(IndexSet(integer: section), with: .fade)
        print(section)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
