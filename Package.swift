// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Amplitude",
    platforms: [
        .iOS(.v10),
        .tvOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(name: "Amplitude", targets: ["Amplitude"]),
    ],
    targets: [
        .target(
            name: "Amplitude",
            path: "Sources/Amplitude",
            exclude: {
              var exclude: [String] = ["AppledocSettings.plist"]
              if #available(macOS 10.10, tvOS 9.0, *) {
              // #if !canImport(UIKit)
                exclude.append("AMPBubbleView.h")
                exclude.append("AMPBubbleView.m")
                exclude.append("AMPEventExplorer.h")
                exclude.append("AMPEventExplorer.m")
                exclude.append("AMPInfoViewController.h")
                exclude.append("AMPInfoViewController.m")
              // #endif
              }
              return exclude
            }(),
            resources: {
              if #available(macOS 10.10, tvOS 9.0, *) {
              // #if !canImport(UIKit)
                return nil
              // #endif
              }
                return [
                  .process("Resources/AMPBubbleView.xib"),
                  .process("Resources/AMPInfoViewController.xib"),
                  .process("Resources/cancel.png"),
                  .process("Resources/cancel@2x.png"),
                  .process("Resources/cancel@3x.png"),
                  .process("Resources/ComodoRsaDomainValidationCA.der"),
                  .process("Resources/logo-banner.png"),
                  .process("Resources/logo-banner@2x.png"),
                  .process("Resources/logo-banner@3x.png"),
                  .process("Resources/logo-button.png"),
                  .process("Resources/logo-button@2x.png"),
                  .process("Resources/logo-button@3x.png")
                  // file:///Users/johntran/Projects/Amplitude-iOS/.git/
                  // macOS-tvOS-disable-event-explorer
                ]
            }(),
            publicHeadersPath: ".")
    ]
)
