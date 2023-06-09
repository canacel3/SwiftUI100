//
//  No84.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

private final class UIImageViewerView: UIView {
    private let imageName: String
    private let scrollView: UIScrollView = UIScrollView()
    private let imageView: UIImageView = UIImageView()

    required init(imageName: String) {
        self.imageName = imageName
        super.init(frame: .zero)
    
        scrollView.delegate = self
        scrollView.maximumZoomScale = 3.0
        scrollView.minimumZoomScale = 1.0
        addSubview(scrollView)

        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = bounds
        imageView.frame = scrollView.frame
    }
}

extension UIImageViewerView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

private struct ImageViewer: UIViewRepresentable {
    let imageName: String

    func makeUIView(context: Context) -> UIImageViewerView {
        let view = UIImageViewerView(imageName: imageName)
        return view
    }

    func updateUIView(_ uiView: UIImageViewerView, context: Context) {}
}

struct No84: View {
    var body: some View {
        ImageViewer(imageName: "cat")
            .ignoresSafeArea(.all, edges: .all)
    }
}

struct No84_Previews: PreviewProvider {
    static var previews: some View {
        No84()
    }
}
