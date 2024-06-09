import 'package:local_auth/local_auth.dart';

class AuthService {
  final _auth = LocalAuthentication();
  
  Future<bool> useBiometric() async {
    final isAvailable = await isBiometricAvailable();
    if(!isAvailable) return false;
    try {
      return await _auth.authenticate(
      localizedReason: 'Autentique-se para continuar',
    );
    } catch(e) {
      return false;
    }
  }


  Future<bool> isBiometricAvailable() async {
    final isAvailable = await _auth.canCheckBiometrics;
    final isDeviceSupported = await _auth.isDeviceSupported();
    print('isAvailable: $isAvailable');
    print('isDeviceSupported: $isDeviceSupported');
    if(!isAvailable || !isDeviceSupported) return false;
    return true;
  }

  auth() {}
}
