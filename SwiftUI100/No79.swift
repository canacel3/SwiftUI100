//
//  No79.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss
    @Binding var image: UIImage?
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.dismiss()
            if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, _ in
                    guard let image = image as? UIImage else { return }
                    DispatchQueue.main.async {
                        self?.parent.image = image
                    }
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configration = PHPickerConfiguration()
        configration.filter = .images
        configration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}

struct No79: View {
    @State var image: UIImage?
    @State var isPresented: Bool = false
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
            } else {
                Text("No Image")
            }
            Button (action: {
                isPresented.toggle()
            }) {
                Text("Select Image")
            }
            .padding(.top, 60)
        }
        .sheet(isPresented: $isPresented) {} content: {
            ImagePicker(image: $image)
        }
    }
}

struct No79_Previews: PreviewProvider {
    static var previews: some View {
        No79()
    }
}
