import 'dart:async';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hahaloloapp/screen/book_tour/book_tour_page.dart';

import '../bloc/calendar_blocs/calendar.bloc.dart';
import '../bloc/calendar_blocs/calendar_repository.dart';
import '../bloc/datetime_blocs/datetime_bloc.dart';
import '../bloc/datetime_blocs/datetime_repository.dart';

class BookDateTimePage extends StatefulWidget {
  const BookDateTimePage({Key? key, this.checkActive}) : super(key: key);
  final bool? checkActive;
  @override
  BookDateTimePageState createState() => BookDateTimePageState();
}

class BookDateTimePageState extends State<BookDateTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.black26),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        title: const Padding(
          padding: EdgeInsets.fromLTRB(50, 5, 10, 5),
          child: Text(
            'Thay đổi ngày',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: MultiBlocProvider(
          providers: [
            BlocProvider<DatetimeBloc>(
              create: (BuildContext context) =>
                  DatetimeBloc(context.read<DateTimeRepository>()),
            ),
            BlocProvider<CalendarBloc>(
              create: (BuildContext context) =>
                  CalendarBloc(context.read<CalendarRepository>()),
            ),
          ],
          child: BookDatetimeBody(
            checkActive: widget.checkActive,
          )),
    );
    //   BlocProvider(
    //     create: (context) => DatetimeBloc(context.read<DateTimeRepository>()),
    //     child: BlocProvider(
    //         create: (context) =>
    //             CalendarBloc(context.read<CalendarRepository>()),
    //         child: const BookDatetimeBody()),
    //   ),
    // );
  }
}

class BookDatetimeBody extends StatefulWidget {
  const BookDatetimeBody({Key? key, this.checkActive}) : super(key: key);
  final bool? checkActive;

  @override
  BookDatetimeBodyState createState() => BookDatetimeBodyState();
}

