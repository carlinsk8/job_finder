import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_svg/flutter_svg.dart';

import 'package:job_finder_ui/models/job.dart';
import 'package:job_finder_ui/widgets/widgets.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Job> _lisJobs;
  List<Job> _lisRecentJobs;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            CustomAppBar(),
            HeaderText(),
            TextTitle(),
            if (_lisJobs != null) JobCarousel(_lisJobs),
            if (_lisJobs != null) Recent(_lisJobs),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  void getData() async {
    _lisJobs = jobFromJson(await getJson('assets/data/jobs.json'));
    setState(() {});
  }

  Future<String> getJson(String urlJson) {
    return rootBundle.loadString(urlJson);
  }
}

class Recent extends StatelessWidget {
  final List<Job> listRecent;
  const Recent(this.listRecent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'See All',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        RecentJobList(this.listRecent)
      ],
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
      ),
      child: Text('For You', style: Theme.of(context).textTheme.bodyText1),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi Jade', style: Theme.of(context).textTheme.bodyText1),
          Text('Find your next', style: Theme.of(context).textTheme.headline1),
          Text('dedign job', style: Theme.of(context).textTheme.headline2),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIcon('assets/icons/slider.svg'),
          Row(
            children: [
              CustomIcon('assets/icons/search.svg'),
              CustomIcon('assets/icons/settings.svg'),
            ],
          )
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final String url;
  CustomIcon(this.url);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 40,
      icon: SvgPicture.asset(this.url),
      onPressed: () {},
    );
  }
}
