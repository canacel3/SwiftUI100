//
//  No81.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/12.
//

import MapKit
import SwiftUI

private protocol LocationSelecterViewDelegate: AnyObject {
    func locationDidSet(location: CLLocationCoordinate2D)
}

private final class UILocationSelecterView: UIView {
    var locationLimit: Int?
    private lazy var mapView = MKMapView()
    weak var delegate: LocationSelecterViewDelegate?
    
    private let verticalLine = CAShapeLayer()
    private let horizontalLine = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mapView.delegate = self
        addSubview(mapView)
        
        verticalLine.fillColor = nil
        verticalLine.opacity = 1.0
        verticalLine.strokeColor = UIColor.black.cgColor
        layer.addSublayer(verticalLine)
        
        horizontalLine.fillColor = nil
        horizontalLine.opacity = 1.0
        horizontalLine.strokeColor = UIColor.black.cgColor
        layer.addSublayer(horizontalLine)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mapView.frame =  CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
                
        let verticalLinePath = UIBezierPath()
        verticalLinePath.move(to: CGPoint(x: (bounds.width / 2) - 50, y: bounds.height / 2))
        verticalLinePath.addLine(to: CGPoint(x: (bounds.width / 2) + 50, y: bounds.height / 2))
        verticalLine.path = verticalLinePath.cgPath
        
        let horizontalLinePath = UIBezierPath()
        horizontalLinePath.move(to: CGPoint(x: bounds.width / 2, y: (bounds.height / 2) - 50))
        horizontalLinePath.addLine(to: CGPoint(x: bounds.width / 2, y: (bounds.height / 2) + 50))
        horizontalLine.path = horizontalLinePath.cgPath
    }
}

extension UILocationSelecterView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let location = CLLocationCoordinate2D(latitude: mapView.region.center.latitude, longitude: mapView.region.center.longitude)
        delegate?.locationDidSet(location: location)
    }
}

private struct LocationSelecterView: UIViewRepresentable {
    let locationDidSet: (_ location: CLLocationCoordinate2D) -> Void
    final class Coordinator: NSObject, LocationSelecterViewDelegate {
        private var mapView: LocationSelecterView
        let locationDidSet: (_ location: CLLocationCoordinate2D) -> Void
        
        init(_ mapView: LocationSelecterView, locationDidSet: @escaping (_ location: CLLocationCoordinate2D) -> Void) {
            self.mapView = mapView
            self.locationDidSet = locationDidSet
        }
        
        func locationDidSet(location: CLLocationCoordinate2D) {
            locationDidSet(location)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, locationDidSet: locationDidSet)
    }
    
    func makeUIView(context: Context) -> UILocationSelecterView {
        let locationsSelectView = UILocationSelecterView()
        locationsSelectView.delegate =  context.coordinator
        return locationsSelectView
    }
    
    func updateUIView(_ uiView: UILocationSelecterView, context: Context) {}
}

struct No81: View {
    @State private var location: CLLocationCoordinate2D?
    @State private var locations: [CLLocationCoordinate2D] = []
    @State private var isPresented: Bool = false
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LocationSelecterView() { location in
                self.location = location
            }
            HStack {
                VStack(alignment: .leading) {
                    if let location = location {
                        Text("lat: \(location.latitude)")
                        Text("long: \(location.longitude)")
                    }
                }
                Spacer()
                Button("Clear") {
                    locations = []
                }
                .foregroundColor(.red)
                Button("Add") {
                    if let location = location {
                        locations.append(location)
                    }
                }
                .foregroundColor(.orange)
                Button("List") {
                    isPresented.toggle()
                }
                .foregroundColor(.purple)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 60)
        }
        .sheet(isPresented: $isPresented) {
            No81_2(locations: $locations)
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct No81_2: View {
    @Binding var locations: [CLLocationCoordinate2D]
    var body: some View {
        List {
            ForEach(0..<locations.count, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text("lat: \(locations[index].latitude.description)")
                    Text("lon: \(locations[index].longitude.description)")
                }
            }
        }
    }
}

struct No81_Previews: PreviewProvider {
    static var previews: some View {
        No81()
    }
}
