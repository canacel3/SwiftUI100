//
//  No50.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import MapKit
import SwiftUI
import UIKit

protocol TappableMapViewDelegate: AnyObject {
    func mapViewDidTap(location: CLLocationCoordinate2D)
}

final class TappableMapView: UIView {
    private lazy var mapView = MKMapView()
    weak var delegate: TappableMapViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.addTarget(self, action: #selector(onTap(sender:)))

        mapView.addGestureRecognizer(tapGestureRecognizer)
        self.backgroundColor = .red
        addSubview(mapView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        mapView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }

    @objc func onTap(sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: mapView)
        let location = mapView.convert(tapPoint, toCoordinateFrom: mapView)
        delegate?.mapViewDidTap(location: location)
    }

    func addAnnotation(_ annotation: MKAnnotation) {
        mapView.addAnnotation(annotation)
    }
}

private struct MapView: UIViewRepresentable {
    @Binding var locations: [CLLocationCoordinate2D]
    let mapViewDidTap: (_ location: CLLocationCoordinate2D) -> Void
    final class Coordinator: NSObject, TappableMapViewDelegate {
        private var mapView: MapView
        let mapViewDidTap: (_ location: CLLocationCoordinate2D) -> Void

        init(_ mapView: MapView, mapViewDidTap: @escaping (_ location: CLLocationCoordinate2D) -> Void) {
            self.mapView = mapView
            self.mapViewDidTap = mapViewDidTap
        }

        func mapViewDidTap(location: CLLocationCoordinate2D) {
            mapViewDidTap(location)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, mapViewDidTap: mapViewDidTap)
    }

    func makeUIView(context: Context) -> TappableMapView {
        let mapView = TappableMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: TappableMapView, context: Context) {
        for location in locations {
            let annotation = MKPointAnnotation()
            let centerCoordinate = location
            annotation.coordinate = centerCoordinate
            annotation.title = "latitude: \(location.latitude), longitude: \(location.longitude)"
            uiView.addAnnotation(annotation)
        }
    }
}

struct No50: View {
    @State private var selectedLocation: CLLocationCoordinate2D?
    @State private var locations: [CLLocationCoordinate2D] = []
    @State private var isShowingAlert: Bool = false
    @State private var alertEntity: AlertEntity?
    struct AlertEntity {
        let title: String
        let message: String
        let actionText: String
    }

    var body: some View {
        MapView(locations: $locations) { location in
            selectedLocation = location
            isShowingAlert = true
            alertEntity = AlertEntity(title: "",
                                      message: "latitude: \(selectedLocation?.latitude ?? -1), longitude: \(selectedLocation?.longitude ?? -1)",
                                      actionText: "OK")
        }
        .onAppear {
            let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(34.6432), longitude: CLLocationDegrees(134.9976))
            locations.append(location)
        }
        .alert(alertEntity?.title ?? "",
               isPresented: $isShowingAlert,
               presenting: alertEntity) { entity in
            Button(entity.actionText) {
                guard let location = selectedLocation else { return }
                addLocation(location: location)
            }
        } message: { entity in
            Text(entity.message)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .ignoresSafeArea(.all, edges: .all)
    }

    private func addLocation(location: CLLocationCoordinate2D) {
        locations.append(location)
    }
}

struct No50_Previews: PreviewProvider {
    static var previews: some View {
        No50()
    }
}
