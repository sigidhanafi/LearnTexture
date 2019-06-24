//
//  SamplePlaygorund.swift
//  LearnTexture
//
//  Created by Sigit Hanafi on 11/05/19.
//  Copyright © 2019 Sigit Hanafi. All rights reserved.
//

import AsyncDisplayKit

class SimplePlaground: ASViewController<ASDisplayNode> {
    private let labelTextNode = ASTextNode()
    private let displayNode = ASDisplayNode()
    
    init() {
        let node = ASDisplayNode()
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        super.init(node: node)
        
        generateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateView() {
        labelTextNode.attributedText = NSAttributedString(string: "Hello, this is label", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.7)
            ])
        
        displayNode.style.width = ASDimensionMake(100)
        displayNode.style.height = ASDimensionMake(100)
        displayNode.backgroundColor = .blue
        
        node.layoutSpecBlock = { (_, constrainedSize) -> ASLayoutSpec in
            self.displayNode.layoutSpecBlock = { (_, _) -> ASLayoutSpec in
                return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: self.labelTextNode)
            }
            
            let wrapperLayout = ASWrapperLayoutSpec(layoutElement: self.displayNode)
            
            return wrapperLayout
        }
    }
    
}
