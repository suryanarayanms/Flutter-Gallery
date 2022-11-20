import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gallery/Pages/homepage.dart';
import 'package:flutter_gallery/Provider/apps.dart';

void main() {
  // Step 2
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: ((context) => Apps()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Gallery',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Homepage(),
        ));
  }
}
