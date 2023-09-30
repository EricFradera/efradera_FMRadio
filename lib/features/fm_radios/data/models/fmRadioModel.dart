import 'package:efradera_fmradio/features/fm_radios/domain/entities/FMRadioEntity.dart';

class FmRadioModel extends FMRadioEntity {
  const FmRadioModel({
    String? radioId,
    String? radioName,
    String? radioImage,
    String? radioUrl,
    String? genre,
    String? countryName,
    String? countryFlag,
  }) : super(
            radioId: radioId,
            radioName: radioName,
            radioImage: radioImage,
            radioUrl: radioUrl,
            genre: genre,
            countryName: countryName,
            countryFlag: countryFlag);

  factory FmRadioModel.fromJson(Map<String, dynamic> json) {
    return FmRadioModel(
        radioId: json['radio_id'] ?? "",
        radioName: json['radio_name'] ?? "",
        radioImage: json['radio_image'] ?? "",
        radioUrl: json['radio_url'] ?? "",
        genre: json['genre'] ?? "",
        countryName: json['country_name'] ?? "",
        countryFlag: json['country_flag'] ?? "");
  }
}
