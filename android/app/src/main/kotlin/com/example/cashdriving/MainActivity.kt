package com.example.cashdriving

import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "tmap/navigation"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "startTmapNavigation") {
                startTmapNavigation()
                result.success("Navigation Started")
            } else {
                result.notImplemented()
            }
        }
    }

    private fun startTmapNavigation() {
        // Tmap 네비게이션 Activity를 실행하는 코드
        val intent = Intent(this, TmapActivity::class.java)
        startActivity(intent)
    }
}
