class Tempo {
  double temperaturaMax;
  double temperaturaMin;
  String descricao;

  Tempo(
      {this.temperaturaMax = 0, this.temperaturaMin = 0, this.descricao = ''});

  factory Tempo.fromJson(Map<String, dynamic> json) {
    return Tempo(
      temperaturaMax: json['main']['temp_max'],
      temperaturaMin: json['main']['temp_min'],
      descricao: json['weather'][0]['description'],
    );
  }
}
