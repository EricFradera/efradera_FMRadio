import 'package:efradera_fmradio/core/resources/data_state.dart';
import 'package:efradera_fmradio/features/fm_radios/domain/entities/FMRadioEntity.dart';

abstract class FMRadioRepository {
  Future<DataState<List<FMRadioEntity>>> getListRadios();
}
