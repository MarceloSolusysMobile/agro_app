class Previsao {
  double temperaturaMax;
  double temperaturaMin;
  String descricao;
  Previsao(
      {
        this.temperaturaMax = 0, 
        this.temperaturaMin = 0, 
        this.descricao = ''
      });

  factory Previsao.fromJson(Map<String, dynamic> json) {
    return Previsao(
      temperaturaMax: json['main']['temp_max'],
      temperaturaMin: json['main']['temp_min'],
      descricao: json['weather'][0]['description'],
    );
  }
}
