import 'package:flutter/material.dart';

class ServiceTour extends StatelessWidget {
  const ServiceTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Dịch vụ tour',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),
          CircleText(
            nameService: 'Xe điện',
          ),
          CircleText(
            nameService: 'Bãi giữ xe',
          ),
          CircleText(
            nameService: 'Vé tham quan',
          ),
          CircleText(
            nameService: 'Dịch vụ đưa đón',
          ),
        ],
      ),
    );
  }
}

class CircleText extends StatelessWidget {
  const CircleText({Key? key, this.nameService}) : super(key: key);
  final String? nameService;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 30,
                color: Colors.black45,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                nameService ?? '',
                style: const TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
