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
        
        // Individual formatter libraries corresponding to subspecs
        .library(
            name: "FormatterKitAddressFormatter",
            targets: ["AddressFormatter"]
        ),
        .library(
            name: "FormatterKitArrayFormatter",
            targets: ["ArrayFormatter"]
        ),
        .library(
            name: "FormatterKitColorFormatter",
            targets: ["ColorFormatter"]
        ),
        .library(
            name: "FormatterKitLocationFormatter",
            targets: ["LocationFormatter"]
        ),
        .library(
            name: "FormatterKitNameFormatter",
            targets: ["NameFormatter"]
        ),
        .library(
            name: "FormatterKitOrdinalNumberFormatter",
            targets: ["OrdinalNumberFormatter"]
        ),
        .library(
            name: "FormatterKitTimeIntervalFormatter",
            targets: ["TimeIntervalFormatter"]
        ),
        .library(
            name: "FormatterKitUnitOfInformationFormatter",
            targets: ["UnitOfInformationFormatter"]
        ),
        .library(
            name: "FormatterKitURLRequestFormatter",
            targets: ["URLRequestFormatter"]
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
                .process("FormatterKit.bundle")
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // MARK: - Main FormatterKit Target
        .target(
            name: "FormatterKit",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                // Include any additional common source files if necessary
                // Currently, all specific functionalities are in subspecs
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // MARK: - Subspec Targets
        
        // AddressFormatter Subspec
        .target(
            name: "AddressFormatter",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                "TTTAddressFormatter.h",
                "TTTAddressFormatter.m"
            ],
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("AddressBook"),
                .linkedFramework("AddressBookUI", .when(platforms: [.iOS, .tvOS]))
            ],
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // ArrayFormatter Subspec
        .target(
            name: "ArrayFormatter",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                "TTTArrayFormatter.h",
                "TTTArrayFormatter.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // ColorFormatter Subspec
        .target(
            name: "ColorFormatter",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                "TTTColorFormatter.h",
                "TTTColorFormatter.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // LocationFormatter Subspec
        .target(
            name: "LocationFormatter",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                "TTTLocationFormatter.h",
                "TTTLocationFormatter.m"
            ],
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("CoreLocation")
            ],
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // NameFormatter Subspec
        .target(
            name: "NameFormatter",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                "TTTNameFormatter.h",
                "TTTNameFormatter.m"
            ],
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("AddressBook", .when(platforms: [.iOS, .tvOS]))
            ],
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // OrdinalNumberFormatter Subspec
        .target(
            name: "OrdinalNumberFormatter",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                "TTTOrdinalNumberFormatter.h",
                "TTTOrdinalNumberFormatter.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // TimeIntervalFormatter Subspec
        .target(
            name: "TimeIntervalFormatter",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                "TTTTimeIntervalFormatter.h",
                "TTTTimeIntervalFormatter.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // UnitOfInformationFormatter Subspec
        .target(
            name: "UnitOfInformationFormatter",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                "TTTUnitOfInformationFormatter.h",
                "TTTUnitOfInformationFormatter.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        ),
        
        // URLRequestFormatter Subspec
        .target(
            name: "URLRequestFormatter",
            dependencies: ["FormatterKitResources"],
            path: "FormatterKit",
            sources: [
                "TTTURLRequestFormatter.h",
                "TTTURLRequestFormatter.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("CLANG_MODULES_AUTOLINK", to: "YES")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
