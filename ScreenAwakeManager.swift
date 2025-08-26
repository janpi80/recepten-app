import UIKit
import SwiftUI

/// Beheert of het scherm aan moet blijven of in slaap mag vallen
class ScreenAwakeManager: ObservableObject {
    static let shared = ScreenAwakeManager()
    
    private init() {
        // Observeer wanneer app naar achtergrond gaat
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidEnterBackground),
            name: UIScene.didEnterBackgroundNotification,
            object: nil
        )
    }
    
    /// Houdt het scherm altijd aan
    func keepScreenOn() {
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    /// Laat het scherm weer automatisch uitgaan na inactiviteit
    func allowScreenSleep() {
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    /// Zet altijd terug naar normaal bij achtergrond
    @objc private func appDidEnterBackground() {
        allowScreenSleep()
    }
}
