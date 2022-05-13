package com.my_z_ukrainy.my_z_ukrainy

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Intent
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat
import com.cis.myzukrainy.R
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import java.net.URL


class FirebaseMessageService : FirebaseMessagingService() {
    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        val notification = remoteMessage.notification
        addNotification(notification?.title, notification?.body, notification?.imageUrl)
    }

    private fun addNotification(title: String?, message: String?, imageUrl: Uri?) {

        val mBuilder = NotificationCompat.Builder(applicationContext, "notify_001")
        val ii: Intent = Intent(
            applicationContext,
            MainActivity::class.java
        )
        val pendingIntent = PendingIntent.getActivity(
            this,
            0,
            ii,
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
        )

        mBuilder.setContentIntent(pendingIntent)
            .setSmallIcon(R.mipmap.ic_launcher_round)
            .setContentTitle(title)
            .setContentText(message)
            .priority = NotificationCompat.PRIORITY_MAX


        try {
            val bitmap = BitmapFactory.decodeStream(URL(imageUrl?.toString()).openStream())
            mBuilder.setLargeIcon(bitmap)
            mBuilder.setStyle(NotificationCompat.BigPictureStyle().bigPicture(bitmap))
        } catch (e: Exception) {
            Log.d("qwe", e.toString())
        }

        val mNotificationManager: NotificationManager =
            getSystemService(NOTIFICATION_SERVICE) as NotificationManager


        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channelId = "nadejeMy_chanel"
            val channel = NotificationChannel(
                channelId,
                "Channel human readable title",
                NotificationManager.IMPORTANCE_HIGH
            )
            mNotificationManager.createNotificationChannel(channel)
            mBuilder.setChannelId(channelId)
        }

        mNotificationManager.notify(0, mBuilder.build())
    }

    override fun onNewToken(token: String) {
        super.onNewToken(token)
        Log.d("qwe", token)
    }

}