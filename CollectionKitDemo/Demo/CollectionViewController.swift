//
//  CollectionViewController.swift
//  CollectionKitDemo
//
//  Created by 郑小燕 on 2018/4/13.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    let collectionView = CollectionView()
    
    var provider: AnyCollectionProvider {
        get {
            return collectionView.provider
        }
        set {collectionView.provider = newValue}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = self.view.bounds
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
