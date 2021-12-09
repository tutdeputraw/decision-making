part of '_controller.dart';

class CriteriaAndProbabilityController extends GetxController {
  late List<CriteriaAndProbability> _data;

  List<CriteriaAndProbability> get data => _data;

  set data(List<CriteriaAndProbability> value) {
    _data = value;
    update();
  }
}
