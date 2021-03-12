import 'package:flutter/material.dart';
import 'package:job_finder_ui/pages/main_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/imgs/img_main.png'),
            TextsTitle(),
            ButtonStarted(),
          ],
        ),
      ),
    );
  }
}

class ButtonStarted extends StatelessWidget {
  const ButtonStarted({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10.0,
      minWidth: 170.0,
      height: 50,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MainPage()));
      },
      child: Text(
        'Get Started',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

class TextsTitle extends StatelessWidget {
  const TextsTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Job hunting',
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          'made easy',
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}
