import 'package:untitled3/widgets/game_screen/battle_options/body_part.dart';

class SelectedParts {
  final BodyPart protectedPart;
  final BodyPart attackedPrt;

  SelectedParts(this.protectedPart, this.attackedPrt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedParts &&
          other.protectedPart == protectedPart &&
          other.attackedPrt == attackedPrt;
}
