import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({Key? key, this.title, this.info}) : super(key: key);
  final String? title;
  final String? info;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 5, bottom: 5, right: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              info ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
