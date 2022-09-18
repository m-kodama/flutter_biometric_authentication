import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> hasEnrolledBiometrics() async {
    final availableBiometrics = await _auth.getAvailableBiometrics();

    print('--- 利用可能な生体認証 ---');
    print(availableBiometrics);

    return availableBiometrics.isNotEmpty;
  }

  Future<bool> authenticate() async {
    return await _auth.authenticate(
      localizedReason: '生誕認証してください',
      options: const AuthenticationOptions(biometricOnly: true),
    );
  }
}
