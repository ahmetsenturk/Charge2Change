//
//  MapView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI
import MapKit
import Foundation
import CoreLocation

class CustomAnnotation: NSObject, MKAnnotation, Identifiable {
    let stepPoint: StepPoint
    var coordinate: CLLocationCoordinate2D {
        return stepPoint.location.coordinate
    }
    
    init(step: StepPoint) {
        self.stepPoint = step
    }
}

protocol StepPoint {
    var location: CLLocation { get }
    var name: String { get }

    init(location: CLLocation, name: String)
}

struct EcurbPinView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 25)
                .overlay(Circle().stroke(Color.red, lineWidth: 4))
                .background(Color.clear)
            
            HStack {
                Image(systemName: "bolt.batteryblock")
                    .frame(width: 12, height: 12)
                    .foregroundColor(.blue)
                
                Text("9 km away")
                    .bold()
                    .font(.system(size: 12))
            }
            .foregroundColor(.blue)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .frame(width: 105, height: 105) // Set a fixed size for the view
    }
}

struct MapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D
    @Binding var annotations: [CustomAnnotation] // Use CustomAnnotation instead of MKPointAnnotation

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        uiView.setRegion(region, animated: true)
        
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? CustomAnnotation else {
                return nil
            }
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom") as? MKMarkerAnnotationView
            
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "custom")
                annotationView?.glyphImage = UIImage(systemName: "bolt.fill") // Set the marker icon
                let randomBool = Bool.random()
                if randomBool {
                    annotationView?.markerTintColor = .blue
                } else {
                    annotationView?.markerTintColor = .gray
                }
                annotationView?.canShowCallout = true // Enable callout
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
    }
}

struct ContentViewNew: View {
    @State private var annotations: [CustomAnnotation] = [] // Use CustomAnnotation instead of MKPointAnnotation
    let munichCoordinate = CLLocationCoordinate2D(latitude: 48.1351, longitude: 11.5820)

    var body: some View {
        MapView(coordinate: munichCoordinate, annotations: $annotations)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                let location = CLLocation(latitude: munichCoordinate.latitude, longitude: munichCoordinate.longitude)
                let step = CustomStepPoint(location: location, name: "Munich") // Create a CustomStepPoint
                let annotation = CustomAnnotation(step: step)
                annotations.append(annotation)
                
                // Add additional random annotations
                let numberOfAnnotations = 5
                for _ in 0..<numberOfAnnotations {
                    let randomCoordinate = generateRandomCoordinate(center: munichCoordinate, radius: 5000) // Adjust the radius as needed
                    let randomLocation = CLLocation(latitude: randomCoordinate.latitude, longitude: randomCoordinate.longitude)
                    let randomStep = CustomStepPoint(location: randomLocation, name: "Random Location")
                    let randomAnnotation = CustomAnnotation(step: randomStep)
                    annotations.append(randomAnnotation)
                }
            }
    }
    
    // Helper function to generate random coordinates around a center point
    func generateRandomCoordinate(center: CLLocationCoordinate2D, radius: Double) -> CLLocationCoordinate2D {
        let randomRadius = Double.random(in: 0..<radius)
        let randomAngle = Double.random(in: 0..<(2.0 * .pi))
        let x = randomRadius * cos(randomAngle)
        let y = randomRadius * sin(randomAngle)
        let randomCoordinate = CLLocationCoordinate2D(latitude: center.latitude + x / 111_111,
                                                     longitude: center.longitude + y / (111_111 * cos(center.latitude * .pi / 180)))
        return randomCoordinate
    }
}

// Custom implementation of StepPoint conforming to the protocol
struct CustomStepPoint: StepPoint {
    var location: CLLocation
    var name: String

    init(location: CLLocation, name: String) {
        self.location = location
        self.name = name
    }
}
