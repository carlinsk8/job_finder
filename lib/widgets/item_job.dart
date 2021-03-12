part of 'widgets.dart';

class ItemJob extends StatelessWidget {
  final Job job;

  ItemJob(this.job);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15, bottom: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: _boxDecoration(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LogoAndFavorite(job: job),
            TextDescription(job: job),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    return BoxDecoration(
      color: this.job.themeDark ? Theme.of(context).primaryColor : Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(4.0, 4.0),
          blurRadius: 10,
        )
      ],
    );
  }
}

class TextDescription extends StatelessWidget {
  const TextDescription({
    Key key,
    @required this.job,
  }) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.job.company.name,
          style: TextStyle(
            fontSize: 15,
            color: this.job.themeDark
                ? Theme.of(context).highlightColor
                : Colors.grey,
          ),
        ),
        Text(
          this.job.role,
          style: TextStyle(
            fontSize: 20,
            color: this.job.themeDark
                ? Colors.white
                : Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.place,
              size: 15,
              color: this.job.themeDark
                  ? Theme.of(context).highlightColor
                  : Colors.grey,
            ),
            Text(
              this.job.location,
              style: TextStyle(
                fontSize: 15,
                color: this.job.themeDark
                    ? Theme.of(context).highlightColor
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LogoAndFavorite extends StatefulWidget {
  const LogoAndFavorite({
    Key key,
    @required this.job,
  }) : super(key: key);

  final Job job;

  @override
  _LogoAndFavoriteState createState() => _LogoAndFavoriteState();
}

class _LogoAndFavoriteState extends State<LogoAndFavorite> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompanyLogo(this.widget.job.company.urlLogo),
        GestureDetector(
          onTap: () {
            this.widget.job.isFavorite = !this.widget.job.isFavorite;
            setState(() {});
          },
          child: Icon(
            this.widget.job.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: this.widget.job.themeDark ? Colors.white : Colors.grey,
          ),
        )
      ],
    );
  }
}

class CompanyLogo extends StatelessWidget {
  final String logo;

  CompanyLogo(this.logo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          logo,
          height: 60,
        ),
      ),
    );
  }
}
