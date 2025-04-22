import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_empty_list.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            const Text(
              "Looks like your contact list is empty.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const Text(
              "Add a new contact now.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
