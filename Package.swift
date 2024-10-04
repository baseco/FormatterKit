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
                "NSBundle+FormatterKit.m"
            ],
            resources: [
                .process("../FormatterKit.bundle")
            ],
            publicHeadersPath: ".",
            cSettings: [
                            .headerSearchPath("include/FormatterKit"),
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // MARK: - Main FormatterKit Target
        .target(
            name: "FormatterKit",
            dependencies: [],
            path: "FormatterKit",


            sources: [
                "TTTAddressFormatter.m",
                "TTTArrayFormatter.m",
                "TTTColorFormatter.m",
                "TTTLocationFormatter.m",
                "TTTNameFormatter.m",
                "TTTOrdinalNumberFormatter.m",
                "TTTTimeIntervalFormatter.m",
                "TTTURLRequestFormatter.m",
                "TTTUnitOfInformationFormatter.m",

            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include/FormatterKit"),
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
