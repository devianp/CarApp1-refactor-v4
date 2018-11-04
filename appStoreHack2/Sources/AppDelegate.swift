
import UIKit

@UIApplicationMain final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions options: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = UINavigationController(rootViewController: FeaturedCarsViewController())
        self.window!.makeKeyAndVisible()
        return true
    }
}
