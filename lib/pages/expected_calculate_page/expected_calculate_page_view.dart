part of '../../pages/_pages.dart';

class ExpectedCalculatePageView extends StatelessWidget {
  const ExpectedCalculatePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExpectedCalculatePageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menghitung resiko'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: int.parse(controller.dataSet.jumlahAlternatif.text) + 1,
              itemBuilder: (context, index1) {
                if (index1 != 0) {
                  return Row(
                    children: List.generate(
                      controller.getCriteriaLength + 2,
                      (index) {
                        if (index == controller.getCriteriaLength + 1) {
                          return Expanded(
                            child: TextFormField(
                              readOnly: true,
                              // initialValue: '5',
                              controller: controller.textEditingController[index1]
                                  [index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          );
                        } else if (index != 0) {
                          return Expanded(
                            child: TextFormField(
                              readOnly:
                                  index1 == index || (index1 == 0) ? true : false,
                              controller: index1 == index || (index1 == 0)
                                  ? controller.setTextEditing(index1, index)
                                  : controller.textEditingController[index1]
                                      [index],
                              // initialValue: index1 == index || (index1 == 0)
                              //     ?
                              //     controller.calculatePayoff(controller
                              //         .criteriaAndProbability[index - 1]
                              //         .criteria
                              //         .value
                              //         .text
                              //         )
                              //     :
                              //     // '$index1 && $index'
                              //     '0',
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          );
                        } else {
                          return Expanded(
                            flex: -1,
                            child: Container(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text('Alternatif ${index1 + 1}'),
                            ),
                          );
                        }
                      },
                    ),
                  );
                }
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: -1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('kriteria'),
                              Container(
                                padding: const EdgeInsets.only(right: 3),
                                child: const Text(
                                  'Probabilitas',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: List.generate(
                              controller.getCriteriaLength + 1,
                              (index) {
                                if (index != controller.getCriteriaLength) {
                                  return Expanded(
                                    child: Column(
                                      children: [
                                        Text('index $index'),
                                        Text(controller
                                            .criteriaAndProbability[index]
                                            .criteria
                                            .value
                                            .text),
                                        Text(controller
                                            .criteriaAndProbability[index]
                                            .probability
                                            .value
                                            .text),
                                      ],
                                    ),
                                  );
                                } else {
                                  return const Expanded(
                                    child: Text(
                                      'Expected Return',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 0,
                color: Colors.transparent,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: controller.hitungOnClick,
                child: const Text('HITUNG'),
              ),
            )
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(children: [
      //     ListView.separated(
      //       padding: const EdgeInsets.all(16),
      //       shrinkWrap: true,
      //       itemCount: controller.getCriteriaLength,
      //       itemBuilder: (context, index) => Column(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: [
      //           Text(
      //             'Alternatif $index',
      //             style: const TextStyle(
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           const SizedBox(height: 8),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               const Text('Diagonal pay off'),
      //               Text(
      //                 controller.calculatePayoff(controller
      //                     .criteriaAndProbability[index].criteria.text),
      //               )
      //             ],
      //           ),
      //           const SizedBox(height: 8),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               const Text('Expected return'),
      //               Text(
      //                 controller.calculatePayoff(controller
      //                     .criteriaAndProbability[index].criteria.text),
      //               )
      //             ],
      //           ),
      //         ],
      //       ),
      //       separatorBuilder: (context, index) => const Divider(
      //         height: 16,
      //         color: Colors.transparent,
      //       ),
      //     ),
      //   ]),
      // ),
    );
  }
}
