//
//  ImagePicker.swift
//  E-Library
//
//  Created by İrem Sever on 14.08.2024.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context:
 Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
 context: Context) {
       
    }
}
