part of '../../pages/_controller.dart';

class CriteriaAndProbabilityPageController extends GetxController {
  late List<CriteriaAndProbability> input;
  DataSet data = Get.put(DataSetController()).dataSet;

  void goToPage() {
    generateInput();
    Get.to(const CriteriaAndProbabilityPageView());
  }

  void generateInput() {
    input = List.generate(
      int.parse(data.jumlahKriteria.text),
      (index) => CriteriaAndProbability(
        criteria: TextEditingController(),
        probability: TextEditingController(),
      ),
    );
  }

  void lanjutOnClick() {
    Get.put(CriteriaAndProbabilityController()).data = input;
    Get.put(ExpectedCalculatePageController()).goToPage();
  }
}
