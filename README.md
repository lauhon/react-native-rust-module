# react-native-rust-module

Boilerplate to create react native modules relying on rust

# Instructions

In the Example is a react native project that is configured to automatically consume a react-native-rust module that provides
a helloWorld method which will call rust a rust library in both android and ios.

The rust library can be found in the rust/signer/src/lib.rs file

## Requirements

Node - tested on 16
Android Toolchain (Android Studio)
iOs Toolchain (xCode)
Rust Toolchain - Cargo, rustup... (https://rustup.rs/ to get started)

### Install Node Modules

1. `yarn` or `npm i`
2. `cd example`

## iOs

To Perform changes and run those in ios follow these steps

1. `yarn` or `npm i`
2. `cd /ios`
3. `pod install`

### Change Rust

1. modify lib.rs (if you add extra methods you also have to edit the signer.h file)
2. `cd rust/signer` and `make ios` - this will create a new file libsigner.a in the rust/signer directory
3. replace the old libsigner.a in ios/libs with the generated file
4. Run the app (in xcode or with `npm run ios`)

## Android

To Perform changes and run those in ios follow these steps

### Change Rust

1. modify lib.rs (if you add extra methods you also have to edit the signer.h file)
2. `cd rust/signer` and `make android` - this will create a new file libsigner.a in the rust/signer directory
3. `make android` will also have started the script `copy_android` which should have copied the rust compilation results into
   the java project.

(If the `make android` command throws an error that is complaining about missing -lgcc look at [this issue](https://github.com/fzyzcjy/flutter_rust_bridge/issues/419) ) 4. Run the app (in Android studio or with `npm run android`)

# Kudos

Heavily inspired by

https://github.com/paritytech/parity-signer/tree/legacy-4.5.3
https://robertohuertas.com/2019/10/27/rust-for-android-ios-flutter/
