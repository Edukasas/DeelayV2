package com.example.myapp

import android.content.Intent
import android.app.AppOpsManager
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.util.Base64
import android.app.usage.UsageStats
import android.app.usage.UsageStatsManager
import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.util.Calendar
import android.graphics.Canvas

class MainActivity : FlutterActivity() {
    private val CHANNEL = "app_retriever"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
    when (call.method) {
        "getAppUsageStats" -> {
            val args = call.arguments as Map<String, Long>
            val startDate = args["startDate"] ?: 0
            val endDate = args["endDate"] ?: 0
            if (checkUsageStatsPermission()) {
                val usageStats = getAppUsageStats(startDate, endDate)
                result.success(usageStats)
            } else {
                requestUsageStatsPermission()
                result.success(null)
            }
        }
        else -> result.notImplemented()
    }
}

    }

    private fun getAppUsageStats(startDate: Long, endDate: Long): List<Map<String, Any>>? {
    val usageStatsManager = getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager

    val usageStatsList: List<UsageStats> = usageStatsManager.queryUsageStats(
        UsageStatsManager.INTERVAL_DAILY,
        startDate,
        endDate
    )

    val installedApps = getInstalledApps().map { it["packageName"] as String }

    val usageData = mutableListOf<Map<String, Any>>()

    for (usageStats in usageStatsList) {
        if (installedApps.contains(usageStats.packageName)) {
            val appName = packageManager.getApplicationLabel(
                packageManager.getApplicationInfo(usageStats.packageName, PackageManager.GET_META_DATA)
            ).toString()

            val usageMap = mapOf(
                "packageName" to usageStats.packageName,
                "appName" to appName,
                "totalTimeForeground" to usageStats.totalTimeInForeground
            )

            usageData.add(usageMap)
        }
    }

    return usageData
}


    private fun getInstalledApps(): List<Map<String, Any>> {
        val packageManager: PackageManager = this.packageManager
        val apps = mutableListOf<Map<String, Any>>()

        val launchIntent = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
        val launchableApps = packageManager.queryIntentActivities(launchIntent, PackageManager.GET_META_DATA)
        
        for (resolveInfo in launchableApps) {
            val appInfo = resolveInfo.activityInfo.applicationInfo
            val appName = packageManager.getApplicationLabel(appInfo).toString()
            val packageName = appInfo.packageName
            val icon = getAppIconAsBase64(appInfo) ?: "" 

            apps.add(mapOf("name" to appName, "packageName" to packageName, "icon" to icon))
        }

        return apps
    }

    private fun getAppIconAsBase64(appInfo: ApplicationInfo): String? {
        val packageManager: PackageManager = this.packageManager
        val drawable: Drawable = packageManager.getApplicationIcon(appInfo)
        val bitmap = drawableToBitmap(drawable)

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
    
    private fun checkUsageStatsPermission(): Boolean {
    val packageManager = packageManager
    val appOps = getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
    val mode = appOps.checkOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, 
                                       android.os.Process.myUid(), 
                                       packageName)

    return mode == AppOpsManager.MODE_ALLOWED
    }

    private fun requestUsageStatsPermission() {
        val intent = Intent(android.provider.Settings.ACTION_USAGE_ACCESS_SETTINGS)
        startActivity(intent)
    }
}