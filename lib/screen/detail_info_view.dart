import 'package:flutter/material.dart';
import 'package:hahaloloapp/widget/core_widget.dart';

class DetailInfoView extends StatefulWidget {
  const DetailInfoView({
    Key? key,
    this.date,
    this.header,
    this.way,
  }) : super(key: key);
  final String? date;
  final String? header;
  final String? way;

  @override
  State<DetailInfoView> createState() => _DetailInfoViewState();
}

class _DetailInfoViewState extends State<DetailInfoView> {
  bool _isVisible = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TitleWidget(header: widget.header),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: TextInfoWidget(
                date: widget.date,
                way: widget.way,
                visible: _isVisible,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const Icon(
                          Icons.location_on_outlined,
                          size: 22,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Ngày 2:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        ' Chặng 2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.directions_car,
                        size: 22,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.directions_bus,
                        size: 22,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Column(
              children: const [
                ImageLocationWidget(
                  url:
                      'https://test-media.hahalolo.com/2021/12/27/08/12/279092e30750ebe0d59cfd17ac73d469-1640592723.jpg',
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "- Tour guide welcomes guest at Noi Bai airport. Transfer to Hanoi city, check in hotel. - Leisure time &amp; overnight in Hanoi"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Icon(
                        Icons.flag_outlined,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Ngày 3:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      ' Chặng 3',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.flight_takeoff,
                      size: 22,
                      color: Colors.black,
                    ),
                    Icon(
                      Icons.directions_bus,
                      size: 22,
                      color: Colors.black,
                    ),
                    Icon(
                      Icons.directions_car,
                      size: 22,
                      color: Colors.black,
                    ),
                    Icon(
                      Icons.motorcycle_outlined,
                      size: 22,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       _isVisible = !_isVisible;
          //     });
          //   },
          //   child: TextInfoWidget(
          //     date: widget.date,
          //     way: widget.way,
          //     visible: _isVisible,
          //   ),
          // ),
          //
        ],
      ),
    );
  }
}

class TextInfoWidget extends StatelessWidget {
  const TextInfoWidget(
      {Key? key, this.date, this.header, this.way, required this.visible})
      : super(key: key);
  final String? date;
  final String? header;
  final String? way;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(color: Colors.green),
                  ),
                  child: const Icon(
                    Icons.directions_car,
                    size: 22,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Ngày $date:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' Chặng $way',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.flight_takeoff,
              size: 22,
              color: Colors.black,
            ),
          ],
        ),
        Visibility(
          visible: visible,
          child: Column(
            children: const [
              ImageLocationWidget(
                url:
                    'https://test-media.hahalolo.com/2021/12/27/08/12/5f5002e84923fe4b9617e84802819d32-1640592729.jpg',
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "- Tour guide welcomes guest at Noi Bai airport. Transfer to Hanoi city, check in hotel. - Leisure time &amp; overnight in Hanoi"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
