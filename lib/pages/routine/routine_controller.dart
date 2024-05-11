import 'package:get/get.dart';
import '../../models/entities/BodyPart.dart';

class RoutineController extends GetxController {
  Rx<BodyPart?> selectedBodyPart = Rx<BodyPart?>(null);

  List<BodyPart> bodyPartList = [
    BodyPart(
      id: 1,
      name: 'ABDOMEN',
    ),
    BodyPart(
      id: 2,
      name: 'PIERNAS',
    ),
    BodyPart(
      id: 3,
      name: 'PECHO',
    ),
    BodyPart(
      id: 4,
      name: 'HOMBROS',
    ),
  ];

  void setSelectedBodyPart(BodyPart? newValue) {
    selectedBodyPart.value = newValue;
  }
}
