part of '../../pages/_controller.dart';

class HomePageController extends GetxController {
  TextEditingController _biayaProduksi = TextEditingController();
  TextEditingController _biayaPenjualan = TextEditingController();
  TextEditingController _jumlahAlternatif = TextEditingController();
  TextEditingController _jumlahKriteria = TextEditingController();

  void lanjutOnClick() {
    if (!isInputEmpty) {
      storeDataSet();
      Get.put(CriteriaAndProbabilityPageController()).goToPage();
    }
  }

  void storeDataSet() {
    final controller = Get.put(DataSetController());
    controller.dataSet = DataSet(
      biayaProduksi: biayaProduksi,
      biayaPenjualan: biayaPenjualan,
      jumlahAlternatif: jumlahAlternatif,
      jumlahKriteria: jumlahKriteria,
    );
  }

  bool get isInputEmpty {
    return biayaProduksi.text.isEmpty &&
        biayaPenjualan.text.isEmpty &&
        jumlahKriteria.text.isEmpty &&
        jumlahAlternatif.text.isEmpty;
  }

  TextEditingController get jumlahKriteria => _jumlahKriteria;

  set jumlahKriteria(TextEditingController value) {
    _jumlahKriteria = value;
    update();
  }

  TextEditingController get jumlahAlternatif => _jumlahAlternatif;

  set jumlahAlternatif(TextEditingController value) {
    _jumlahAlternatif = value;
    update();
  }

  TextEditingController get biayaPenjualan => _biayaPenjualan;

  set biayaPenjualan(TextEditingController value) {
    _biayaPenjualan = value;
    update();
  }

  TextEditingController get biayaProduksi => _biayaProduksi;

  set biayaProduksi(TextEditingController value) {
    _biayaProduksi = value;
    update();
  }
}
