# Keep Stripe SDK classes
-keep class com.stripe.android.** { *; }
-dontwarn com.stripe.android.**

# Keep React Native Stripe SDK classes
-keep class com.reactnativestripesdk.** { *; }
-dontwarn com.reactnativestripesdk.**

# Prevent R8 from removing required classes or annotations
-keepattributes *Annotation*
-keepclassmembers class ** {
    @androidx.annotation.Keep *;
}
-keepnames class * {
    @androidx.annotation.Keep *;
}

# Ensure required classes and methods are not removed
-keep public class * {
    public protected *;
}

# Avoid obfuscation of Kotlin synthetic methods
-keepclassmembers class ** {
    synthetic *;
}

# Avoid warnings related to missing classes
-dontwarn okhttp3.**
-dontwarn javax.annotation.**
-dontwarn org.codehaus.mojo.**
