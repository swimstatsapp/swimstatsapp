final String tableName = 'swimmer';

//establishing the table column names
class SwimmerFields {
  //creating list of swimmer field titles
  static final List<String> values = [
    id,
    firstName,
    lastName,
    identifier,
    swimmerintAge,
    swimmerClub,
    swimmerGender,
    swimmerLastMeet,
    swimmerLastMeetDate,
    free50YTime,
    free50MTime,
    free100YTime,
    free100MTime,
    free200YTime,
    free200MTime,
    free500YTime,
    free400MTime,
    free1000YTime,
    free800MTime,
    free1650YTime,
    free1500MTime,
    back100YTime,
    back100MTime,
    back200YTime,
    back200MTime,
    brst100YTime,
    brst100MTime,
    brst200YTime,
    brst200MTime,
    fly100YTime,
    fly100MTime,
    fly200YTime,
    fly200MTime,
    im200YTime,
    im200MTime,
    im400YTime,
    im400MTime,
    fullUrl,
    currentRegion,
    currentLSCidentifier,
  ];

  static final String id = '_id'; //use underscore before id: SQL convention
  static final String firstName = 'firstName';
  static final String lastName = 'lastName';
  static final String identifier = 'identifier';
  static final String swimmerintAge = 'swimmerintAge';
  static final String swimmerClub = 'swimmerClub';
  static final String swimmerGender = 'swimmerGender';
  static final String swimmerLastMeet = 'swimmerLastMeet';
  static final String swimmerLastMeetDate = 'swimmerLastMeetDate';
  static final String free50YTime = 'free50YTime';
  static final String free50MTime = 'free50MTime';
  static final String free100YTime = 'free100YTime';
  static final String free100MTime = 'free100MTime';
  static final String free200YTime = 'free200YTime';
  static final String free200MTime = 'free200MTime';
  static final String free500YTime = 'free500YTime';
  static final String free400MTime = 'free400MTime';
  static final String free1000YTime = 'free1000YTime';
  static final String free800MTime = 'free800MTime';
  static final String free1650YTime = 'free1650YTime';
  static final String free1500MTime = 'free1500MTime';
  static final String back100YTime = 'back100YTime';
  static final String back100MTime = 'back100MTime';
  static final String back200YTime = 'back200YTime';
  static final String back200MTime = 'back200MTime';
  static final String brst100YTime = 'brst100YTime';
  static final String brst100MTime = 'brst100mTime';
  static final String brst200YTime = 'brst200YTime';
  static final String brst200MTime = 'brst200MTime';
  static final String fly100YTime = 'fly100YTime';
  static final String fly100MTime = 'fly100MYTime';
  static final String fly200YTime = 'fly200YTime';
  static final String fly200MTime = 'fly200MTime';
  static final String im200YTime = 'im200YTime';
  static final String im200MTime = 'im200MTime';
  static final String im400YTime = 'im400YTime';
  static final String im400MTime = 'im400MTime';
  static final String fullUrl = 'fullUrl';
  static final String currentRegion = 'currentRegion';
  static final String currentLSCidentifier = 'currentLSCidentifier';
}

class Swimmer {
  int? id;
  String? firstName;
  String? lastName;
  String? identifier;
  int? swimmerintAge;
  String? swimmerClub;
  String? swimmerGender;
  String? swimmerLastMeet;
  String? swimmerLastMeetDate;
  String? free50YTime;
  String? free50MTime;
  String? free100YTime;
  String? free100MTime;
  String? free200YTime;
  String? free200MTime;
  String? free500YTime;
  String? free400MTime;
  String? free1000YTime;
  String? free800MTime;
  String? free1650YTime;
  String? free1500MTime;
  String? back100YTime;
  String? back100MTime;
  String? back200YTime;
  String? back200MTime;
  String? brst100YTime;
  String? brst100MTime;
  String? brst200YTime;
  String? brst200MTime;
  String? fly100YTime;
  String? fly100MTime;
  String? fly200YTime;
  String? fly200MTime;
  String? im200YTime;
  String? im200MTime;
  String? im400YTime;
  String? im400MTime;
  String? fullUrl;
  String? currentRegion;
  String? currentLSCidentifier;

