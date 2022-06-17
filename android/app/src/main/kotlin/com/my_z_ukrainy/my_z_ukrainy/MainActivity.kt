package com.my_z_ukrainy.my_z_ukrainy

import android.util.Log
import com.google.firebase.messaging.FirebaseMessaging
import com.ryanheise.audioservice.AudioServiceActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : AudioServiceActivity() {
    private val notificationChanel: MethodChannel by lazy {
        MethodChannel(
            flutterEngine?.dartExecutor?.binaryMessenger,
            NOTIFICATIONS_CHANEL
        )
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        Log.d("qwe", "configureFlutterEngine")
        FirebaseMessaging.getInstance().setAutoInitEnabled(true)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        notificationChanel.setMethodCallHandler(::handleNotificationsMethods)
    }


    private fun handleNotificationsMethods(methodCall: MethodCall, result: MethodChannel.Result) {
        Log.d("qwe", methodCall.method)
        when (methodCall.method) {
            "setUaTopicEnabled" -> {
                val isEnabled = methodCall.argument<Boolean>("isEnabled")

                if (isEnabled == true) {
                    FirebaseMessaging.getInstance().subscribeToTopic(UA_PUSHES_TOPIC)
                } else {
                    FirebaseMessaging.getInstance().unsubscribeFromTopic(UA_PUSHES_TOPIC)
                }

                result.success(isEnabled)
            }
            else -> result.notImplemented()
        }

    }

    companion object {
        const val NOTIFICATIONS_CHANEL = "com.cis.notification_chanel"
        const val UA_PUSHES_TOPIC = "ua_news"
    }
}
