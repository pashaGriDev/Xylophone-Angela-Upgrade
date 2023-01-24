//
//  ViewController.swift
//  Xylophone-Angela-Upgrade
//
//  Created by Павел Грицков on 24.01.23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Constants
    
    var player: AVAudioPlayer?
    
    let soundButtons: [SoundButton] = [
        .init(title: "A", color: .A)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    
    // MARK: - Methods
    
    private func setup() {
        
        view.backgroundColor = .white
        soundButtons.forEach {
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            soundButtons[0].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            soundButtons[0].centerYAnchor.constraint(equalTo: view.centerYAnchor),
            soundButtons[0].widthAnchor.constraint(equalToConstant: 200),
            soundButtons[0].heightAnchor.constraint(equalToConstant: 50)])
        
        // add target
        
        soundButtons[0].addTarget(self, action: #selector(didPressed), for: .touchUpInside)
    }
    
    @objc func didPressed(_ sender: UIButton) {

        if let title = sender.currentTitle {
            print("it's work")
            playSound()
        } else {
            print("it's not work")
        }
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "D", ofType: "wav") else {
            print("not path")
            return }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

