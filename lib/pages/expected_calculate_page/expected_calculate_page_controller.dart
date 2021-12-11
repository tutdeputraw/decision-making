part of '../../pages/_controller.dart';

class ExpectedCalculatePageController extends GetxController {
  bool _isClicked = false;
  String _hasilTerbaik = '';
  String _alternatifTerbaik = '';
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
    String buffer;
    for (int i = 1; i < int.parse(dataSet.jumlahAlternatif.text) + 2; i++) {
      double attempt = 0;
      for (int j = 1; j < criteriaAndProbability.length + 2; j++) {
        if (j <= criteriaAndProbability.length) {
          attempt += double.parse(textEditingController[i][j].text) *
              double.parse(criteriaAndProbability[j - 1].probability.text);
          print(
              'i=$i j=$j \t ${textEditingController[i][j].text}\t probabilitas: ${criteriaAndProbability[j - 1].probability.text}');
        }
        if (j == criteriaAndProbability.length + 1) {
          textEditingController[i][j].text = attempt.toString();

          if (i == 1) {
            hasilTerbaik = textEditingController[i][j].text;
            alternatifTerbaik = (i).toString();
            // hasilTerbaik = (i+1).toString();
          } else if (double.parse(textEditingController[i][j].text) >
              double.parse(hasilTerbaik)) {
            hasilTerbaik = textEditingController[i][j].text;
            // hasilTerbaik = (i+1).toString();
            alternatifTerbaik = (i).toString();
          }
          update();
        }
      }
      print('\n');
    }
    Get.defaultDialog(
      title: "Hasil Terbaik",
      middleText: 'alternatif $alternatifTerbaik',
      backgroundColor: Colors.green,
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
    );
    isClicked = true;
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

  bool get isClicked => _isClicked;

  set isClicked(bool value) {
    _isClicked = value;
    update();
  }

  String get hasilTerbaik => _hasilTerbaik;

  set hasilTerbaik(String value) {
    _hasilTerbaik = value;
    update();
  }

  String get alternatifTerbaik => _alternatifTerbaik;

  set alternatifTerbaik(String value) {
    _alternatifTerbaik = value;
    update();
  }
}
