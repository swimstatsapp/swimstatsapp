class Goal {
  String name = '';
  String unit = '';
  String distance = '';
  String stroke = '';
  String goalTime = '';
  String currentTime = '';
  double needValue = 0;
  double needPercentValue = 0;

  Goal(
      String unit,
      String distance,
      String stroke,
      String goalTime,
      String currentTime,
      String name,
      double needValue,
      double needPercentValue) {
    this.unit = unit;
    this.distance = distance;
    this.stroke = stroke;
    this.goalTime = goalTime;
    this.currentTime = currentTime;
    this.name = name;
    this.needValue = needValue;
    this.needPercentValue = needPercentValue;
  }
}
