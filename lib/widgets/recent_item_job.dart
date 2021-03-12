part of 'widgets.dart';

class RecentItemJob extends StatelessWidget {
  final Job job;

  RecentItemJob(this.job);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Container(
        height: 100,
        decoration: _boxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                LogoCompany(job: job),
                TextDescriptionR(job: job),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20),
              child: Icon(Icons.favorite_border, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(4.0, 4.0),
          blurRadius: 10.0,
        )
      ],
    );
  }
}

class TextDescriptionR extends StatelessWidget {
  const TextDescriptionR({
    Key key,
    @required this.job,
  }) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          this.job.company.name,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          this.job.role,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 3),
        Row(
          children: [
            Icon(
              Icons.place,
              size: 15,
              color: Theme.of(context).highlightColor,
            ),
            Text(
              this.job.location,
              style: TextStyle(
                  fontSize: 15, color: Theme.of(context).highlightColor),
            ),
          ],
        ),
      ],
    );
  }
}

class LogoCompany extends StatelessWidget {
  const LogoCompany({
    Key key,
    @required this.job,
  }) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image.network(
        this.job.company.urlLogo,
        height: 50,
      ),
    );
  }
}
