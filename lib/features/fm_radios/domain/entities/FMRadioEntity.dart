import 'package:equatable/equatable.dart';



class FMRadioEntity extends Equatable {
  final String? radioId;
  final String? radioName;
  final String? radioImage;
  final String? radioUrl;
  final String? genre;
  final int? countryId;
  final String? countryName;
  final String? countryFlag;

  const FMRadioEntity(
      {this.radioId,
      this.radioName,
      this.radioImage,
      this.radioUrl,
      this.genre,
      this.countryId,
      this.countryName,
      this.countryFlag});

  @override
  List<Object?> get props {
    return [
      radioId,
      radioName,
      radioImage,
      radioUrl,
      genre,
      countryId,
      countryName,
      countryFlag
    ];
  }
}
