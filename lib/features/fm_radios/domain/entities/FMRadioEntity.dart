import 'package:equatable/equatable.dart';



class FMRadioEntity extends Equatable {
  final String? radioId;
  final String? radioName;
  final String? radioImage;
  final String? radioUrl;
  final String? genre;
  final String? countryName;
  final String? countrycode;

  const FMRadioEntity(
      {this.radioId,
      this.radioName,
      this.radioImage,
      this.radioUrl,
      this.genre,
      this.countryName,
      this.countrycode});

  @override
  List<Object?> get props {
    return [
      radioId,
      radioName,
      radioImage,
      radioUrl,
      genre,
      countryName,
      countrycode
    ];
  }
}
