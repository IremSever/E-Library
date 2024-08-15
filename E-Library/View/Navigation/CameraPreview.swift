//
//  CameraPreview.swift
//  E-Library
//
//  Created by İrem Sever on 14.08.2024.
//

import Foundation
import SwiftUI
import AVFoundation

struct CameraPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else { return controller }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return controller
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            return controller
        }

        let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.frame = controller.view.layer.bounds
        videoPreviewLayer.videoGravity = .resizeAspectFill
        controller.view.layer.addSublayer(videoPreviewLayer)

        captureSession.startRunning()

        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
