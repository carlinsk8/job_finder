class Company {
  Company({
    this.name,
    this.urlLogo,
  });

  String name;
  String urlLogo;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        urlLogo: json["url_logo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url_logo": urlLogo,
      };
}
