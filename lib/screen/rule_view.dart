import 'package:flutter/material.dart';

import '../widget/core_widget.dart';

class RuleView extends StatelessWidget {
  const RuleView({Key? key, this.header, this.describe, this.title})
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
          describe != null
              ? Text(
                  title ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : const SizedBox(),
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
                      'https://www.kindpng.com/picc/m/254-2549839_transparent-404-png-404-not-found-medicine-png.png',
                  notification: 'Không tìm thấy dữ liệu',
                ),
        ],
      ),
    );
  }
}
