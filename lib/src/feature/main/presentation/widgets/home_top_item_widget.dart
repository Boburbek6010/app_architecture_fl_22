import 'package:flutter/material.dart';

class HomeTopItemWidget extends StatelessWidget {
  final String title;
  final String sub;
  const HomeTopItemWidget({super.key, required this.title, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(sub),
      ),
    );
  }
}
