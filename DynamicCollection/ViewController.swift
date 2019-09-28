//
//  ViewController.swift
//  DynamicCollection
//
//  Created by macbook on 9/28/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var myCollection: UICollectionView!
    
    let textarr = ["hello", "hello world", "Good", "vaaerberbraebraebrea","hello", "hello world", "Good", "vaaerberbraebraebrea"]
    let cellId = "DynamicCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myCollection.delegate = self
        myCollection.dataSource = self
        
        // register cell
        let nib = UINib(nibName: cellId, bundle: nil)
        myCollection.register(nib, forCellWithReuseIdentifier: cellId)
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DynamicCollectionViewCell
        cell.dynamicLabel.text = textarr[indexPath.item]
        cell.dynamicLabel.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = textarr[indexPath.item]
        let label = UILabel(frame: CGRect.zero)
        label.text = text
        label.sizeToFit()
        return CGSize(width: label.frame.width+20, height: 32)
    }
}

