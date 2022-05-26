import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var email=""
    var password=""
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let Channel = FlutterMethodChannel(name: "com.sample.shicmts",
                                              binaryMessenger: controller.binaryMessenger)
    let batteryChannel = FlutterMethodChannel(name: "com.shicmts.flutter_sample_app/tab2",
                                              binaryMessenger: controller.binaryMessenger)

    Channel.setMethodCallHandler({
  [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
  // Note: this method is invoked on the UI thread.
    guard call.method == "getUserList" else {
        result(FlutterMethodNotImplemented)
        return
  }
        guard let args = call.arguments as? [String : Any] else {return}
        self?.email = args["email"] as! String
        self?.password = args["password"] as! String
        self?.receiveUserList(result: result)
})

batteryChannel.setMethodCallHandler({
  [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
  // Note: this method is invoked on the UI thread.
  guard call.method == "getBatteryLevel" else {
    result(FlutterMethodNotImplemented)
    return
  }
  self?.receiveBatteryLevel(result: result)
})


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func receiveUserList(result: FlutterResult) {
        if(email=="aaa" && password=="aaa"){
            result("100")
        }
    }

    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNAVAILABLE",
                        message: "Battery info unavailable",
                        details: nil))
      } else {
        result(Int(device.batteryLevel * 100))
      }
    }

}
