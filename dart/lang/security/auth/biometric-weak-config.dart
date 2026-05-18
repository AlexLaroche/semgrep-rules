import 'package:local_auth/local_auth.dart';

class Authenticator {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticateWithFallback() {
    return auth.authenticate(
      localizedReason: 'Please authenticate to continue',
      // ruleid: biometric-weak-config
      options: const AuthenticationOptions(biometricOnly: false),
    );
  }

  Future<bool> authenticateExplicitFallback() {
    return auth.authenticate(
      localizedReason: 'Confirm payment',
      // ruleid: biometric-weak-config
      options: const AuthenticationOptions(
        biometricOnly: false,
        stickyAuth: true,
      ),
    );
  }

  Future<bool> authenticateBiometricOnly() {
    return auth.authenticate(
      localizedReason: 'Confirm payment',
      // ok: biometric-weak-config
      options: const AuthenticationOptions(biometricOnly: true),
    );
  }

  Future<bool> authenticateBiometricOnlySticky() {
    return auth.authenticate(
      localizedReason: 'Confirm payment',
      // ok: biometric-weak-config
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );
  }
}
