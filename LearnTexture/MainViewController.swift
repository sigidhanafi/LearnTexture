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
    private let startButton = ASButtonNode()
    
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
        
        startButton.shadowColor = UIColor.black.cgColor
        startButton.shadowOffset = CGSize(width: 0, height: 2)
        startButton.shadowOpacity = 0.2
        startButton.shadowRadius = 3
        startButton.cornerRadius = 4

    }
    
    private func generateView() {
        let greetingTextParagraphStyle = NSMutableParagraphStyle()
        greetingTextParagraphStyle.alignment = .center
        
        greetingText.attributedText = NSAttributedString(string: "Welcome Sigit, now we will learn about how to use texture / AsyncDisplayKit", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.70),
            NSAttributedString.Key.paragraphStyle: greetingTextParagraphStyle
            ])
        
        let buttonTitle = NSAttributedString(string: "Getting Started", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.white
            ])
        startButton.setAttributedTitle(buttonTitle, for: .normal)
        startButton.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        startButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 32, bottom: 8, right: 32)
        
        node.layoutSpecBlock = { (_, _) -> ASLayoutSpec in
            
            let greetingTextInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: self.greetingText)
            
            let startButtonInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 32, left: 16, bottom: 16, right: 16), child: self.startButton)
            
            let nodeContainer = ASStackLayoutSpec.vertical()
            nodeContainer.children = [greetingTextInsetWrapper, startButtonInsetWrapper]
            nodeContainer.justifyContent = .center
            nodeContainer.alignItems = .center
            
            return ASWrapperLayoutSpec(layoutElement: nodeContainer)
        }
    }

}
