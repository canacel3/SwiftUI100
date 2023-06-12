//
//  No77.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import AVFoundation
import SwiftUI

private enum RecordingStatus: String {
    case ready
    case start
    case stop
}

protocol CameraViewDelegate: AnyObject {
    func didFinishRecording(outputFileURL: URL)
}

final class UICameraView: UIView {
    private var videoDevice: AVCaptureDevice?
    private let fileOutput = AVCaptureMovieFileOutput()
    private var videoLayer: AVCaptureVideoPreviewLayer!
    weak var delegate: CameraViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        let captureSession: AVCaptureSession = AVCaptureSession()
        videoDevice = defaultCamera()
        let audioDevice: AVCaptureDevice? = AVCaptureDevice.default(for: AVMediaType.audio)

        let videoInput: AVCaptureDeviceInput = try! AVCaptureDeviceInput(device: videoDevice!)
        captureSession.addInput(videoInput)

        let audioInput = try! AVCaptureDeviceInput(device: audioDevice!)
        captureSession.addInput(audioInput)

        fileOutput.maxRecordedDuration = CMTimeMake(value: 60, timescale: 1)
        
        captureSession.addOutput(fileOutput)

        captureSession.beginConfiguration()
        if captureSession.canSetSessionPreset(.hd4K3840x2160) {
            captureSession.sessionPreset = .hd4K3840x2160
        } else if captureSession.canSetSessionPreset(.high) {
            captureSession.sessionPreset = .high
        }
        captureSession.commitConfiguration()

        captureSession.startRunning()

        videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        layer.addSublayer(videoLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        videoLayer.frame = bounds
    }

    func startRecording() {
        let tempDirectory: URL = URL(fileURLWithPath: NSTemporaryDirectory())
        let fileURL: URL = tempDirectory.appendingPathComponent("mytemp1.mov")
        fileOutput.startRecording(to: fileURL, recordingDelegate: self)
    }

    func stopRecording() {
        fileOutput.stopRecording()
    }

    private func defaultCamera() -> AVCaptureDevice? {
        if let device = AVCaptureDevice.default(.builtInDualCamera, for: AVMediaType.video, position: .front) {
            return device
        } else if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .front) {
            return device
        } else {
            return nil
        }
    }
}

extension UICameraView: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        delegate?.didFinishRecording(outputFileURL: outputFileURL)
    }
}

struct CameraView: UIViewRepresentable {
    @Binding fileprivate var recordingStatus: RecordingStatus
    let didFinishRecording: (_ outputFileURL: URL) -> Void
    
    final class Coordinator: NSObject, CameraViewDelegate {
        private var cameraView: CameraView
        let didFinishRecording: (_ outputFileURL: URL) -> Void
        
        init(_ cameraView: CameraView, didFinishRecording: @escaping (_ outputFileURL: URL) -> Void) {
            self.cameraView = cameraView
            self.didFinishRecording = didFinishRecording
        }

        func didFinishRecording(outputFileURL: URL) {
            didFinishRecording(outputFileURL)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, didFinishRecording: didFinishRecording)
    }
    
    func makeUIView(context: Context) -> UICameraView {
        let uiCameraView = UICameraView()
        uiCameraView.delegate = context.coordinator
        return uiCameraView
    }

    func updateUIView(_ uiView: UICameraView, context: Context) {
        switch recordingStatus {
        case .ready:
            return
        case .start:
            uiView.startRecording()
        case .stop:
            uiView.stopRecording()
        }
    }
}

struct No77: View {
    @State private var recordingStatus: RecordingStatus = .ready
    var body: some View {
        VStack {
            CameraView(recordingStatus: $recordingStatus) { url in
                recordingStatus = .ready
                print(url)
            }
            .frame(width: 300, height: 300)
            Button("Start") {
                recordingStatus = .start
            }
            Button("Stop") {
                recordingStatus = .stop
            }
            Text("StartRecording: \(recordingStatus.rawValue)")
        }
    }
}

struct No77_Previews: PreviewProvider {
    static var previews: some View {
        No77()
    }
}
