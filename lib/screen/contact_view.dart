import 'package:flutter/material.dart';

import '../widget/core_widget.dart';

class ContactView extends StatelessWidget {
  const ContactView(
      {Key? key,
      this.header,
      this.picture,
      this.title,
      this.describe,
      this.supTitle,
      this.blueTitle})
      : super(key: key);
  final String? header;
  final String? picture;
  final String? title;
  final String? describe;
  final String? supTitle;
  final String? blueTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const TitleWidget(
            header: 'Liên hệ',
          ),
          Column(
            children: const [
              Text(
                'Chúng tôi luôn sẵn sàng hổ trợ 24/7!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
                overflow: TextOverflow.fade,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 5, 1, 5),
                child: Text(
                  'Nếu bạn có bất kỳ câu hỏi nào về dịch vụ này, hãy liên hệ theo thông tin bên dưới, chúng tôi sẽ phản hồi trong vòng 2 giờ !',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hotline: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '1920000000 ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Email: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'support@hahahlolo.com ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    Divider(
                      thickness: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Facebook: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Hahalolo Offical ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Halome: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'TT Chăm sóc Khách hàng Hahalolo ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
