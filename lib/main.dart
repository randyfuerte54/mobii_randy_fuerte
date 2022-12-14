import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobii_randy_fuerte/mobii_bloc_providers.dart';
import 'package:mobii_randy_fuerte/mobii_router_screen.dart';
import 'package:mobii_randy_fuerte/user/view/screens/user_list_screen.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      runApp(const MobiiApp());
    },
    (error, stack) {},
  );
}

class MobiiApp extends StatefulWidget {
  const MobiiApp({super.key});

  @override
  State<MobiiApp> createState() => _MobiiApp();
}

class _MobiiApp extends State<MobiiApp> {
  final screens = MobiiRouterScreens.instance();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: MobiiBlocProviders.instance.repositoryProvider,
      child: MultiBlocProvider(
        providers: MobiiBlocProviders.instance.blocProviders,
        child: ScreenUtilInit(
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Mobii',
              initialRoute: UserListScreen.routeName,
              onGenerateRoute: (RouteSettings settings) {
                return PageTransition(
                  ctx: context,
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 500),
                  settings: settings,
                  child: screens.buildScreen(context, settings),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
