package com.example.layout

import androidx.anotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.flutterEngine
import io.flutter.plugins.GeneratePluginRegistrant

class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: flutterEngine){
        GeneratePluginRegistrant.registerWith(flutterEngine);
    }
}
