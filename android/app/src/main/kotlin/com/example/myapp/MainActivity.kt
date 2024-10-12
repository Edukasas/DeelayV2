package com.example.myapp

import android.content.Intent
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.content.pm.ResolveInfo
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.util.Base64
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import android.graphics.Canvas

class MainActivity : FlutterActivity() {
    private val CHANNEL = "app_retriever"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getAllApps") {
                val apps = getInstalledApps()
                result.success(apps)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getInstalledApps(): List<Map<String, Any>> {
        val packageManager: PackageManager = this.packageManager
        val apps = mutableListOf<Map<String, Any>>()

        val installedApplications: List<ApplicationInfo> = packageManager.getInstalledApplications(PackageManager.GET_META_DATA)

        for (appInfo in installedApplications) {
            if (isLaunchableApp(appInfo)) {
                val appName = packageManager.getApplicationLabel(appInfo).toString()
                val packageName = appInfo.packageName
                val icon = getAppIconAsBase64(appInfo) ?: "" // Provide a default value if null
                apps.add(mapOf("name" to appName, "packageName" to packageName, "icon" to icon))
            }
        }

        return apps
    }

    private fun getAppIconAsBase64(appInfo: ApplicationInfo): String? {
        val packageManager: PackageManager = this.packageManager
        val drawable: Drawable = packageManager.getApplicationIcon(appInfo)
        val bitmap = drawableToBitmap(drawable)

        // Convert Bitmap to Base64
        val stream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
        val byteArray = stream.toByteArray()
        return Base64.encodeToString(byteArray, Base64.DEFAULT)
    }

    private fun drawableToBitmap(drawable: Drawable): Bitmap {
        return if (drawable is BitmapDrawable) {
            drawable.bitmap
        } else {
            val bitmap = Bitmap.createBitmap(drawable.intrinsicWidth, drawable.intrinsicHeight, Bitmap.Config.ARGB_8888)
            val canvas = Canvas(bitmap)
            drawable.setBounds(0, 0, canvas.width, canvas.height)
            drawable.draw(canvas)
            bitmap
        }
    }

    private fun isLaunchableApp(appInfo: ApplicationInfo): Boolean {
        val intent = Intent(Intent.ACTION_MAIN, null)
        intent.addCategory(Intent.CATEGORY_LAUNCHER)

        val launchableActivities: List<ResolveInfo> = packageManager.queryIntentActivities(intent, 0)

        return launchableActivities.any { it.activityInfo.packageName == appInfo.packageName }
    }
}
