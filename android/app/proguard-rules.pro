# Google Mobile Ads starts WorkManager when the app opens. WorkManager creates
# its Room database by reflection, so R8 has to keep the generated database
# classes and their constructors, or release builds crash on launch.
-keep class * extends androidx.room.RoomDatabase { <init>(); }
-keep class androidx.work.impl.WorkDatabase_Impl { *; }

# WorkManager also creates workers by reflection from their saved class names.
-keep class * extends androidx.work.ListenableWorker {
    public <init>(android.content.Context, androidx.work.WorkerParameters);
}
