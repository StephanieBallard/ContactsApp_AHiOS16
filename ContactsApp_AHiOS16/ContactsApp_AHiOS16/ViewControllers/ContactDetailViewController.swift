//
//  ContactDetailViewController.swift
//  ContactsApp_AHiOS16
//
//  Created by Stephanie Ballard on 3/19/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    private func updateViews() {
        guard isViewLoaded else { return }
        guard let contact = contact else { return }
        nameLabel.text = contact.name
        phoneNumberLabel.text = contact.phoneNumber
    }
}
