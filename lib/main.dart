import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hahaloloapp/bloc/accompanied_service_bloc/accompanied_repository.dart';
import 'package:hahaloloapp/screen/book_tour/book_tour_page.dart';
import 'package:hahaloloapp/screen/detail_page.dart';

import 'bloc/accompanied_service_bloc/accompanied_bloc.dart';
import 'bloc/calendar_blocs/calendar_repository.dart';
import 'bloc/counter_accompanied_cubit/counter_accompanied_cubit.dart';
import 'bloc/counter_cubit/counter_cubit.dart';
import 'bloc/datetime_blocs/datetime_repository.dart';
import 'core/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => DateTimeRepository()),
          RepositoryProvider(create: (context) => CalendarRepository()),
          RepositoryProvider(
              create: (context) => AccompaniedServiceRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AccompaniedServiceBloc>(
              create: (BuildContext context) => AccompaniedServiceBloc(
                  context.read<AccompaniedServiceRepository>()),
            ),
            BlocProvider<CounterCubit>(
              create: (_) => CounterCubit(),
            ),
            BlocProvider<CounterAccompaniedCubit>(
              create: (_) => CounterAccompaniedCubit(),
            )
          ],
          child: MaterialApp(
            title: 'HahaLoloApp',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            debugShowCheckedModeBanner: false,
            home: const DetailPage(),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // readJson();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookTourPage(),
                  ),
                );
              },
              child: const Text('Load Data '),
            ),
          ],
        ),
      ),
    );
  }
}
