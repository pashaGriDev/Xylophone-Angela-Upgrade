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
    
    let soundButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("C", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    
    // MARK: - Methods
    
    private func setup() {
        
        view.backgroundColor = .white
        view.addSubview(soundButton)
        
        NSLayoutConstraint.activate([
            soundButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            soundButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            soundButton.widthAnchor.constraint(equalToConstant: 200),
            soundButton.heightAnchor.constraint(equalToConstant: 50)])
        
        // add target
        
        soundButton.addTarget(self, action: #selector(didPressed), for: .touchUpInside)
    }
    
    @objc func didPressed(_ sender: UIButton) {

        if let title = sender.currentTitle, title == "C" {
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

