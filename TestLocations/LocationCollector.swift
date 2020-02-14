import CoreLocation

final class LocationCollector: NSObject, CLLocationManagerDelegate {
    static let shared = LocationCollector()

    private let manager = CLLocationManager()

    func start() {
        self.manager.delegate = self
        self.manager.requestWhenInUseAuthorization()

        /// Settings
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.activityType = .other
        self.manager.allowsBackgroundLocationUpdates = true
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }

        let floorString = location.floor.map { String($0.level) } ?? "No floor."
        print("[Debug] floor: \(floorString)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.manager.startUpdatingLocation()
    }
}
