import 'dart:developer';

import 'package:boilerplate/core/utils/secure_storage_util.dart';
import 'package:platform_device_id/platform_device_id.dart';

class DeviceHelper {
  Future<void> initialId() async {
    try {
      final data = SecureStorageUtil();
      if ((getId() == "")) return;
      String? deviceId = await PlatformDeviceId.getDeviceId;
      await data.writeString(
        SecureStorageUtil.keyDeviceId,
        deviceId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      );
    } catch (e) {
      log("Error : MyDevice.setId $e");
    }
  }

  Future<String> getId() async {
    final data = SecureStorageUtil();
    log("DEVICEID : ${data.readString(SecureStorageUtil.keyDeviceId)}");
    return await data.readString(SecureStorageUtil.keyDeviceId) ?? "";
  }
}
