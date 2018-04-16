//
//  ViewController.swift
//  CollectionKitDemo
//
//  Created by 郑小燕 on 2018/4/13.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit
import CollectionKit
let bodyInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
let headerInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
func space(_ height: CGFloat) -> AnyCollectionProvider {
    return SpaceCollectionProvider(sizeStrategy: (.fill, .absolute(height)))
}
class ViewController: CollectionViewController {
    let examples: [(String, UIViewController.Type)] = [
        ("Horizontal Gallery", HorizontalGalleryViewController.self),
        ("Grid", GridViewController.self),
        ("Articles", ArticleExampleViewController.self),
        ("Reload", ReloadDataViewController.self),
        ("Reload Animation", ReloadAnimationViewController.self),
        ("Chat", MessagesViewController.self),
        ("Presenters", PresenterExampleViewController.self)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let examplesSection = CollectionProvider(data: examples, viewUpdater: {(view: ExampleView, data: (String, UIViewController.Type), at: Int) in
            view.populate(title: data.0, contentViewControllerType: data.1)
//            view.backgroundColor = UIColor.lightGray
        })
        examplesSection.layout = FlowLayout(lineSpacing: 10).inset(by: bodyInset)
        examplesSection.sizeProvider = {(index, _, size)-> CGSize in
           return CGSize(width: size.width, height: size.height * 0.7)
        }
        provider = CollectionComposer(
            space(10),
            LabelCollectionProvider(text: "CollectionKit", font: .boldSystemFont(ofSize: 38), insets: headerInset),
            LabelCollectionProvider(text: "A modern swift framework for building reusable collection view components 哈哈哈哈啊哈哈哈哈服哈克还房贷卡复活点卡后方可萨芬哈萨克发哈快恢复卡刷饭卡数据恢复开始打后方可撒谎.", font: .systemFont(ofSize: 20), insets: bodyInset),
            space(30),
            LabelCollectionProvider(text: "Examples", font: .boldSystemFont(ofSize: 30), insets: headerInset),
            examplesSection,
            space(30)
        )
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

