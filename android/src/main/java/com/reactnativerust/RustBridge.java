package com.reactnativerust;

public class RustBridge {
    static {
        System.loadLibrary("signer");
    }

    public static native String helloWorld();
}
