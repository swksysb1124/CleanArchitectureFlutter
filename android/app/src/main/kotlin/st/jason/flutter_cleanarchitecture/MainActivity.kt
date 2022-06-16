package st.jason.flutter_cleanarchitecture

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import st.jason.flutter_cleanarchitecture.data.repository.GetBatteryRepository
import st.jason.flutter_cleanarchitecture.methodcall.BatteryMethodCall

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val binaryMessenger = flutterEngine.dartExecutor.binaryMessenger
        MethodChannel(binaryMessenger, BatteryMethodCall.CHANNEL_NAME)
                .setMethodCallHandler(BatteryMethodCall(GetBatteryRepository(this)))
    }
}
