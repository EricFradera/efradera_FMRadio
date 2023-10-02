import 'package:dio/dio.dart' hide Headers;
import 'package:efradera_fmradio/core/constants/constants.dart';
import 'package:efradera_fmradio/features/fm_radios/data/models/fmRadioModel.dart';
import 'package:retrofit/retrofit.dart';
part 'FmApiService.g.dart';

@RestApi(baseUrl: FMListAPI)
abstract class FMApiService {
  factory FMApiService(Dio dio) = _FMApiService;

  @GET('/topclick')
  Future<HttpResponse<List<FmRadioModel>>> getListRadios(
      {@Query("limit") int? limit});
}
