import 'package:examen_3/app/core/core_presentation/global_states/actor_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_states/movie_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_states/producer_provider.dart';
import 'package:examen_3/app/core/routes/routes.dart';
import 'package:examen_3/app/core/sql_lite/sql_helper.dart';
import 'package:examen_3/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  mainInjectionContainer();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ISqlHelper iSqlHelper = GetIt.instance();
    iSqlHelper.database();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieProvider()),
        ChangeNotifierProvider(create: (context) => ActorProvider()),
        ChangeNotifierProvider(create: (context) => ProducerProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
