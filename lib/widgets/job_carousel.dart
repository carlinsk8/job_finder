part of 'widgets.dart';

class JobCarousel extends StatelessWidget {
  final List<Job> jobs;

  JobCarousel(this.jobs);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: this.jobs.map((item) => ItemJob(item)).toList(),
      options: CarouselOptions(
        height: 230,
        enableInfiniteScroll: false,
        reverse: false,
        viewportFraction: 0.86,
      ),
    );
  }
}
