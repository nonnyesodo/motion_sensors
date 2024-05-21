import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'motion_sensors_method_channel.dart';

abstract class MotionSensorsPlatform extends PlatformInterface {
  /// Constructs a MotionSensorsPlatform.
  MotionSensorsPlatform() : super(token: _token);

  static final Object _token = Object();

  static MotionSensorsPlatform _instance = MethodChannelMotionSensors();

  /// The default instance of [MotionSensorsPlatform] to use.
  ///
  /// Defaults to [MethodChannelMotionSensors].
  static MotionSensorsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MotionSensorsPlatform] when
  /// they register themselves.
  static set instance(MotionSensorsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
