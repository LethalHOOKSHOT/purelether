import 'package:meta/meta.dart';
import 'package:untitled3/widgets/game_screen/healt_bar/health_bar.dart';
import '../../../model/health_bar_model.dart';
import '../../../redux/data_state.dart';

@immutable
class HealthBarState
{
  const HealthBarState({
    @required this.data,
    @required this.healthBars,
  }): assert(data == null),assert(healthBars == null);

  HealthBarState.initialState()
      :data = DataState.none(),
        healthBars = [];

  final DataState? data;
  final List<HealthBarModel>? healthBars;

  HealthBarState copyWith({
    DataState? data,
    List<HealthBarModel>? healthBars,
  }) {
    return HealthBarState(
        data: data ?? this.data,
        healthBars: healthBars ?? this.healthBars,
    );
  }
}