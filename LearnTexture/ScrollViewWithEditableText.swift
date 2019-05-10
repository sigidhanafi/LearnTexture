//
//  ScrollWithEditableText.swift
//  LearnTexture
//
//  Created by Sigit Hanafi on 10/05/19.
//  Copyright © 2019 Sigit Hanafi. All rights reserved.
//

import AsyncDisplayKit

class ScrollViewWithEditableText: ASViewController<ASScrollNode> {
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
    }
    
    private func generateView() {
        node.layoutSpecBlock = { (_, constrainedSize) in
            
            let firstNameTextInput = TextInput(label: "First Name")
            
            let lastNameTextInput = TextInput(label: "Last Name")
            
            let formVerticalWrapper = ASStackLayoutSpec.vertical()
            formVerticalWrapper.children = [firstNameTextInput, lastNameTextInput]
            
            return formVerticalWrapper
        }
    }
}
