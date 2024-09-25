// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "FormatterKit",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
        .watchOS(.v2),
        .tvOS(.v9)
    ],
    products: [
        // Main FormatterKit library encompassing all functionalities
        .library(
            name: "FormatterKit",
            targets: ["FormatterKit"]
        ),
         .library(
            name: "FormatterKitResources",
            targets: ["FormatterKitResources"]
        )
    ],
    dependencies: [
        // No external dependencies
    ],
    targets: [
        // MARK: - Resources Target
        .target(
            name: "FormatterKitResources",
            path: "FormatterKit",
            sources: [
                "NSBundle+FormatterKit.h",
                "NSBundle+FormatterKit.m"
            ],
            resources: [
                .process("../FormatterKit.bundle")
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // MARK: - Main FormatterKit Target
        .target(
            name: "FormatterKit",
            dependencies: [],
            path: "FormatterKit",


            sources: [
                "TTTAddressFormatter.h",
                "TTTAddressFormatter.m",
                "TTTArrayFormatter.h",
                "TTTArrayFormatter.m",
                "TTTColorFormatter.h",
                "TTTColorFormatter.m",
                "TTTLocationFormatter.h",
                "TTTLocationFormatter.m",
                "TTTNameFormatter.h",
                "TTTNameFormatter.m",
                "TTTOrdinalNumberFormatter.h",
                "TTTOrdinalNumberFormatter.m",
                "TTTTimeIntervalFormatter.h",
                "TTTTimeIntervalFormatter.m",
                "TTTURLRequestFormatter.h",
                "TTTURLRequestFormatter.m",
                "TTTUnitOfInformationFormatter.h",
                "TTTUnitOfInformationFormatter.m",

            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
