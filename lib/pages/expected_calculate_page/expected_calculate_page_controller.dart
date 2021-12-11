part of '../../pages/_controller.dart';

class ExpectedCalculatePageController extends GetxController {
  late List<List<TextEditingController>> textEditingController;

  DataSet dataSet = Get.put(DataSetController()).dataSet;
  List<CriteriaAndProbability> criteriaAndProbability =
      Get.put(CriteriaAndProbabilityController()).data;

  void goToPage() {
    print('dataSet.jumlahAlternatif.textss: ' +
        int.parse(dataSet.jumlahAlternatif.text).toString());
    print(criteriaAndProbability.length + 1);
    textEditingController = List.generate(
      // criteriaAndProbability.length + 1,
      int.parse(dataSet.jumlahAlternatif.text) + 2,
      (indexA) => List.generate(
        criteriaAndProbability.length + 2,
        (indexB) {
          return TextEditingController(text: '0');
        },
      ),
    );

    Get.to(const ExpectedCalculatePageView());
  }

  TextEditingController setTextEditing(indexA, indexB) {
    final x = textEditingController[indexA][indexB];
    print('indexA $indexA');
    print('indexB $indexB');
    print(criteriaAndProbability[indexB - 1].criteria.value.text);
    x.text =
        calculatePayoff(criteriaAndProbability[indexB - 1].criteria.value.text);
    update();
    return x;
  }

  void hitungOnClick() {
    print('textEditingController[1][1].text: ' +
        textEditingController[1][1].text);
    print('textEditingController[2][2].text: ' +
        textEditingController[2][2].text);
    calculateExpectedReturn();
  }

  void calculateExpectedReturn() {
    for (int i = 1; i < int.parse(dataSet.jumlahAlternatif.text) + 2; i++) {
      double attempt = 0;
      for (int j = 1; j < criteriaAndProbability.length + 2; j++) {
        if (j <= criteriaAndProbability.length) {
          attempt+= double.parse(textEditingController[i][j].text) * double.parse(criteriaAndProbability[j - 1].probability.text);
          print(
              'i=$i j=$j \t ${textEditingController[i][j].text}\t probabilitas: ${criteriaAndProbability[j - 1].probability.text}');
        }
        if(j == criteriaAndProbability.length + 1){
          textEditingController[i][j].text=attempt.toString();
          update();
        }
      }
      print('\n');
    }
  }

  String calculatePayoff(String kesediaan) {
    double calculate = (convertToDouble(dataSet.biayaPenjualan.text) *
            convertToDouble(kesediaan)) -
        (convertToDouble(dataSet.biayaProduksi.text) *
            convertToDouble(kesediaan));

    return calculate.toString();
  }

  double convertToDouble(String data) {
    return double.parse(data);
  }

  int get getCriteriaLength {
    return int.parse(dataSet.jumlahKriteria.text);
  }

  String getCriteriaByIndex(int index) {
    return criteriaAndProbability[index].criteria.text;
  }

  String getJumlahDanProbabilitas(index) {
    return '${criteriaAndProbability[index].criteria.text} = ${criteriaAndProbability[index].probability.text}';
  }
}
