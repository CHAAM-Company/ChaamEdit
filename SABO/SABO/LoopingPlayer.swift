//
//  LoopingPlayer.swift
//  LoopingPlayer
//
//  Created by SchwiftyUI on 3/28/20.
//  Copyright © 2020 SchwiftyUI. All rights reserved.
//
import SwiftUI
import AVFoundation

struct LoopingPlayer: UIViewRepresentable {
    var videoName: String
    
    func makeUIView(context: Context) -> UIView {
        let player = QueuePlayerUIView(frame: .zero, videoName: self.videoName)
        return player
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Do nothing here
    }
}

class QueuePlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    var videoName: String = ""

    
    init(frame: CGRect, videoName: String) {
        super.init(frame: frame)
        self.videoName = videoName
        
        // Load Video
        let fileUrl = Bundle.main.url(forResource: videoName, withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: fileUrl)
        
        // Setup Player
        let player = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        // Loop
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        
        // Play
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

