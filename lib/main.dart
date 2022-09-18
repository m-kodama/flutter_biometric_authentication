import 'package:flutter/material.dart';
import 'package:flutter_biometric_authentication/biometric_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BiometricHelper _biometricHelper = BiometricHelper();
  bool _showBiometric = false;
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _isBiometricsAvailable();
  }

  void _isBiometricsAvailable() async {
    final showBiometric = await _biometricHelper.hasEnrolledBiometrics();
    setState(() {
      _showBiometric = showBiometric;
    });
  }

  void _authenticated() async {
    final isAuthenticated = await _biometricHelper.authenticate();
    setState(() {
      _isAuthenticated = isAuthenticated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showBiometric ? _authenticated : null,
              child: const Text('生体認証'),
            ),
            // ignore: prefer_const_constructors
            if (_isAuthenticated)
              const Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  '生体認証に成功しました',
                ),
              )
          ],
        ),
      ),
    );
  }
}