  Swimmer({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.identifier,
    required this.swimmerintAge,
    required this.swimmerClub,
    required this.swimmerGender,
    required this.swimmerLastMeet,
    required this.swimmerLastMeetDate,
    required this.free50YTime,
    required this.free50MTime,
    required this.free100YTime,
    required this.free100MTime,
    required this.free200YTime,
    required this.free200MTime,
    required this.free500YTime,
    required this.free400MTime,
    required this.free1000YTime,
    required this.free800MTime,
    required this.free1650YTime,
    required this.free1500MTime,
    required this.back100YTime,
    required this.back100MTime,
    required this.back200YTime,
    required this.back200MTime,
    required this.brst100YTime,
    required this.brst100MTime,
    required this.brst200YTime,
    required this.brst200MTime,
    required this.fly100YTime,
    required this.fly100MTime,
    required this.fly200YTime,
    required this.fly200MTime,
    required this.im200YTime,
    required this.im200MTime,
    required this.im400YTime,
    required this.im400MTime,
    required this.fullUrl,
    required this.currentRegion,
    required this.currentLSCidentifier,
  });

  Map<String, Object?> toJson() => {
        SwimmerFields.id: id,
        SwimmerFields.firstName: firstName,
        SwimmerFields.lastName: lastName,
        SwimmerFields.identifier: identifier,
        SwimmerFields.swimmerintAge: swimmerintAge,
        SwimmerFields.swimmerClub: swimmerClub,
        SwimmerFields.swimmerGender: swimmerGender,
        SwimmerFields.swimmerLastMeet: swimmerLastMeet,
        SwimmerFields.swimmerLastMeetDate: swimmerLastMeetDate,
        SwimmerFields.free50YTime: free50YTime,
        SwimmerFields.free50MTime: free50MTime,
        SwimmerFields.free100YTime: free100YTime,
        SwimmerFields.free100MTime: free100MTime,
        SwimmerFields.free200YTime: free200YTime,
        SwimmerFields.free200MTime: free200MTime,
        SwimmerFields.free500YTime: free500YTime,
        SwimmerFields.free400MTime: free400MTime,
        SwimmerFields.free1000YTime: free400MTime,
        SwimmerFields.free800MTime: free800MTime,
        SwimmerFields.free1650YTime: free1650YTime,
        SwimmerFields.free1500MTime: free1500MTime,
        SwimmerFields.back100YTime: back100YTime,
        SwimmerFields.back100MTime: back100MTime,
        SwimmerFields.back200YTime: back200YTime,
        SwimmerFields.back200MTime: back200MTime,
        SwimmerFields.brst100YTime: brst100YTime,
        SwimmerFields.brst100MTime: brst100MTime,
        SwimmerFields.brst200YTime: brst200YTime,
        SwimmerFields.brst200MTime: brst200MTime,
        SwimmerFields.fly100YTime: fly100YTime,
        SwimmerFields.fly100MTime: fly100MTime,
        SwimmerFields.fly200YTime: fly200YTime,
        SwimmerFields.fly200MTime: fly200MTime,
        SwimmerFields.im200YTime: im200YTime,
        SwimmerFields.im200MTime: im200MTime,
        SwimmerFields.im400YTime: im400YTime,
        SwimmerFields.im400MTime: im400MTime,
        SwimmerFields.fullUrl: fullUrl,
        SwimmerFields.currentRegion: currentRegion,
        SwimmerFields.currentLSCidentifier: currentLSCidentifier,
      };

