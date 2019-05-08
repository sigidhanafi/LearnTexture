//
//  Button.swift
//  LearnTexture
//
//  Created by Sigit Hanafi on 07/05/19.
//  Copyright © 2019 Sigit Hanafi. All rights reserved.
//

import AsyncDisplayKit

class Button: ASControlNode {
    private let button = ASButtonNode()
    private let title: String
    
    init(title: String) {
        self.title = title
        super.init()
        
        self.automaticallyManagesSubnodes = true
        
        let buttonTitle = NSAttributedString(string: self.title, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.white
            ])
        button.setAttributedTitle(buttonTitle, for: .normal)
    }
    
    override func didLoad() {
        button.shadowColor = UIColor.black.cgColor
        button.shadowOffset = CGSize(width: 0, height: 2)
        button.shadowOpacity = 0.2
        button.shadowRadius = 3
        button.cornerRadius = 4
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 32, bottom: 8, right: 32)
        
        let buttonWrapper =  ASWrapperLayoutSpec(layoutElement: self.button)
        return buttonWrapper
    }

}
