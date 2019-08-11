//
//  ContactsViewController.swift
//  TestDemo
//
//  Created by Fahad Attique on 10/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    // MARK: - Class Properties
    
    private let contactDetailsSegueIdentifier = "contactDetails"
    private let contactLoader = ContactLoader()
    private let refresher = UIRefreshControl()
    private var contacts: [Contact]!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureView()
        getContacts()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == contactDetailsSegueIdentifier {
            if let destinationViewController = segue.destination as? ContactDetailsViewController {
                destinationViewController.contact = sender as? Contact
                destinationViewController.delegate = self
            }
        }
    }

    // MARK: - Functions

    private func configureView() {
        
        contactsTableView.registerNib(from: ContactTableViewCell.self)
        contactsTableView.registerNib(from: ListingShimmerCell.self)
        contactsTableView.estimatedRowHeight = 65
        contactsTableView.rowHeight = UITableView.automaticDimension
        contactsTableView.addRefreshControl(refresher, withSelector: #selector(ContactsViewController.getContacts))
    }
    
    @objc private func getContacts() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double.random(in: 2...3)) {
            self.contactLoader.loadContacts(success: {  [weak self] (contacts) in
                guard let weakSelf = self else { return }
                weakSelf.refresher.endRefreshing()
                weakSelf.contacts = contacts
                weakSelf.contactsTableView.reloadData()
            }) {  [weak self] (error) in
                guard let weakSelf = self else { return }
                weakSelf.refresher.endRefreshing()
                UIAlertController.showAlert(error, onController: weakSelf)
            }
        }
    }

    // MARK: - IBActions
    
    @IBAction func addContact(_ sender: Any) {
    }
    
    @IBAction func searchContact(_ sender: Any) {
    }
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let contacts = self.contacts else { return 5 }
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let contacts = self.contacts else {
            return tableView.dequeue(cell: ListingShimmerCell.self)!
        }

        guard let cell: ContactTableViewCell = tableView.dequeue(cell: ContactTableViewCell.self) else { return UITableViewCell() }
        cell.configure(contact: contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let contacts = self.contacts else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: contactDetailsSegueIdentifier, sender: contacts[indexPath.row])
    }
}

extension ContactsViewController: ContactDetailsDelegate {
    
    func contactDetailsViewController(_ contactDetailsViewController: ContactDetailsViewController, didUpdatedContact contact: Contact) {
        
        if let index = contacts?.firstIndex(of: contact) {
            contacts?[index] = contact
            contactsTableView.reloadData()
        }
    }
}
