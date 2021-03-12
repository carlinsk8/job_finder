import 'package:flutter/material.dart';

import 'package:job_finder_ui/pages/splash_page.dart';
import 'package:job_finder_ui/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JobFinder',
      home: SplashPage(),
      theme: customTheme(),
    );
  }
}
