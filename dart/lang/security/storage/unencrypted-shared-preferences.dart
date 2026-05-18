import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthCache {
  final SharedPreferences prefs;
  AuthCache(this.prefs);

  Future<bool> saveToken(String token) {
    // ruleid: unencrypted-shared-preferences
    return prefs.setString('auth_token', token);
  }

  Future<bool> savePassword(String pw) {
    // ruleid: unencrypted-shared-preferences
    return prefs.setString('user_password', pw);
  }

  Future<bool> saveJwt(String jwt) {
    // ruleid: unencrypted-shared-preferences
    return prefs.setString('jwt', jwt);
  }

  Future<bool> saveApiKey(String key) {
    // ruleid: unencrypted-shared-preferences
    return prefs.setString('api_key', key);
  }

  Future<bool> saveSecret(String s) {
    // ruleid: unencrypted-shared-preferences
    return prefs.setString('client_secret', s);
  }

  Future<bool> saveBearer(String b) {
    // ruleid: unencrypted-shared-preferences
    return prefs.setString('bearer_token', b);
  }

  Future<bool> saveRefresh(String r) {
    // ruleid: unencrypted-shared-preferences
    return prefs.setString('refresh_token', r);
  }

  Future<bool> saveSession(int s) {
    // ruleid: unencrypted-shared-preferences
    return prefs.setInt('session_id', s);
  }

  Future<bool> saveAuthFlag(bool b) {
    // ruleid: unencrypted-shared-preferences
    return prefs.setBool('is_authenticated', b);
  }

  Future<bool> saveTheme(String theme) {
    // ok: unencrypted-shared-preferences
    return prefs.setString('theme', theme);
  }

  Future<bool> saveLastViewedId(int id) {
    // ok: unencrypted-shared-preferences
    return prefs.setInt('last_viewed_id', id);
  }

  Future<bool> saveOnboardingDone(bool done) {
    // ok: unencrypted-shared-preferences
    return prefs.setBool('onboarding_done', done);
  }

  Future<void> saveTokenSecurely(String token) {
    final secure = FlutterSecureStorage();
    // ok: unencrypted-shared-preferences
    return secure.write(key: 'auth_token', value: token);
  }
}
