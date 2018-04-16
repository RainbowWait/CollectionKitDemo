//
//  HorizontalGalleryViewController.swift
//  CollectionKitDemo
//
//  Created by 郑小燕 on 2018/4/13.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit
import CollectionKit
func imageSizeProvider(at: Int, data: UIImage, collectionSize: CGSize) -> CGSize {
    var imageSize = data.size
    if imageSize.width > collectionSize.width {
        imageSize.height /= imageSize.width/collectionSize.width
        imageSize.width = collectionSize.width
    }
    if imageSize.height > collectionSize.height {
        imageSize.width /= imageSize.height/collectionSize.height
        imageSize.height = collectionSize.height
    }
    return imageSize
}
class HorizontalGalleryViewController: CollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
        let provider = CollectionProvider(data: testImages, viewGenerator: { (data, index) -> UIImageView in
            let view = UIImageView()
            view.layer.cornerRadius = 5
            view.clipsToBounds = true
            return view
        }, viewUpdater: {(view: UIImageView, data: UIImage, at: Int) in
            view.image = data
        })
            let visibleFrameInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: -100)
        provider.layout = WaterfallLayout(columns: 2).transposed().insetVisibleFrame(by: visibleFrameInsets)
        provider.sizeProvider = imageSizeProvider
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
