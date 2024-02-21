import 'dart:convert';


GetDataModel getDataModelFromJson(String str) =>
    GetDataModel.fromJson(json.decode(str));

String getDataToJson(GetDataModel data) => json.encode(data.toJson());

class GetDataModel {
  List<Result> result;

  GetDataModel({
    required this.result,
  });

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  int pokId;
  String pokNum;
  String pokNom;
  String pokeImag;
  String pokTipo;
  String pokAltura;
  String pokPeso;

  Result({
    required this.pokId,
    required this.pokNum,
    required this.pokNom,
    required this.pokeImag,
    required this.pokTipo,
    required this.pokAltura,
    required this.pokPeso,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pokId: json["pok_id"],
        pokNum: json["pok_num"],
        pokNom: json["pok_nom"],
        pokeImag: json["poke_imag"],
        pokTipo: json["pok_tipo"],
        pokAltura: json["pok_altura"],
        pokPeso: json["pok_peso"],
      );

  Map<String, dynamic> toJson() => {
        "pok_id": pokId,
        "pok_num": pokNum,
        "pok_nom": pokNom,
        "poke_imag": pokeImag,
        "pok_tipo": pokTipo,
        "pok_altura": pokAltura,
        "pok_peso": pokPeso,
      };
}
