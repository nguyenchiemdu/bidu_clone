import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/home_bloc.dart';
import 'resources/home_cloud_datasource.dart';
import 'resources/home_repository.dart';
import 'ui/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        Provider<HomeCloudDataSource>(
            create: (context) => HomeCloudDataSource()),
        ProxyProvider<HomeCloudDataSource, HomeRepository>(
            update: ((context, homeCloudDataSource, previous) =>
                previous ?? HomeRepository(homeCloudDataSource))),
        ProxyProvider<HomeRepository, HomeBloc>(
            dispose: (context, homeBloc) => homeBloc.dispose(),
            update: (context, homeRepository, previous) =>
                previous ?? HomeBloc(homeRepository))
      ], child: const MyHomePage()),
    );
  }
}
