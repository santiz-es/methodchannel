package com.example.methodchannel

import android.app.AlertDialog
import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.methodchannel/native"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "showToast" -> {
                    val message = call.argument<String>("message") ?: ""
                    Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
                    result.success(null)
                }
                "showAlert" -> {
                    val title = call.argument<String>("title") ?: "Alerta"
                    val message = call.argument<String>("message") ?: ""
                    showNativeAlert(title, message)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun showNativeAlert(title: String, message: String) {
        runOnUiThread {
            AlertDialog.Builder(this)
                .setTitle(title)
                .setMessage(message)
                .setPositiveButton("OK") { dialog, _ -> dialog.dismiss() }
                .show()
        }
    }
}
