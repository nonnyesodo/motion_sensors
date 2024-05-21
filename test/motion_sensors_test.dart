import 'package:flutter_test/flutter_test.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:motion_sensors/motion_sensors_platform_interface.dart';
import 'package:motion_sensors/motion_sensors_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMotionSensorsPlatform
    with MockPlatformInterfaceMixin
    implements MotionSensorsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MotionSensorsPlatform initialPlatform = MotionSensorsPlatform.instance;

  test('$MethodChannelMotionSensors is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMotionSensors>());
  });

  test('getPlatformVersion', () async {
    MotionSensors motionSensorsPlugin = MotionSensors();
    MockMotionSensorsPlatform fakePlatform = MockMotionSensorsPlatform();
    MotionSensorsPlatform.instance = fakePlatform;

    expect(await motionSensorsPlugin.getPlatformVersion(), '42');
  });
}
