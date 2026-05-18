import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenValidator {
  Map<String, dynamic> readClaimsUnverified(String token) {
    // ruleid: jwt-decode-without-verify
    final jwt = JWT.decode(token);
    return jwt.payload as Map<String, dynamic>;
  }

  bool isAdminUnverified(String token) {
    // ruleid: jwt-decode-without-verify
    final claims = JWT.decode(token).payload as Map;
    return claims['role'] == 'admin';
  }

  Map<String, dynamic> decoderPackage(String token) {
    // ruleid: jwt-decode-without-verify
    return JwtDecoder.decode(token);
  }

  Map<String, dynamic>? decoderPackageTry(String token) {
    // ruleid: jwt-decode-without-verify
    return JwtDecoder.tryDecode(token);
  }

  Map<String, dynamic> readClaimsVerified(String token, String secret) {
    // ok: jwt-decode-without-verify
    final jwt = JWT.verify(token, SecretKey(secret));
    return jwt.payload as Map<String, dynamic>;
  }

  Map<String, dynamic> readClaimsTryVerify(String token, String secret) {
    // ok: jwt-decode-without-verify
    final jwt = JWT.tryVerify(token, SecretKey(secret));
    return jwt!.payload as Map<String, dynamic>;
  }

  // JWKS-style verification: decode to read the `kid` header so we know
  // which public key from the key set to use, then verify the SAME raw
  // token against that key. Pattern used by Firebase Admin SDK,
  // googleapis-auth, etc.
  Future<void> verifyWithJwks(String token, Map<String, JWTKey> keys) async {
    // ok: jwt-decode-without-verify
    final jwt = JWT.decode(token);
    final kid = jwt.header?['kid'] as String?;
    if (kid == null) throw Exception('no kid');
    final key = keys[kid];
    if (key == null) throw Exception('no matching key');
    JWT.verify(token, key);
  }

  // Same JWKS pattern, single-line variant: decode result accessed as
  // `.header[...]` directly is unambiguously a key-selection step.
  String? readKidOnly(String token) {
    // ok: jwt-decode-without-verify
    return JWT.decode(token).header?['kid'] as String?;
  }

  String? readAlgOnly(String token) {
    // ok: jwt-decode-without-verify
    return JWT.decode(token).header['alg'] as String?;
  }
}
