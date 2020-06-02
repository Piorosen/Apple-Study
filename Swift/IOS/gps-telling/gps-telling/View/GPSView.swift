//
//  Caller.swift
//  gps-telling
//
//  Created by Aoikazto on 2020/04/23.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI
import MapKit
import CallKit


struct GPSView : UIViewRepresentable {
    let locationManager = CLLocationManager()
    let view = MKMapView()
    
    // 복지관 위치
    let first: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 35.10423636737664, longitude:129.0262232718265),
        CLLocationCoordinate2D(latitude: 35.104308836167235, longitude:129.02646231945062),
        CLLocationCoordinate2D(latitude: 35.10403434782398, longitude:129.02663280774658),
        CLLocationCoordinate2D(latitude: 35.10398818603947, longitude:129.02630517901056)
    ]
    
    // 웅배, 분덕 타이밍
    let second: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 35.10554998986448, longitude:129.02877718334915),
        CLLocationCoordinate2D(latitude: 35.105293326636776, longitude:129.0288748855713),
        CLLocationCoordinate2D(latitude: 35.10535282993796, longitude:129.02919838846827),
        CLLocationCoordinate2D(latitude: 35.105655674507176, longitude:129.0290996006824),
    ]
    
    // 수영
    let third: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 35.107316397675746, longitude:129.03261687058898),
        CLLocationCoordinate2D(latitude: 35.108218713497195, longitude:129.03318240677623),
        CLLocationCoordinate2D(latitude: 35.10772608823759, longitude:129.03384810270495),
        CLLocationCoordinate2D(latitude: 35.10711311029173, longitude:129.03331391099402),
    ]
//
//    // 복희
//    let fours: [CLLocationCoordinate2D] = [
//        CLLocationCoordinate2D(latitude: 35.10912295577515, longitude:129.01810867926406),
//        CLLocationCoordinate2D(latitude: 35.10933492521785, longitude:129.01869888168753),
//        CLLocationCoordinate2D(latitude: 35.109003809320974, longitude:129.0188275915574),
//        CLLocationCoordinate2D(latitude: 35.10878075556617, longitude:129.01813492928775),
//    ]
//
    
    @Binding var createItem:Bool
    
    func makeUIView(context: UIViewRepresentableContext<GPSView>) -> MKMapView {
        view.showsUserLocation = true
        view.userTrackingMode = .followWithHeading
        
        let longtap = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.longTap))
        view.addGestureRecognizer(longtap)
        view.delegate = context.coordinator
        
        view.addOverlay(MKPolygon(coordinates: first, count: 4))
        view.addOverlay(MKPolygon(coordinates: second, count: 4))
        view.addOverlay(MKPolygon(coordinates: third, count: 4))
//        view.addOverlay(MKPolygon(coordinates: fours, count: 4))
        
        locationManager.requestWhenInUseAuthorization()
        
        let zoom = CLLocationCoordinate2D(latitude: 35.10413503762736, longitude: 129.02641886846027)

        let viewRegion = MKCoordinateRegion(center: zoom, latitudinalMeters: 200, longitudinalMeters: 200)
        
        view.setRegion(viewRegion, animated: false)
        
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<GPSView>) {
        if createItem {
            let short = context.coordinator
            
            let polygon = MKPolygon(coordinates: &short.item, count: short.item.count)
            for item in short.item {
                print("\(item.latitude), \(item.longitude)")
            }
            
            short.item.removeAll()
            uiView.addOverlay(polygon)
        }
    }

    class Coordinator : NSObject, MKMapViewDelegate {
        var h = 0
        
        var item = [CLLocationCoordinate2D]()
        
        var control: GPSView

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if overlay is MKPolyline {
                let polylineRenderer = MKPolylineRenderer(overlay: overlay)
                polylineRenderer.strokeColor = .orange
                polylineRenderer.lineWidth = 5
                return polylineRenderer
            } else if overlay is MKPolygon {
                
                let polygonView = MKPolygonRenderer(overlay: overlay)
                polygonView.fillColor = UIColor(displayP3Red: 0.8, green: 0.3, blue: 0.5, alpha: 0.8)
                return polygonView
            }
            return MKPolylineRenderer(overlay: overlay)
        }
        
        init(_ control: GPSView) {
            self.control = control
        }

        @objc func longTap(sender: UIGestureRecognizer){
            
            if sender.state == .ended {
                let locationInView = sender.location(in: control.view)
                let locationOnMap = control.view.convert(locationInView, toCoordinateFrom: control.view)
                print(locationOnMap)
                item.append(locationOnMap)
            }
        }
    }
}
