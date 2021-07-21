class SwimmerData {
  String name = '';
  int index = 0;
  String url = '';
  String age = '';
  String club = '';
  String gender = '';
  String lastMeet = '';
  String lastMeetDate = '';
  String identifier = '';
  int intAge = 0;
  String fullUrl = '';
  List meets = [];

  SwimmerData(
    String name,
    int index,
    String url,
    String age,
    String club,
    String gender,
    String lastMeet,
    String lastMeetDate,
    String identifier,
    int intAge,
    String fullUrl,
    List meets,
  ) {
    this.name = name;
    this.index = index;
    this.url = url;
    this.age = age;
    this.club = club;
    this.gender = gender;
    this.lastMeet = lastMeet;
    this.lastMeetDate = lastMeetDate;
    this.identifier = identifier;
    this.intAge = intAge;
    this.fullUrl = fullUrl;
    this.meets = meets;
  }
}