class BookDatetimeBodyState extends State<BookDatetimeBody> {
  late final ScrollController controller;
  bool isSelected = true;
  int selectedIndex = 0;
  bool activeConnection = false;
  String T = "";
  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      // print(result);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          activeConnection = true;
          T = "Turn off the data and repress again";
        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
        T = "Turn On the data and repress again";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      checkUserConnection();
      // print('Check2');
    });
    widget.checkActive == true
        ? context.read<DatetimeBloc>().add(DatetimeFetch())
        : const SizedBox();
    controller = ScrollController();
    controller.addListener(scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(scrollListener);
    super.dispose();
  }

  void scrollListener() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      ///  call loadMore
      checkUserConnection();
      activeConnection == true
          ? context.read<DatetimeBloc>().add(DatetimeLoadMore())
          : const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Chọn tháng khởi hành',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),

          //Chọn ngày khởi hành
          //
          ///
          /// ...//
          /// ////

          Column(
            children: [
              BlocBuilder<DatetimeBloc, DatetimeState>(
                  builder: (context, state) {
                if (state.status == DatetimeStatus.loading) {
                  context.read<CalendarBloc>().add(CalendarFetch());
                  return const Center(child: CircularProgressIndicator());
                }
                if (activeConnection == true && state.listDate.isEmpty) {
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80,
                        color: Colors.amber.withOpacity(0.15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.warning_amber_outlined,
                                  color: Colors.orange.withOpacity(0.5),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text:
                                            ' Tour không có lịch trình khả dụng',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' Vui lòng \n lựa chọn lịch trình tour khác',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => {
                                                Navigator.of(context).pop(),
                                              },
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 80,
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: controller,
                      itemCount: state.listDate.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (state.listDate.length - 1 == index) {
                          if (state.status == DatetimeStatus.failure) {
                            return state.hasReachedMax == true
                                ? SizedBox(
                                    child: TextButton(
                                      onPressed: () {
                                        context
                                            .read<DatetimeBloc>()
                                            .add(DatetimeLoadMore());
                                      },
                                      child: const Text('Reload'),
                                    ),
                                  )
                                : SizedBox(
                                    width: 10,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: const Text('')));
                          }
                          return activeConnection == true
                              ? const Center(child: CircularProgressIndicator())
                              : const SizedBox();
                        }

                        if (state.listDate.isNotEmpty) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  if (selectedIndex != 0 &&
                                      selectedIndex != 2) {
                                    checkUserConnection();
                                    context
                                        .read<CalendarBloc>()
                                        .add(CalendarFetch2());
                                  } else if (selectedIndex == 0 ||
                                      selectedIndex == 2) {
                                    checkUserConnection();
                                    context
                                        .read<CalendarBloc>()
                                        .add(CalendarFetch());
                                  }
                                });
                              },
                              child: DateYearWidget(
                                year: state.listDate[index].year,
                                month: state.listDate[index].month,
                                color: selectedIndex == index
                                    ? Colors.blue
                                    : Colors.white70,
                                colorText: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ));
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 80,
                              color: Colors.amber.withOpacity(0.15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.warning_amber_outlined,
                                        color: Colors.orange.withOpacity(0.5),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: <TextSpan>[
                                            const TextSpan(
                                              text:
                                                  ' Tour không có lịch trình khả dụng',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' Vui lòng \n lựa chọn lịch trình tour khác',
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () => {
                                                      Navigator.of(context)
                                                          .pop(),
                                                    },
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                );
              }),
            ],
          ),

          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Lịch khởi hành sắp tới',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
            if (state.status == CalendarStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return activeConnection == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.listCalendar.length,
                        itemBuilder: (context, index) {
                          return UpcomingCalendarWidget(
                            weekDayStart:
                                state.listCalendar[index].dateStart.weekday,
                            weekDayEnd:
                                state.listCalendar[index].dateEnd.weekday,
                            dayStart: state.listCalendar[index].dateStart.day,
                            dayEnd: state.listCalendar[index].dateEnd.day,
                            monthStart:
                                state.listCalendar[index].dateStart.month,
                            monthEnd: state.listCalendar[index].dateEnd.month,
                            yearStart: state.listCalendar[index].dateStart.year,
                            yearEnd: state.listCalendar[index].dateEnd.year,
                            total: state.listCalendar[index].total,
                          );
                        }),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80,
                        color: Colors.amber.withOpacity(0.15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.warning_amber_outlined,
                                  color: Colors.orange.withOpacity(0.5),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text:
                                            ' Tour không có lịch trình khả dụng',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' Vui lòng \n lựa chọn lịch trình tour khác',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => {
                                                Navigator.of(context).pop(),
                                              },
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          }),
        ],
      ),
    );
  }
}

class DateYearWidget extends StatelessWidget {
  const DateYearWidget({
    Key? key,
    this.month,
    this.year,
    this.color,
    this.colorText,
  }) : super(key: key);
  final int? month;
  final int? year;
  final Color? color;
  final Color? colorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tháng $month',
            style: TextStyle(
              color: colorText,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            year.toString(),
            style: TextStyle(
              color: colorText,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingCalendarWidget extends StatelessWidget {
  const UpcomingCalendarWidget({
    Key? key,
    this.weekDayStart,
    this.monthStart,
    this.yearStart,
    this.weekDayEnd,
    this.monthEnd,
    this.yearEnd,
    this.total,
    this.dayStart,
    this.dayEnd,
  }) : super(key: key);
  final int? dayStart;
  final int? dayEnd;
  final int? weekDayStart;
  final int? monthStart;
  final int? yearStart;
  final int? weekDayEnd;
  final int? monthEnd;
  final int? yearEnd;
  final int? total;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BookTourPage(),
          ),
        );
      },
      child: Container(
        width: 350,
        height: 100,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white70,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Khởi hành',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Th $weekDayStart, $dayStart/$monthStart/$yearStart',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12, 5, 12, 20),
                    child: Icon(
                      Icons.keyboard_double_arrow_right_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Kết thúc',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Th $weekDayEnd, $dayEnd/$monthEnd/$yearEnd',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$total đ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookTourPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Đặt ngay',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
