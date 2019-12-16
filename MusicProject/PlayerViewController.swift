//
//  PlayerViewController.swift
//  MusicProject
//
//  Created by Pursuit on 11/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

  
    @IBOutlet weak var PlayerImage: UIImageView!
    @IBOutlet weak var PlayerTitle: UILabel!
    @IBOutlet weak var PlayerArtist: UILabel!
    @IBOutlet weak var volumeControl: UISlider!
    @IBOutlet weak var nextSongButton: UIButton!
    
    var song: Song?
    var Player = AVAudioPlayer()
    
    var currentSliderValue: Float = 1.0 {
        didSet {
            Player.volume = currentSliderValue
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        song?.volumeValue = currentSliderValue
    }
    
    override func viewDidLoad() {
        setUp()
        playSong()
        
    }
    
    
    
    @IBAction func volumeChnage(_ sender: UISlider) {
        currentSliderValue = sender.value
    }
    
    
    private func setUp(){
        PlayerImage.image = song?.image
        PlayerTitle.text = song?.name
        PlayerArtist.text = song?.artist
        if let volume = song?.volumeValue {
            volumeControl.value = volume
            currentSliderValue = volume
        }
        
    }
    private func playSong() {
        guard let fileURL = Bundle.main.url(forResource: song?.file, withExtension: "mp3") else { return }
        do {
            Player = try AVAudioPlayer.init(contentsOf: fileURL)
            if let volume = song?.volumeValue {
                Player.volume = volume
            }
            } catch {
            print(error)
        }
        Player.play()
    }
}
