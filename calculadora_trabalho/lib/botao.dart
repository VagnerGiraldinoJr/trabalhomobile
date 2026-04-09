import 'package:flutter/material.dart';

class BotaoCalculadora extends StatelessWidget {
  final String texto;
  final Color cor;
  final VoidCallback aoPressionar;

  const BotaoCalculadora({
    super.key,
    required this.texto,
    required this.aoPressionar,
    this.cor = const Color(0xFF333333),
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            padding: const EdgeInsets.all(22),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: aoPressionar,
          child: Text(
            texto,
            style: const TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
      ),
    );
  }
}