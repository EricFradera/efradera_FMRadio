import 'package:dio/dio.dart' hide Headers;
import 'package:efradera_fmradio/core/constants/constants.dart';
import 'package:efradera_fmradio/features/fm_radios/data/models/fmRadioModel.dart';
import 'package:retrofit/retrofit.dart';
part 'FmApiService.g.dart';

@RestApi(baseUrl: FMListAPI)
abstract class FMApiService {
  factory FMApiService(Dio dio) = _FMApiService;

  @GET('/get_home.php')
  @Headers(<String, dynamic>{
    'X-RapidAPI-Key': 'b364ac7f21mshabdd99a96a5685cp175cf9jsnb54d9d834d4f',
    'X-RapidAPI-Host':
        'radio-world-75-000-worldwide-fm-radio-stations.p.rapidapi.com'
  })
  Future<HttpResponse<List<FmRadioModel>>> getListRadios();
}
