//
//  No53.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import AVFoundation
import Foundation
import SwiftUI

final class No53ViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?

    func playAudio() {
        guard let url = Bundle.main.url(forResource: "Water", withExtension: "mp3") else { return }
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer?.delegate = self
        audioPlayer?.play()
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Did finish playing")
    }
}

struct No53: View {
@ObservedObject private var viewModel = No53ViewModel()
    var body: some View {
        Button("Play") {
            viewModel.playAudio()
        }
    }
}

struct No53_Previews: PreviewProvider {
    static var previews: some View {
        No53()
    }
}
