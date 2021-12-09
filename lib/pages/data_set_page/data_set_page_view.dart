part of '../../pages/_pages.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Resiko'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Membuat Data Set'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.biayaProduksi,
                    decoration: const InputDecoration(
                      labelText: 'Biaya Produksi',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.biayaPenjualan,
                    decoration: const InputDecoration(
                      labelText: 'Biaya Penjualan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.jumlahAlternatif,
                    decoration: const InputDecoration(
                      labelText: 'Jumlah alternatif',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.jumlahKriteria,
                    decoration: const InputDecoration(
                      labelText: 'Jumlah kriteria',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.lanjutOnClick,
              child: const Text('Lanjut'),
            )
          ],
        ),
      ),
    );
  }
}
