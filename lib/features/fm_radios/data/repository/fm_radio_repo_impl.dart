import 'package:efradera_fmradio/core/resources/data_state.dart';
import 'package:efradera_fmradio/features/fm_radios/data/models/fmRadio.dart';
import 'package:efradera_fmradio/features/fm_radios/domain/repository/fmRadioRepository.dart';

class FmRadioReposImpl implements FMRadioRepository {
  @override
  Future<DataState<List<FmRadioModel>>> getListRadios() {
    // TODO: implement getListRadios
    throw UnimplementedError();
  }
}
