//
//  ImageWithAbsoluteIcon.swift
//  LearnTexture
//
//  Created by Sigit Hanafi on 10/05/19.
//  Copyright © 2019 Sigit Hanafi. All rights reserved.
//

import AsyncDisplayKit

class ImageWithAbsoluteIcon: ASViewController<ASDisplayNode> {
    private let iconPlus = ASImageNode()
    private let imageNode = ASImageNode()
    
    init() {
        let node = ASDisplayNode()
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        super.init(node: node)
        
        iconPlus.image = UIImage(named: "icon-plus")
        iconPlus.style.preferredSize = CGSize(width: 40, height: 40)
        iconPlus.style.layoutPosition = CGPoint(x: 200, y: 0)
        
        imageNode.image = UIImage(named: "iphone-banner")
        imageNode.style.preferredSize = CGSize(width: 200, height: 200)
        imageNode.style.layoutPosition = CGPoint(x: 40 / 2.0, y: 40 / 2.0)
        
        generateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        title = "Image with Absolute Icon"
    }
    
    func generateView() {
        node.layoutSpecBlock = { (_, constrainedSize) -> ASLayoutSpec in
            let absoluteStack = ASAbsoluteLayoutSpec(children: [self.imageNode, self.iconPlus])
            absoluteStack.sizing = .sizeToFit
            
            return absoluteStack
        }
    }
    
}
