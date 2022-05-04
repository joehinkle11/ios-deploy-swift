import XCTest
@testable import ios_deploy_swift

final class ios_deploy_swiftTests: XCTestCase {
    /// This test should work, just put an absolute path to an app bundle you have. The test will result in a crash though as ios-deploy is meant to stop as an exiting process.
    func testInstallApp() {
        let PATH_TO_YOUR_APP: String = "Example.app"
        
        ios_deploy_swift(args: [
            "--justlaunch",
            "--no-wifi",
            "--bundle",
            PATH_TO_YOUR_APP
        ])
    }
}
