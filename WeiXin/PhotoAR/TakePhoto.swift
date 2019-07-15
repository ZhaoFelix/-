//
//  TakePhoto.swift
//  WeiXin
//
//  Created by administrator on 6/26/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class TakePhoto: UIViewController,ARSCNViewDelegate {
    
  
    @IBOutlet weak var sceneView: HKARSCNView!
    
    let rescouceManager = RescouceManager.share
    let rescoucceConfiguration = RescouceConfiguration.share
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        sceneView.showsStatistics = false
        showPhotos()
    }
    
    @IBAction func backVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        showPhotos()
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func showPhotos() {
        sceneView.removeAllNodes()
        sceneView.addPhotoRing_Box(vector3: SCNVector3Make(0, 0, -6), left: 1, L: 40)
        sceneView.addPhotoRing_H(vector3: SCNVector3Make(0, -1.2, -6), left: -1, L: 10)
        sceneView.addPhotoRing_Box(vector3: SCNVector3Make(0, -2.4, -6), left: 1, L: 40)
        sceneView.addPhotoRing_V(vector3: SCNVector3Make(0, 1.5, -6), left: 1, L: 20)
        sceneView.addPhotoRing_V(vector3: SCNVector3Make(0, -4, -6), left: -1, L: 20)
        sceneView.addPhotoRing_Back(vector3: SCNVector3Make(0, -2, -8), left: -1, L: 2)
        //背景
        if rescoucceConfiguration.panorama_isShow {
            if let panoramaImage = rescouceManager.panoramaImage {
                sceneView.addPanoramaImage(image: panoramaImage)
            }
        }
        //播放背景音乐
        if rescoucceConfiguration.voice_isPlay {
            if let musicName = rescouceManager.musicName {
                print(musicName)
                sceneView.playMusic(musicName: musicName)
            }
        }
        //粒子效果
        if rescoucceConfiguration.particle_isShow {
            sceneView.addParticleSytem(type: rescouceManager.particleType)
        }
        //文字
        if rescoucceConfiguration.text_isShow {
            if let text = rescouceManager.text {
                if let color = rescouceManager.textColor {
                    sceneView.addPhotoRing_Text(text: text, color: color)
                }
            }
        }
    }
    
    
}
