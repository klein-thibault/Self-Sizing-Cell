//
//  ViewController.swift
//  SelfSizingCell
//
//  Created by Thibault Klein on 6/7/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.registerNib(UINib(nibName: "SelfSizedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelfSizedCollectionViewCell")

        let flowLayout: UICollectionViewFlowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.estimatedItemSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 200)
    }

    // MARK:
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier("SelfSizedCollectionViewCell", forIndexPath: indexPath) as! UICollectionViewCell
    }

}

