//
//  No83.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import PDFKit
import SwiftUI

struct No83: View {
    var body: some View {
        PhotoDetailView(image: UIImage(named: "cat")!)
    }
}

private struct PhotoDetailView: UIViewRepresentable {
    let image: UIImage

    func makeUIView(context: Context) -> PDFView {
        let view = PDFView()
        view.document = PDFDocument()
        guard let page = PDFPage(image: image) else { return view }
        view.document?.insert(page, at: 0)
        view.autoScales = true
        return view
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}

struct No83_Previews: PreviewProvider {
    static var previews: some View {
        No83()
    }
}
