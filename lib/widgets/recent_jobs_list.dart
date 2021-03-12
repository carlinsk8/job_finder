part of 'widgets.dart';

class RecentJobList extends StatelessWidget {
  final List<Job> jobs;

  RecentJobList(this.jobs);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: this.jobs.length,
        itemBuilder: (_, i) => RecentItemJob(this.jobs[i]),
      ),
    );
  }
}
