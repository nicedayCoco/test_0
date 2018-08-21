//
//  Test_6_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/1/9.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class Test_6_ViewController: UIViewController,AVAudioPlayerDelegate {

    var audioPlayer:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let videoButton = UIButton()
        videoButton.setTitleColor(UIColor.blue, for: .normal)
        videoButton.setTitle("Play Video", for: .normal)
        videoButton.frame = CGRect(x:50,y:50,width:100,height:50)
        self.view.addSubview(videoButton)
        videoButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        
        let audioPlayButton = UIButton()
        audioPlayButton.setTitleColor(.red, for: .normal)
        audioPlayButton.setTitle("Play Audio", for: .normal)
        audioPlayButton.frame = CGRect(x:50,y:150,width:100,height:50)
        self.view.addSubview(audioPlayButton)
        audioPlayButton.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        
        let audioPauseButton = UIButton()
        audioPauseButton.setTitleColor(.red, for: .normal)
        audioPauseButton.setTitle("Pause Audio", for: .normal)
        audioPauseButton.frame = CGRect(x:50,y:250,width:100,height:50)
        self.view.addSubview(audioPlayButton)
        audioPauseButton.addTarget(self, action: #selector(pauseAudio), for: .touchUpInside)
        
        
        
        // Do any additional setup after loading the view.
    }

    func initAudio(){
        let audioPath = Bundle.main.path(forResource: "live", ofType: "mp3")
        let audioUrl = URL(fileURLWithPath:audioPath!)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        }
        
        catch{
            audioPlayer = nil
        }
        
        do {
            try
            AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("error")
        }
    }
    
    func initforLockScreen(){
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle:"xxx",
            MPMediaItemPropertyArtist:"jjjj",
//            MPMediaItemPropertyArtwork:MPMediaItemPropertyArtwork(image:)
        ]
    }
    
    func playAudio(){
        audioPlayer?.play()
    }
    
    func pauseAudio(){
        audioPlayer?.pause()
    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        switch event!.subtype {
        case .remoteControlPlay:
            audioPlayer?.play()
        case .remoteControlPause:
            audioPlayer?.pause()
        case .remoteControlStop:
            audioPlayer?.stop()
        default:
            break
        }
        
    }
    
    func playVideo(){
        let videoUrl = URL(string:"http://down.treny")
        let player = AVPlayer(url:videoUrl!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            
        }
        
    }

}
