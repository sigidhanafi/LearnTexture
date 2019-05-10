//
//  ScrollWithEditableText.swift
//  LearnTexture
//
//  Created by Sigit Hanafi on 10/05/19.
//  Copyright © 2019 Sigit Hanafi. All rights reserved.
//

import AsyncDisplayKit

class ScrollViewWithEditableText: ASViewController<ASScrollNode> {
    private let firstNameTextInput = TextInput(label: "First Name")
    private let lastNameTextInput = TextInput(label: "Last Name")
    private let addressTextArea = TextArea(label: "Address")
    private let placeOfBirth = TextInput(label: "Place of Birth")
    private let provinceTextInput = TextInput(label: "Province")
    private let cityTextInput = TextInput(label: "City")
    private let districtTextInput = TextInput(label: "District")
    private let occupationTextInput = TextInput(label: "Occupation")
    private let positionTextInput = TextInput(label: "Position")
    private let interestTextInput = TextInput(label: "Interest")
    private let saveButtonNode = Button(title: "Save")
    private var activeTextInput: ASEditableTextNode?
    
    init() {
        let scrollNode = ASScrollNode()
        scrollNode.automaticallyManagesSubnodes = true
        scrollNode.automaticallyManagesContentSize = true
        scrollNode.backgroundColor = .white
        
        super.init(node: scrollNode)
        
        generateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        title = "ScrollView with Editable Text"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification , object: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func generateView() {
        node.layoutSpecBlock = { (_, constrainedSize) in
            let saveButtonInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16), child: self.saveButtonNode)
            
            let formVerticalWrapper = ASStackLayoutSpec.vertical()
            formVerticalWrapper.children = [self.firstNameTextInput, self.lastNameTextInput, self.addressTextArea, self.placeOfBirth, self.provinceTextInput, self.cityTextInput, self.districtTextInput, self.occupationTextInput, self.positionTextInput, self.interestTextInput,  saveButtonInsetWrapper]
            
            return formVerticalWrapper
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        guard let keyboardFrame = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.size.height, right: 0)
        node.view.contentInset = contentInset
        node.view.scrollIndicatorInsets = contentInset
        node.view.scrollRectToVisible(self.saveButtonNode.frame, animated: true)
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        node.view.contentInset = contentInset
        node.view.scrollIndicatorInsets = contentInset
    }
}
