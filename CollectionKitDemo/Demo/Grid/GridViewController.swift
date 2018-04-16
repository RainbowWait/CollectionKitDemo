//
//  GridViewController.swift
//  CollectionKitDemo
//
//  Created by 郑小燕 on 2018/4/13.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit
import CollectionKit
let kGridCellSize = CGSize(width: 50, height: 50)
let kGridSize = (width: 20, height: 20)
let kGridCellPadding:CGFloat = 10
class GridViewController: CollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dataProvider = ArrayDataProvider(data: Array(1...kGridSize.width * kGridSize.height)) { (_, data) -> String in
             return "\(data)"
        }
        let visibleFrameInsets = UIEdgeInsets(top: -150, left: -150, bottom: -150, right: -150)
        let layout = Closurelayout{ (i, data: Int, _) -> CGRect in
            CGRect(x: CGFloat(i % kGridSize.width) * (kGridCellSize.width + kGridCellPadding), y: CGFloat(i / kGridSize.width) * (kGridCellSize.height + kGridCellPadding), width: kGridCellSize.width, height: kGridCellSize.height)
        }.insetVisibleFrame(by: visibleFrameInsets)
        collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
        let provider = CollectionProvider(
            dataProvider: dataProvider,
            viewUpdater: { (view: UILabel, data: Int, index: Int) in
                view.backgroundColor = UIColor(hue: CGFloat(index) / CGFloat(kGridSize.width * kGridSize.height),
                                               saturation: 0.68, brightness: 0.98, alpha: 1)
                view.textColor = .white
                view.textAlignment = .center
                view.text = "\(data)"
        }
        )
        provider.layout = layout
        provider.presenter = WobblePresenter()
        self.provider = provider
        
        
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
