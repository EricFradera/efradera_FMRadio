import 'dart:io';
import 'package:dio/dio.dart';
import 'package:efradera_fmradio/core/resources/data_state.dart';
import 'package:efradera_fmradio/features/fm_radios/data/data_sources/remote/FmApiService.dart';
import 'package:efradera_fmradio/features/fm_radios/data/models/fmRadioModel.dart';
import 'package:efradera_fmradio/features/fm_radios/domain/repository/fmRadioRepository.dart';

class FmRadioReposImpl implements FMRadioRepository {
  final FMApiService _newsApiService;

  FmRadioReposImpl(this._newsApiService);

  @override
  Future<DataState<List<FmRadioModel>>> getListRadios() async {
    try {
      final httpResponse = await _newsApiService.getListRadios();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSucces(httpResponse.data);
      }
      return DataFail(DioException(
        error: httpResponse.response.statusMessage,
        requestOptions: httpResponse.response.requestOptions,
        response: httpResponse.response,
        type: DioExceptionType.unknown,
      ));
    } on DioException catch (e) {
      return DataFail(e);
    }
  }
}
