part of '_controller.dart';

class DataSetController extends GetxController {
  late DataSet _dataSet;

  DataSet get dataSet => _dataSet;

  set dataSet(DataSet value) {
    _dataSet = value;
    update();
  }
}
