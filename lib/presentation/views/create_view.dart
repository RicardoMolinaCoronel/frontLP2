import 'package:flutter/material.dart';

class CreateView extends StatefulWidget {
  const CreateView({super.key});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Current motors: $count'),
          FilledButton.tonal(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
