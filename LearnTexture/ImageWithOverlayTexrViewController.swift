//
//  ImageWithOverlayTexrViewController.swift
//  LearnTexture
//
//  Created by Sigit Hanafi on 10/05/19.
//  Copyright © 2019 Sigit Hanafi. All rights reserved.
//

import AsyncDisplayKit

class ImageWithOverlayTexrViewController: ASViewController<ASDisplayNode> {
    
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
        node.layoutSpecBlock = { (_, constrainedSize) -> ASLayoutSpec in
            let coverImageNode = ASImageNode()
            coverImageNode.image = UIImage(named: "iphone-banner")
            coverImageNode.style.width = ASDimensionMake(constrainedSize.max.width)
            coverImageNode.style.height = ASDimensionMake(200)
            coverImageNode.contentMode = .scaleAspectFill
            coverImageNode.backgroundColor = .red
            
            let imageCaption = ASTextNode()
            imageCaption.attributedText = NSAttributedString(string: "IMAGE CAPTION IN THE BANNER", attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30),
                NSAttributedString.Key.foregroundColor: UIColor.white,
                ])
            
            let imageCaptionInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: CGFloat.infinity, left: 16, bottom: 16, right: 16), child: imageCaption)
            
            let overlayWrapper = ASOverlayLayoutSpec(child: coverImageNode, overlay: imageCaptionInsetWrapper)
            
            return ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [overlayWrapper])
        }
    }
    
}
