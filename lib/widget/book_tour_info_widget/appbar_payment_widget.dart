import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppBarPaymentWidget extends StatelessWidget {
  const AppBarPaymentWidget({Key? key, this.title, this.price, this.textButton})
      : super(key: key);
  final String? title;
  final int? price;
  final String? textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200.0,
                child: price! > 0
                    ? Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.black,
                        child: Text(
                          '$price đ',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Text(
                        '$price đ',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 140,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.blue,
                border: Border.all(color: Colors.black12),
              ),
              child: Center(
                child: Text(
                  "$textButton",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
