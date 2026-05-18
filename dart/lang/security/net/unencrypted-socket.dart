import 'dart:io';

class TcpClient {
  Future<Socket> openInsecure(String host, int port) {
    // ruleid: unencrypted-socket
    return Socket.connect(host, port);
  }

  Future<ConnectionTask<Socket>> startInsecure(String host, int port) {
    // ruleid: unencrypted-socket
    return Socket.startConnect(host, port);
  }

  Future<RawSocket> rawInsecure(String host, int port) {
    // ruleid: unencrypted-socket
    return RawSocket.connect(host, port);
  }

  Future<ConnectionTask<RawSocket>> rawStartInsecure(String host, int port) {
    // ruleid: unencrypted-socket
    return RawSocket.startConnect(host, port);
  }

  Future<SecureSocket> openSecure(String host, int port) {
    // ok: unencrypted-socket
    return SecureSocket.connect(host, port);
  }

  Future<RawSecureSocket> rawSecure(String host, int port) {
    // ok: unencrypted-socket
    return RawSecureSocket.connect(host, port);
  }
}
