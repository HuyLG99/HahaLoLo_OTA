import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hahaloloapp/widget/start_display_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widget/core_widget.dart';

class RatingView extends StatelessWidget {
  const RatingView({
    Key? key,
    this.rating,
  }) : super(key: key);
  final String? rating;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TitleWidget(header: 'Đánh giá'),
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: const [
                  Text(
                    '4,75/5',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'Tuyệt vời',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: const [
                  RowRatingText(
                    valueStart: 5,
                    title: 'Tuyệt vời',
                    numRate: 80,
                  ),
                  RowRatingText(
                    valueStart: 4,
                    title: 'Rất tốt',
                    numRate: 1,
                  ),
                  RowRatingText(
                    valueStart: 3,
                    title: 'Hài lòng',
                    numRate: 80,
                  ),
                  RowRatingText(
                    valueStart: 2,
                    title: 'Trung bình',
                    numRate: 80,
                  ),
                  RowRatingText(
                    valueStart: 1,
                    title: 'Kém',
                    numRate: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        Column(
          children: const [
            RowLineBar(
              valueVote: 0.7,
              title: 'Lịch trình',
              numRate: 80,
            ),
            RowLineBar(
              valueVote: 0.9,
              title: 'Bữa ăn',
              numRate: 80,
            ),
            RowLineBar(
              valueVote: 0.3,
              title: 'Chỗ nghỉ',
              numRate: 80,
            ),
            RowLineBar(
              valueVote: 1,
              title: 'Hướng dẫn viên',
              numRate: 80,
            ),
            RowLineBar(
              valueVote: 0.1,
              title: 'Lịch trình',
              numRate: 80,
            ),
          ],
        ),
      ],
    );
  }
}

class RowRatingText extends StatelessWidget {
  const RowRatingText({Key? key, this.valueStart, this.title, this.numRate})
      : super(key: key);
  final int? valueStart;
  final String? title;
  final int? numRate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.grey,
            ),
            textAlign: TextAlign.start,
            overflow: TextOverflow.fade,
          ),
        ),
        Expanded(
          flex: 2,
          child: IconTheme(
            data: const IconThemeData(
              color: Colors.amber,
              size: 18,
            ),
            child: StarDisplayWidget(value: valueStart ?? 1),
          ),
        ),
        numRate != null
            ? Expanded(
                flex: 1,
                child: Text(
                  numRate.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              )
            : const Text(''),
      ],
    );
  }
}

class RowLineBar extends StatelessWidget {
  const RowLineBar({Key? key, this.valueVote, this.title, this.numRate})
      : super(key: key);
  final double? valueVote;
  final String? title;
  final double? numRate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 2, 0, 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.grey,
              ),
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
            ),
          ),
          Expanded(
            flex: 4,
            child: LinearPercentIndicator(
              barRadius: const Radius.circular(16),
              width: MediaQuery.of(context).size.width - 215,
              animation: false,
              lineHeight: 5.0,
              animationDuration: 2000,
              percent: valueVote ?? 0.0,
              progressColor: Colors.lightBlue[600],
            ),
          ),
          numRate != null
              ? Expanded(
                  flex: 1,
                  child: Text(
                    numRate.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                )
              : const Text(''),
        ],
      ),
    );
  }
}

class DropDownCommentWidget extends StatefulWidget {
  const DropDownCommentWidget({Key? key}) : super(key: key);

  @override
  State<DropDownCommentWidget> createState() => _DropDownCommentWidgetState();
}

class _DropDownCommentWidgetState extends State<DropDownCommentWidget> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: const [
                Icon(
                  Icons.list,
                  size: 16,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.yellow,
            iconDisabledColor: Colors.grey,
            buttonHeight: 20,
            buttonWidth: 20,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Colors.redAccent,
            ),
            buttonElevation: 2,
            itemHeight: 40,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: 200,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.redAccent,
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
            offset: const Offset(-20, 0),
          ),
        ),
      ),
    );
  }
}
