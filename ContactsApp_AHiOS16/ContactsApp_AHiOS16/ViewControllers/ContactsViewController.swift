//
//  ContactsViewController.swift
//  ContactsApp_AHiOS16
//
//  Created by Stephanie Ballard on 3/19/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        // Do any additional setup after loading the view.
    }
    
    private func configureViews() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddContactSegue":
            guard let addContactVC = segue.destination as? AddContactViewController else { return }
            addContactVC.delegate = self
        case "ContactsDetailSegue":
            guard let contactsDetailVC = segue.destination as? ContactDetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            contactsDetailVC.contact = contacts[indexPath.row]
        default:
            return
        }
    }
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        return cell
    }
}

extension ContactsViewController: ContactDelegate {
    func addContact(_ contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}
