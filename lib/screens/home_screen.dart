import 'package:flutter/material.dart';
import '../mixins/alert_mixins.dart';

class AlertManager with SoundAlert, VibrationAlert, NotificationAlert {}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AlertManager _alertManager = AlertManager();

  String _alertMessage = 'Press a button to trigger alert';

  void _handleSound() {
    _alertManager.playSound();
    setState(() => _alertMessage = "Sound Alert Triggered 🔊");
  }

  void _handleVibrate() {
    _alertManager.vibrate();
    setState(() => _alertMessage = "Vibration Alert Triggered 📳");
  }

  void _handleNotify() {
    _alertManager.showNotification();
    setState(() => _alertMessage = "Notification Alert Triggered 🔔");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Alert App'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_alertMessage,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _handleSound,
              child: const Text("Play Sound"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _handleVibrate,
              child: const Text("Vibrate Device"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _handleNotify,
              child: const Text("Show Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
