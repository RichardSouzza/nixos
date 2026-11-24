let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/d4f25a3e562008648d45bcf2d70bcc7422cad84e.tar.gz";
    sha256 = "sha256-x9sADJvoVG0L6RejZB+/BB4YiGZFBZrfTlhF4uBq1tQ=";
  };
  pkgs = import nixpkgs {
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
    overlays = [];
  };

  nixpkgsFlutter = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgsFlutter = import nixpkgsFlutter { config = {}; overlays = []; };

  withEmulator = false;

  buildToolsVersion = "36.0.0";

  composeAndroid = pkgs.androidenv.composeAndroidPackages {
    platformVersions = [ "34" "35" "36" ];
    buildToolsVersions = [ buildToolsVersion ];
    includeNDK = true;
    ndkVersions = [ "28.2.13676358" ];
    cmakeVersions = [ "3.22.1" ];
    includeEmulator = withEmulator;
    includeSystemImages = withEmulator;
    systemImageTypes = [ "google_apis" ];
    abiVersions = [ "x86_64" ];
  };

  androidSdk = composeAndroid.androidsdk;
  androidRoot = "${androidSdk}/libexec/android-sdk";

in
pkgs.mkShellNoCC {
  packages = [
    androidSdk
    pkgsFlutter.flutter
    pkgs.jdk21
    pkgs.nodejs
  ];


  shellHook = ''
    export ANDROID_HOME=${androidRoot}
    export ANDROID_SDK_ROOT=${androidRoot}
    export JAVA_HOME=${pkgs.jdk21}

    export GRADLE_OPTS="-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidRoot}/build-tools/${buildToolsVersion}/aapt2"

    export PATH=$HOME/.pub-cache/bin:$PATH
  '';
}
