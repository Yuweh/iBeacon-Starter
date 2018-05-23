

import UIKit
import UserNotifications
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let locationManager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        locationManager.delegate = self
        
        // Request permission to send notifications
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.alert, .sound]) { (granted, error) in }
        
        return true
    }
    
}

// MARK: - CLLocationManagerDelegate
extension AppDelegate: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        guard region is CLBeaconRegion else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "Forget Me Not"
        content.body = "Are you forgetting something?"
        content.sound = .default()
        
        let request = UNNotificationRequest(identifier: "ForgetMeNot", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