  static Swimmer fromJson(Map<String, Object?> json) => Swimmer(
        id: json[SwimmerFields.id] as int?,
        firstName: json[SwimmerFields.firstName] as String,
        lastName: json[SwimmerFields.lastName] as String,
        identifier: json[SwimmerFields.identifier] as String,
        swimmerintAge: json[SwimmerFields.swimmerintAge] as int?,
        swimmerClub: json[SwimmerFields.swimmerClub] as String,
        swimmerGender: json[SwimmerFields.swimmerGender] as String,
        swimmerLastMeet: json[SwimmerFields.swimmerLastMeet] as String,
        swimmerLastMeetDate: json[SwimmerFields.swimmerLastMeetDate] as String,
        free50YTime: json[SwimmerFields.free50YTime] as String,
        free50MTime: json[SwimmerFields.free50MTime] as String,
        free100YTime: json[SwimmerFields.free100YTime] as String,
        free100MTime: json[SwimmerFields.free100MTime] as String,
        free200YTime: json[SwimmerFields.free200YTime] as String,
        free200MTime: json[SwimmerFields.free200MTime] as String,
        free500YTime: json[SwimmerFields.free500YTime] as String,
        free400MTime: json[SwimmerFields.free400MTime] as String,
        free1000YTime: json[SwimmerFields.free1000YTime] as String,
        free800MTime: json[SwimmerFields.free800MTime] as String,
        free1650YTime: json[SwimmerFields.free1650YTime] as String,
        free1500MTime: json[SwimmerFields.free1500MTime] as String,
        back100YTime: json[SwimmerFields.back100YTime] as String,
        back100MTime: json[SwimmerFields.back100MTime] as String,
        back200YTime: json[SwimmerFields.back200YTime] as String,
        back200MTime: json[SwimmerFields.back200MTime] as String,
        brst100YTime: json[SwimmerFields.brst100YTime] as String,
        brst100MTime: json[SwimmerFields.brst100MTime] as String,
        brst200YTime: json[SwimmerFields.brst200YTime] as String,
        brst200MTime: json[SwimmerFields.brst200MTime] as String,
        fly100YTime: json[SwimmerFields.fly100YTime] as String,
        fly100MTime: json[SwimmerFields.fly100MTime] as String,
        fly200YTime: json[SwimmerFields.fly200YTime] as String,
        fly200MTime: json[SwimmerFields.fly200MTime] as String,
        im200YTime: json[SwimmerFields.im200YTime] as String,
        im200MTime: json[SwimmerFields.im200MTime] as String,
        im400YTime: json[SwimmerFields.im400YTime] as String,
        im400MTime: json[SwimmerFields.im400MTime] as String,
        fullUrl: json[SwimmerFields.fullUrl] as String,
        currentRegion: json[SwimmerFields.currentRegion] as String,
        currentLSCidentifier:
            json[SwimmerFields.currentLSCidentifier] as String,
      );

  Swimmer copy({int? id, String? name}) => Swimmer(
      // id will be set to argument (the custom one that is set by user), but if null, then it will be set to the instance's id (one that is automatically generated by the database)
      id: id ?? this.id,
      firstName: name ?? this.firstName,
      lastName: name ?? this.lastName,
      identifier: identifier ?? this.identifier,
      swimmerintAge: swimmerintAge ?? this.swimmerintAge,
      swimmerClub: swimmerClub ?? this.swimmerClub,
      swimmerGender: swimmerGender ?? this.swimmerGender,
      swimmerLastMeet: swimmerLastMeet ?? this.swimmerLastMeet,
      swimmerLastMeetDate: swimmerLastMeetDate ?? this.swimmerLastMeetDate,
      free50YTime: free50YTime ?? this.free50YTime,
      free50MTime: free50MTime ?? this.free50MTime,
      free100YTime: free100YTime ?? this.free100YTime,
      free100MTime: free100MTime ?? this.free100MTime,
      free200YTime: free200YTime ?? this.free200YTime,
      free200MTime: free200MTime ?? this.free200MTime,
      free500YTime: free500YTime ?? this.free500YTime,
      free400MTime: free400MTime ?? this.free400MTime,
      free1000YTime: free400MTime ?? this.free400MTime,
      free800MTime: free800MTime ?? this.free800MTime,
      free1650YTime: free1650YTime ?? this.free1650YTime,
      free1500MTime: free1500MTime ?? this.free1500MTime,
      back100YTime: back100YTime ?? this.back100YTime,
      back100MTime: back100MTime ?? this.back100MTime,
      back200YTime: back200YTime ?? this.back200YTime,
      back200MTime: back200MTime ?? this.back200MTime,
      brst100YTime: brst100YTime ?? this.brst100YTime,
      brst100MTime: brst100MTime ?? this.brst100MTime,
      brst200YTime: brst200YTime ?? this.brst200YTime,
      brst200MTime: brst200MTime ?? this.brst200MTime,
      fly100YTime: fly100YTime ?? this.fly100YTime,
      fly100MTime: fly100MTime ?? this.fly100MTime,
      fly200YTime: fly200YTime ?? this.fly200YTime,
      fly200MTime: fly200MTime ?? this.fly200MTime,
      im200YTime: im200YTime ?? this.im200YTime,
      im200MTime: im200MTime ?? this.im200MTime,
      im400YTime: im400YTime ?? this.im400YTime,
      im400MTime: im400MTime ?? this.im400YTime,
      fullUrl: fullUrl ?? this.fullUrl,
      currentRegion: currentRegion ?? this.currentRegion,
      currentLSCidentifier: currentLSCidentifier ?? this.currentLSCidentifier);
}
