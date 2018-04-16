//
//  ArticleExampleViewController.swift
//  CollectionKitDemo
//
//  Created by 郑小燕 on 2018/4/13.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit

class ArticleExampleViewController: CollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let articles: [ArticleData] = {
            var acticels = [ArticleData]()
            for i in 1..<21 {
                if i % 3 == 0 {
                     let mode = ArticleData(hueValue: CGFloat(i) / CGFloat(20), title: "Article \(i)", subTitle: "This is the subtitle for article and me like this method or handling this thing ,do you like this method \(i)")
                    acticels.append(mode)
                } else {
                     let mode = ArticleData(hueValue: CGFloat(i) / CGFloat(20), title: "Article \(i)", subTitle: "This is the subtitle for article \(i)")
                     acticels.append(mode)
                }
            }
            return acticels
        }()
        let providrer = CollectionProvider(data: articles, viewUpdater: {(view: ArticleView, data: ArticleData, at: Int) in
            view.populate(article: data)
        })
        providrer.layout = FlowLayout(lineSpacing: 30)
        providrer.sizeProvider = {(_, view, size) -> CGSize in
            return CGSize(width: size.width, height: 200)
        }
        self.provider = providrer
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
