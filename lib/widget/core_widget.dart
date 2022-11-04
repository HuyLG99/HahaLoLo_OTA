import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, this.header, this.sizeText}) : super(key: key);
  final String? header;
  final double? sizeText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 18,
          width: 18,
          margin: const EdgeInsets.only(left: 5, top: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.lightBlueAccent[100],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 5, bottom: 0),
          child: Row(
            children: [
              Text(
                '$header',
                style: TextStyle(
                  fontSize: sizeText ?? 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageLocationWidget extends StatelessWidget {
  const ImageLocationWidget({Key? key, this.url}) : super(key: key);
  final String? url;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(url ?? ''),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: const [
                Icon(Icons.location_on_outlined),
                Text('data, Tủkey'),
              ],
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key, this.image, this.notification})
      : super(key: key);
  final String? image;
  final String? notification;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.network(
            image ?? '',
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              notification ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpaceLine extends StatelessWidget {
  const SpaceLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 0.01,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
          (index) => const Text(
            '-',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    ));
  }
}
