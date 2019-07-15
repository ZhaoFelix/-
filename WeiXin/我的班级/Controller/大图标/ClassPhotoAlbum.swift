//  MyPhotoAlbum.swift
//  WeiXin
//  Created by administrator on 2019/7/8.
//  Copyright © 2019 apple. All rights reserved.
    
import UIKit
import MWPhotoBrowser
import SDWebImage
class ClassPhotoAlbum: UIViewController,UICollectionViewDataSource,WCLWaterFallLayoutDelegate,
UICollectionViewDelegate,MWPhotoBrowserDelegate {
    var imageURL:[String] = []
    
    func columnOfWaterFall(_ collectionView: UICollectionView) -> Int {
        return columnCount
    }
    
    func waterFall(_ collectionView: UICollectionView, layout waterFallLayout: WCLWaterFallLayout, heightForItemAt indexPath: IndexPath) -> CGFloat {
        let height = 100 + arc4random() % 100
        return CGFloat(height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath)
        //  cell.contentView.backgroundColor    = [UIColor.blue, UIColor.red, UIColor.yellow][indexPath.row % 3]
        cell.contentView.clipsToBounds      = true
        cell.contentView.layer.cornerRadius = 5
        let imageView = UIImageView()
        imageView.sd_setImage(with: URL(string: imageURL[indexPath.row]))
        cell.backgroundView = imageView
        return cell
    }
    
    var dataCount = 10
    var columnCount = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        createImageURL()
        let layout = WCLWaterFallLayout(lineSpacing: 5, columnSpacing: 5, sectionInsets: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
        layout.delegate = self
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Identifier")
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.shadowImage = UIImage()
        print(imageURL)
    }
    func createImageURL(){
        for _ in 0...16 {
            let randomNum = arc4random()%700
            let str = "https://picsum.photos/id/\(randomNum)/300/200"
            imageURL.append(str)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width:view.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoBrowser = MWPhotoBrowser(delegate: self)
        //self.present(photoBrowser!, animated: true, completion: nil)
        photoBrowser?.setCurrentPhotoIndex(UInt(indexPath.row))
        // photoBrowser?.displayNavArrows = true //是否显示左右切换按钮
        photoBrowser?.enableGrid = true
        photoBrowser?.alwaysShowControls = true
        photoBrowser?.enableSwipeToDismiss = true
        photoBrowser?.showNextPhoto(animated: true)
        self.navigationController?.pushViewController(photoBrowser!, animated: true)
    }
    
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt {
        return UInt(imageURL.count)
    }
    
    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, photoAt index: UInt) -> MWPhotoProtocol! {
        let photo = MWPhoto(url: URL(string: imageURL[Int(index)]))
        return photo
    }
}


