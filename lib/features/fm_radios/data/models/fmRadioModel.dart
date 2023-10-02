import 'package:efradera_fmradio/features/fm_radios/domain/entities/FMRadioEntity.dart';

class FmRadioModel extends FMRadioEntity {
  const FmRadioModel({
    String? radioId,
    String? radioName,
    String? radioImage,
    String? radioUrl,
    String? genre,
    String? countryName,
    String? countrycode,
  }) : super(
            radioId: radioId,
            radioName: radioName,
            radioImage: radioImage,
            radioUrl: radioUrl,
            genre: genre,
            countryName: countryName,
            countrycode: countrycode);

  factory FmRadioModel.fromJson(Map<String, dynamic> json) {
    return FmRadioModel(
        radioId: json['stationuuid'] ?? "",
        radioName: json['name'] ?? "",
        radioImage: json['favicon'] ?? "",
        radioUrl: json['url'] ?? "", //or url
        genre: json['tags'] ?? "",
        countryName: json['country'] ?? "",
        countrycode: json['countrycode'] ?? "");
  }
}
