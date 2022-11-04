import 'package:flutter/material.dart';

class StarDisplayWidget extends StatelessWidget {
  const StarDisplayWidget({Key? key, required this.value}) : super(key: key);
  final int value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return index < value
            ? const Icon(
                Icons.star,
              )
            : const Text('');
      }),
    );
  }
}
