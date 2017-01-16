//
//  ViewController.swift
//  Sound Shaker
//
//  Created by Shailendra Suriyal on 16/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit
import  AVFoundation
class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Device Shaked ")
        var sounds = ["boing","explosion","hit","knife","shoot","swish","wah","warble"]
        let random = Int(arc4random_uniform( UInt32(UInt(sounds.count)) ))
        
        if event?.subtype == UIEventSubtype.motionShake {
          let fileName = sounds[random]
            print(fileName)
            let filePath = Bundle.main.path(forResource: "sounds/"+fileName, ofType: "mp3")
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath!))
                player.play()
                
            }catch{
                //Process Error
            }
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

