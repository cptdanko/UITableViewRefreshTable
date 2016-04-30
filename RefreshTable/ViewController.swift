//
//  ViewController.swift
//  RefreshTable
//
//  Created by bhuman on 28/04/2016.
//  Copyright © 2016 bhuman. All rights reserved.
//

import UIKit

extension UITableView {
    func refreshTable(){
        let indexPathForSection = NSIndexSet(index: 0)
        self.reloadSections(indexPathForSection, withRowAnimation: UITableViewRowAnimation.Middle)
    }
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var reloadBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var data = ["One", "two", "three"]
    var origData:[String]?
    let indexPathForSection = NSIndexSet(index: 0)
    var section = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @IBAction func reloadTable(sender: AnyObject) {
        data = ["four","five","six"]
        origData = data
        tableView.refreshTable()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

