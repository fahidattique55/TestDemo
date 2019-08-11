//
//  ContactDetailsViewController.swift
//  TestDemo
//
//  Created by Fahad Attique on 11/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit

protocol ContactDetailsDelegate: class {
    func contactDetailsViewController(_ contactDetailsViewController: ContactDetailsViewController, didUpdatedContact contact: Contact)
}

class ContactDetailsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var contactDetailsTableView: UITableView!
    @IBOutlet weak var savebarItem: UIBarButtonItem!
    
    // MARK: - Class Properties
    
    private let mainInfoSection = 0, subInfoSection = 1
    private let firstNameIndexRow = 0, lastNameIndexRow = 1
    private let emailIndexRow = 0, phoneIndexRow = 1
    var contact: Contact!
    var isFirstOrLastNameEmpty: Bool {
        guard let contact = self.contact else { return true }
        return (contact.firstName.isEmpty || contact.lastName.isEmpty)
    }
    weak var delegate: ContactDetailsDelegate!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureView()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: - Functions[
    
    private func configureView() {
        
        addCancelButton()

        contactDetailsTableView.registerNib(from: EditContactDetailsTableViewCell.self)
        contactDetailsTableView.estimatedRowHeight = 50
        contactDetailsTableView.rowHeight = UITableView.automaticDimension

        contactDetailsTableView.registerNibHeaderFooter(from: TableSectionHeaderFooterView.self)
        contactDetailsTableView.sectionHeaderHeight = UITableView.automaticDimension
        contactDetailsTableView.estimatedSectionHeaderHeight = 35
        
        //  in case first or last name are empty from JSON file
        savebarItem.isEnabled = !isFirstOrLastNameEmpty
    }
    
    
    // MARK: - IBActions
    
    @IBAction func saveContactDetails(_ sender: Any) {
        delegate?.contactDetailsViewController(self, didUpdatedContact: contact)
        dismissMe()
    }
}

extension ContactDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: EditContactDetailsTableViewCell = tableView.dequeue(cell: EditContactDetailsTableViewCell.self) else { return UITableViewCell() }

        if indexPath.section == mainInfoSection {
            if indexPath.row == firstNameIndexRow {
                cell.infoTitle.text = "First Name"
                cell.infoTextfield.text = contact?.firstName
                cell.infoTextfield.tag = 1
            }
            else if indexPath.row == lastNameIndexRow {
                cell.infoTitle.text = "Last Name"
                cell.infoTextfield.text = contact?.lastName
                cell.infoTextfield.tag = 2
            }
        }
        else if indexPath.section == subInfoSection {
            if indexPath.row == emailIndexRow {
                cell.infoTitle.text = "Email"
                cell.infoTextfield.text = contact?.email
                cell.infoTextfield.tag = 3
            }
            else if indexPath.row == phoneIndexRow {
                cell.infoTitle.text = "Phone"
                cell.infoTextfield.text = contact?.phone
                cell.infoTextfield.tag = 4
            }
        }

        cell.infoTextfield.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let view : TableSectionHeaderFooterView = tableView.dequeue(headerFooter: TableSectionHeaderFooterView.self) else { return UIView()}
        if section == mainInfoSection {
            view.sectionTitle.text = "Main Information"
        }
        else if section == subInfoSection {
            view.sectionTitle.text = "Sub Information"
        }
        return view
    }
}

extension ContactDetailsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTextFieldTag = textField.tag + 1
        if let nextTextField = view.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        savebarItem.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let textfieldCell = textField.chainedResponder(of: EditContactDetailsTableViewCell.self)
        guard let cell = textfieldCell else { return }
        guard let indexPath = contactDetailsTableView.indexPath(for: cell) else { return }

        if indexPath.section == mainInfoSection {
            if indexPath.row == firstNameIndexRow {
                contact?.firstName = cell.infoTextfield.text ?? ""
            }
            else if indexPath.row == lastNameIndexRow {
                contact?.lastName = cell.infoTextfield.text ?? ""
            }
        }
        else if indexPath.section == subInfoSection {
            if indexPath.row == emailIndexRow {
                contact?.email = cell.infoTextfield.text ?? ""
            }
            else if indexPath.row == phoneIndexRow {
                contact?.phone = cell.infoTextfield.text ?? ""
            }
        }
        
        savebarItem.isEnabled = !isFirstOrLastNameEmpty
    }
}
