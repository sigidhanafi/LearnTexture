//
//  MainViewController.swift
//  LearnTexture
//
//  Created by Sigit Hanafi on 18/04/19.
//  Copyright © 2019 Sigit Hanafi. All rights reserved.
//
import AsyncDisplayKit

class MainViewController: ASViewController<ASDisplayNode> {
    
    private let greetingText = ASTextNode()
    
    public init() {
        let node = ASDisplayNode()
        node.backgroundColor = .white
        node.automaticallyManagesSubnodes = true
        
        super.init(node: node)
        
        generateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "Learn Texture"
        self.view.backgroundColor = UIColor.white

    }
    
    private func generateView() {
        greetingText.attributedText = NSAttributedString(string: "Welcome Sigit, now we will learn about how to use texture / AsyncDisplayKit", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.70)
            ])
        
        node.layoutSpecBlock = { (_, _) -> ASLayoutSpec in
            
            let greetingTextInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: self.greetingText)
            
            return ASWrapperLayoutSpec(layoutElement: greetingTextInsetWrapper)
        }
    }

}
