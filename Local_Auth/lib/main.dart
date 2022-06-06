import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///? variables
  final LocalAuthentication auth = LocalAuthentication();
  late SupportedState _supportedState;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;

  ///? initState
  @override
  void initState() {
    super.initState();

    ///? init
    _supportedState = SupportedState.unknown;

    ///?
    auth.isDeviceSupported().then((isSupported) => setState(() =>
        _supportedState = isSupported
            ? SupportedState.supported
            : SupportedState.unsupported));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Divider(height: 150),

            ///? is Device support
            _supportedState == SupportedState.unknown
                ? const CircularProgressIndicator()
                : _supportedState == SupportedState.supported
                    ? const Text('This device is Supported')
                    : const Text('This device is not Supported'),

            ///? is possible to check biometrics
            const Divider(height: 50),
            Text('Can check biobetrics: $_canCheckBiometrics'),
            ElevatedButton(
                onPressed: _checkBiometrics,
                child: const Text('Check Biobetrics')),

            ///? Available Biometrics list
            const Divider(height: 50),
            Text('Available biobetrics: $_availableBiometrics'),
            ElevatedButton(
                onPressed: _getAvailableBiometrics,
                child: const Text('Get available Biobetrics')),

            ///? Cancel option authentications
            const Divider(height: 50),
            Text('Current State: $_authorized'),
            if (_isAuthenticating)
              ElevatedButton(
                  onPressed: _cancelAuthentication,
                  child: const Text('Cancel Authentication')),

            ///? Authenticate with PIN / Biometrics
            if (!_isAuthenticating)
              ElevatedButton(
                  onPressed: _authenticate, child: const Text('Authenticate')),

            ///? Authenticate with only Biometrics
            if (!_isAuthenticating)
              ElevatedButton(
                  onPressed: _authenticateWithBiometrics,
                  child: Text(_isAuthenticating
                      ? 'Cancel'
                      : 'Authenticate: Biobetrics only')),
          ]),
        ),
      ),
    );
  }

  ///? is possible to check biometrics
  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      debugPrint('PlatrformException: ${e.message}');
    }
    if (!mounted) return;
    setState(() => _canCheckBiometrics = canCheckBiometrics);
  }

  ///? Available Biometrics list
  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      debugPrint('PlatformException: ${e.message}');
      availableBiometrics = [];
    }
    if (!mounted) return;
    setState(() => _availableBiometrics = availableBiometrics);
  }

  ///? Authenticate with PIN / Biometrics
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      _isAuthenticating = true;
      _authorized = 'Authenticating...';
      setState(() {});
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          options: const AuthenticationOptions(
              useErrorDialogs: true, stickyAuth: true));
      setState(() => _isAuthenticating = false);
    } on PlatformException catch (e) {
      debugPrint('PlatformException: ${e.message}');
      _isAuthenticating = false;
      _authorized = 'Error - ${e.message}';
      setState(() {});
      return;
    }
    if (!mounted) return;
    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  ///? Authenticate with only Biometrics
  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      _isAuthenticating = true;
      _authorized = 'Authenticating...';
      setState(() {});
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          options: const AuthenticationOptions(
              useErrorDialogs: true, stickyAuth: true, biometricOnly: true));
      setState(() => _isAuthenticating = false);
    } on PlatformException catch (e) {
      debugPrint('PlatformException: ${e.message}');
      _isAuthenticating = false;
      _authorized = 'Error - ${e.message}';
      setState(() {});
    }
    if (!mounted) return;
    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  ///? Cancel option authentications
  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }
}

///? Supported State (enum)
enum SupportedState {
  unknown,
  supported,
  unsupported,
}
