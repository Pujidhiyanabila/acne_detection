class Prediction {
  final double x;
  final double y;
  final double width;
  final double height;
  final double confidence;
  String classification;

  Prediction({
    this.x = 0,
    this.y = 0,
    this.width = 0,
    this.height = 0,
    this.confidence = 0,
    this.classification = "",
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      x: json["x"],
      y: json["y"],
      width: json["width"],
      height: json["height"],
      confidence: json["confidence"] as double,
      classification: json["class"] as String,
    );
  }
}