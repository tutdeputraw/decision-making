part of '../../pages/_pages.dart';

class CriteriaAndProbabilityPageView extends StatelessWidget {
  const CriteriaAndProbabilityPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CriteriaAndProbabilityPageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Isi kriteria dan probabilitasnya'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: int.parse(controller.data.jumlahKriteria.text),
              itemBuilder: (context, index) => Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.input[index].criteria,
                      decoration: InputDecoration(
                        labelText: 'kriteria $index',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.input[index].probability,
                      decoration: InputDecoration(
                        labelText: 'probabilitas $index',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              separatorBuilder: (context, index) => const Divider(
                height: 16,
                color: Colors.transparent,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: controller.lanjutOnClick,
                child: const Text('Lanjut'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
