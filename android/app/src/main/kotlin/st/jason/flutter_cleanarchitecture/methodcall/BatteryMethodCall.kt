package st.jason.flutter_cleanarchitecture.methodcall

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import st.jason.flutter_cleanarchitecture.data.repository.GetBatteryRepository

class BatteryMethodCall(var getBatteryRepository: GetBatteryRepository) : MethodChannel.MethodCallHandler {


    companion object {
        const val METHOD_NAME = "queryBatteryLevel"
        const val CHANNEL_NAME = "flutter_cleanarchitecture/method_channel/battery";
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == METHOD_NAME) {
            val level = getBatteryRepository.getBatteryLevel()
            if (level != -1) {
                result.success(level)
            } else {
                result.error("UNAVAILABLE", "Battery level not available.", null);
            }
        } else {
            result.notImplemented()
        }
    }

}