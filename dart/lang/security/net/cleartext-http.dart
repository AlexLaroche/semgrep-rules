import 'dart:io';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<String> fetchInsecure() async {
    // ruleid: cleartext-http
    final res = await http.get(Uri.parse('http://api.example.com/data'));
    return res.body;
  }

  Future<String> postInsecure(Map<String, String> body) async {
    // ruleid: cleartext-http
    final res = await http.post(
      Uri.parse('http://api.example.com/login'),
      body: body,
    );
    return res.body;
  }

  Future<String> readInsecure() async {
    // ruleid: cleartext-http
    return await http.read(Uri.parse('http://api.example.com/file'));
  }

  Future<String> uriHttpHelper() async {
    // ruleid: cleartext-http
    final res = await http.get(Uri.http('api.example.com', '/data'));
    return res.body;
  }

  Future<HttpClientResponse> ioCleartext() async {
    final client = HttpClient();
    // ruleid: cleartext-http
    final req = await client.getUrl(Uri.parse('http://api.example.com/data'));
    return req.close();
  }

  Future<HttpClientResponse> ioCleartextOpen() async {
    final client = HttpClient();
    // ruleid: cleartext-http
    final req = await client.openUrl('GET', Uri.parse('http://api.example.com/x'));
    return req.close();
  }

  Future<String> fetchSecure() async {
    // ok: cleartext-http
    final res = await http.get(Uri.parse('https://api.example.com/data'));
    return res.body;
  }

  Future<String> postSecure(Map<String, String> body) async {
    // ok: cleartext-http
    final res = await http.post(
      Uri.parse('https://api.example.com/login'),
      body: body,
    );
    return res.body;
  }

  Future<String> uriHttpsHelper() async {
    // ok: cleartext-http
    final res = await http.get(Uri.https('api.example.com', '/data'));
    return res.body;
  }

  Future<HttpClientResponse> ioSecure() async {
    final client = HttpClient();
    // ok: cleartext-http
    final req = await client.getUrl(Uri.parse('https://api.example.com/data'));
    return req.close();
  }
}
