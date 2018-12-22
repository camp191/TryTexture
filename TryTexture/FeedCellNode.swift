//
//  ASCellNode.swift
//  TryTexture
//
//  Created by Thanapat Sorralump on 21/12/2561 BE.
//  Copyright © 2561 Thanapat Sorralump. All rights reserved.
//

import AsyncDisplayKit

class FeedCellNode: ASCellNode {
    
    private let userNameNode = ASTextNode()
    private let imageNode = ASNetworkImageNode()
    
    func configure(row: Int, feed: FeedModel) {
        let attrs = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 20.0)]
        let text = feed.text
        userNameNode.attributedText = NSAttributedString(string: text, attributes: attrs)
        userNameNode.maximumNumberOfLines = 0
        userNameNode.truncationMode = .byTruncatingTail
        
        imageNode.url = feed.image
        imageNode.shouldCacheImage = false
        imageNode.style.preferredSize = CGSize(width: 320, height: Int.random(in: 200...500))
        imageNode.contentMode = UIView.ContentMode.scaleAspectFill
        imageNode.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
    }
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let headerStackSpec = ASStackLayoutSpec(direction: .vertical,
                                                spacing: 20,
                                                justifyContent: .start,
                                                alignItems: .center,
                                                children: [userNameNode, imageNode])
        
        return headerStackSpec
    }
    
}
