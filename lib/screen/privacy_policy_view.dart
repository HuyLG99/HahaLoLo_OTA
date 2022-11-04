import 'package:flutter/material.dart';

import '../widget/core_widget.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({Key? key, this.header, this.describe, this.title})
      : super(key: key);
  final String? header;
  final String? describe;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(header: header),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: describe != null
                ? Text(
                    title ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : const SizedBox(),
          ),
          describe != null
              ? Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, top: 8, bottom: 8, right: 18),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$describe',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              : const NotFoundWidget(
                  image:
                      'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
                  notification: 'Không tìm thấy chính sách nào ',
                ),
        ],
      ),
    );
  }
}
