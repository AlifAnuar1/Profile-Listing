// Top-level build file where you can add configuration options common to all sub-projects/modules.
buildscript {
    repositories {
        google() // Add Google's Maven repository
        mavenCentral() // Add Maven Central repository
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.1.0") // Correct syntax for declaring classpath
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}