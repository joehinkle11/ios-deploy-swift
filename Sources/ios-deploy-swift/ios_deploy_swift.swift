
import ios_deploy_swift_internal
import Foundation

// Converting Swift strings to c string from https://stackoverflow.com/a/29469618/3902590

/// This will currently crash the process upon ending, but you can call ios-deploy from here.
public func ios_deploy_swift(args: [String]) {
    let argc: CInt = CInt(args.count)
    // Create [UnsafeMutablePointer<Int8>]:
    var cargs = args.map { strdup($0) }
    // Call C function:
    _ = ios_deploy_swift_internal.ios_deploy_main(argc, &cargs)
    // Free the duplicated strings:
    for ptr in cargs { free(ptr) }
}
