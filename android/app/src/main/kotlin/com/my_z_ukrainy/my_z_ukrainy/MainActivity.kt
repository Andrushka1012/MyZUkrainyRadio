package com.my_z_ukrainy.my_z_ukrainy

import android.os.Bundle
import android.os.PersistableBundle
import android.util.Log
import com.google.firebase.messaging.FirebaseMessaging
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onResume() {
        super.onResume()
        val token = FirebaseMessaging.getInstance().token.result

        Log.d("qwe", token)
    }
}
