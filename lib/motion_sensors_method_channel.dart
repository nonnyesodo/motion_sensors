import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'motion_sensors_platform_interface.dart';

/// An implementation of [MotionSensorsPlatform] that uses method channels.
class MethodChannelMotionSensors extends MotionSensorsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('motion_sensors');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
