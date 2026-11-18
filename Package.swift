// swift-tools-version:5.9
import PackageDescription

// Same sources as CocoaSecurity 1.2.4 podspec, Base64 is compiled from the submodule
let package = Package(
    name: "CocoaSecurity",
    platforms: [.iOS(.v12), .macOS(.v10_13), .tvOS(.v12)],
    products: [
        .library(name: "CocoaSecurity", targets: ["CocoaSecurity"])
    ],
    targets: [
        .target(
            name: "CocoaSecurity",
            path: ".",
            // SwiftPM picks xibs and lproj folders under the target path as resources even outside of sources
            exclude: [
                "CocoaSecurity.xcodeproj",
                "CocoaSecurityTests",
                "submodules/Base64/Tests",
                "submodules/xctool"
            ],
            sources: [
                "CocoaSecurity/CocoaSecurity.m",
                "submodules/Base64/Base64/Base64.m"
            ],
            // Symlink to CocoaSecurity.h, so <CocoaSecurity/CocoaSecurity.h> import resolves as with the framework
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("CocoaSecurity"),
                .headerSearchPath("submodules/Base64/Base64")
            ]
        )
    ]
)
