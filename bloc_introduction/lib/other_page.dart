import "package:flutter/material.dart";

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other'),
      ),
      body: Center(
        child: Text('Other', style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
