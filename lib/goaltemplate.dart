class Goal {
  String name = '';
  String unit = '';
  String distance = '';
  String stroke = '';
  String goalTime = '';
  String currentTime = '';
  double needValue = 0;
  double needPercentValue = 0;
  bool isVisible = true;

  Goal(
      String unit,
      String distance,
      String stroke,
      String goalTime,
      String currentTime,
      String name,
      double needValue,
      double needPercentValue,
      bool isVisible) {
    this.unit = unit;
    this.distance = distance;
    this.stroke = stroke;
    this.goalTime = goalTime;
    this.currentTime = currentTime;
    this.name = name;
    this.needValue = needValue;
    this.needPercentValue = needPercentValue;
    this.isVisible = isVisible;
  }
}
