//
//  TextInput.swift
//  LearnTexture
//
//  Created by Sigit Hanafi on 10/05/19.
//  Copyright © 2019 Sigit Hanafi. All rights reserved.
//

import AsyncDisplayKit

class TextInput: ASDisplayNode {
    private let label: String
    private let editableTextNode = ASEditableTextNode()
    private let labelNode = ASTextNode()
    private let separatorNode = ASDisplayNode()
    
    init(label: String) {
        self.label = label
        
        super.init()

        self.automaticallyManagesSubnodes = true
        self.editableTextNode.delegate = self
        
        editableTextNode.attributedPlaceholderText = NSAttributedString(string: "Input \(self.label)", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7)
            ])
        editableTextNode.autocorrectionType = .no
        
        labelNode.attributedText = NSAttributedString(string: self.label, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.7)
            ])
        
        
        separatorNode.style.height = ASDimensionMake(0.5)
        separatorNode.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let editableTextNodeInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0), child: editableTextNode)
        
        let textInputVerticalWrapper = ASStackLayoutSpec.vertical()
        textInputVerticalWrapper.children = [self.labelNode, editableTextNodeInsetWrapper, separatorNode]
        
        let textInputInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16), child: textInputVerticalWrapper)
        
        return textInputInsetWrapper
    }
}

extension TextInput: ASEditableTextNodeDelegate {
    func editableTextNode(_ editableTextNode: ASEditableTextNode, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            editableTextNode.resignFirstResponder()
            return false
        }
        return true
    }
}
