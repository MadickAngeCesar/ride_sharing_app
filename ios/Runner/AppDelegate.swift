import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Add your Google Maps API Key here
    GMSServices.provideAPIKey("AIzaSyDHyln7nidsQrwjtuKyKyvO41nWt8Rg5aE")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
