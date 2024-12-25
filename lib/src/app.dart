import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/views/main_view.dart';
import 'view_models/login_view_model.dart';
import 'ui/views/login_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home', // Cepalica - daš nazaj na login
        routes: {
          '/': (context) => LoginView(),
          '/home': (context) => MainView(),
        },
      ),
    );
  }
}
