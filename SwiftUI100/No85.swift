//
//  No85.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI
import UniformTypeIdentifiers

struct No85: View {
    @State private var fileURL: URL?
    @State private var isPresented: Bool = false

    var body: some View {
        VStack(spacing: 16) {
            Button("Save File to Document") {
                let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let fileURL = documentDirectoryURL.appendingPathComponent("minecraft.txt")
                try! "I Love Minecraft!".data(using: .utf8)!.write(to: fileURL, options: .atomic)
            }
            Button("Show File Picker") {
                isPresented.toggle()
            }
            Text("FileURL: \(fileURL?.description ?? "nil")")
        }
        .sheet(isPresented: $isPresented) {
            DocumentPickerView(fileURL: $fileURL)
        }
    }
}

private struct DocumentPickerView: UIViewControllerRepresentable {
    @Binding var fileURL: URL?

    final class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPickerView
    
        init(_ parent: DocumentPickerView) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
            parent.fileURL = url
        }
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let documentPickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.text])
        documentPickerViewController.delegate = context.coordinator
        return documentPickerViewController
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

struct No85_Previews: PreviewProvider {
    static var previews: some View {
        No85()
    }
}
