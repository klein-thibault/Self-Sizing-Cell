//
//  ViewController.swift
//  SelfSizingCell
//
//  Created by Thibault Klein on 6/7/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.registerNib(UINib(nibName: "SelfSizedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelfSizedCollectionViewCell")
        self.collectionView.registerNib(UINib(nibName: "SelfSizedTableCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelfSizedTableCollectionViewCell")
        self.collectionView.registerNib(UINib(nibName: "SelfSizedLabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelfSizedLabelCollectionViewCell")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let flowLayout: UICollectionViewFlowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.estimatedItemSize = CGSizeMake(self.collectionView.frame.width, 100)
    }

    // MARK:
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if (indexPath.row == 0) {
            return collectionView.dequeueReusableCellWithReuseIdentifier("SelfSizedCollectionViewCell", forIndexPath: indexPath) as! UICollectionViewCell
        } else if (indexPath.row == 1) {
            return collectionView.dequeueReusableCellWithReuseIdentifier("SelfSizedTableCollectionViewCell", forIndexPath: indexPath) as! UICollectionViewCell
        } else {
            let cell: SelfSizedLabelCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("SelfSizedLabelCollectionViewCell", forIndexPath: indexPath) as! SelfSizedLabelCollectionViewCell
            cell.selfSizedLabel.text = self.randomStringWithLength(300) as String
            return cell
        }
    }

    func randomStringWithLength (len : Int) -> NSString {

        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

        var randomString : NSMutableString = NSMutableString(capacity: len)

        for (var i=0; i < len; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }

        return randomString
    }

}

