
import ios_deploy_swift_internal
import Foundation

// Converting Swift strings to c string from https://stackoverflow.com/a/29469618/3902590

public func ios_deploy_swift(args: [String]) -> CInt {
    let argc: CInt = CInt(args.count)
    // Create [UnsafeMutablePointer<Int8>]:
    var cargs = args.map { strdup($0) }
    // Call C function:
    let result: CInt = ios_deploy_swift_internal.ios_deploy_main(argc, &cargs)
    // Free the duplicated strings:
    for ptr in cargs { free(ptr) }
    return result
}
