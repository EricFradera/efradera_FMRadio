import 'package:efradera_fmradio/core/resources/data_state.dart';
import 'package:efradera_fmradio/core/usecases/useCase.dart';
import 'package:efradera_fmradio/features/fm_radios/domain/entities/FMRadioEntity.dart';
import 'package:efradera_fmradio/features/fm_radios/domain/repository/fmRadioRepository.dart';

class GetFmListUseCase
    implements UseCase<DataState<List<FMRadioEntity>>, void> {
  final FMRadioRepository _fmRadioRepository;
  GetFmListUseCase(this._fmRadioRepository);
  @override
  Future<DataState<List<FMRadioEntity>>> call({void params}) {
    return _fmRadioRepository.getListRadios();
  }
}
