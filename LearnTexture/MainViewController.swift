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
    private let getStartedButton = Button(title: "Get Started")
    private let goToScrollViewWithEditableTextButton = Button(title: "Scroll with Editable Text")
    
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
        let greetingTextParagraphStyle = NSMutableParagraphStyle()
        greetingTextParagraphStyle.alignment = .center
        
        greetingText.attributedText = NSAttributedString(string: "Welcome Sigit, now we will learn about how to use texture / AsyncDisplayKit", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.70),
            NSAttributedString.Key.paragraphStyle: greetingTextParagraphStyle
            ])
        
        getStartedButton.addTarget(self, action: #selector(goToGetStartedView), forControlEvents: .touchUpInside)
        
        goToScrollViewWithEditableTextButton.addTarget(self, action: #selector(goToScrollViewWithEditableText), forControlEvents: .touchUpInside)
        
        node.layoutSpecBlock = { (_, _) -> ASLayoutSpec in
            
            let greetingTextInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: self.greetingText)
            
            let getStartedButtonInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 32, left: 16, bottom: 16, right: 16), child: self.getStartedButton)
            
            let goToScrollViewWithEditableTextButtonInsetWrapper = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: self.goToScrollViewWithEditableTextButton)
            
            let nodeContainer = ASStackLayoutSpec.vertical()
            nodeContainer.children = [greetingTextInsetWrapper, getStartedButtonInsetWrapper, goToScrollViewWithEditableTextButtonInsetWrapper]
            nodeContainer.justifyContent = .center
            nodeContainer.alignItems = .center
            
            return ASWrapperLayoutSpec(layoutElement: nodeContainer)
        }
    }
    
    @objc private func buttonPressed() {
        let greetingTextParagraphStyle = NSMutableParagraphStyle()
        greetingTextParagraphStyle.alignment = .center
        
        self.greetingText.attributedText = NSAttributedString(string: "Hello, let's start learn texture. I think it's better if we combine texture with Rx", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.70),
            NSAttributedString.Key.paragraphStyle: greetingTextParagraphStyle
            ])
    }
    
    @objc private func goToGetStartedView() {
        print("GO TO Get Started View")
    }
    
    @objc private func goToScrollViewWithEditableText() {
        print("GO TO Scroll View with Editable Text")
    }

}
