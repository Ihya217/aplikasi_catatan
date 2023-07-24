import 'package:get/get.dart';

class CatatanProvider extends GetConnect {
  final String url =
      "https://aplikasi-catatan-bee23-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Future<dynamic> getAllCatatan() async {
    final response = await get("$url" "catatan.json");
    return response.body;
  }

  Future<dynamic> postCatatan(judul, isi) async {
    final response = await post("$url" "catatan.json", {
      "judul": judul,
      "isi": isi,
    });
    return response.body;
  }

  Future<void> deleteCatatan(String id) async =>
      await delete("$url" "catatan/$id.json");

  Future<void> editCatatan(String id, String judul, String isi) async {
    await patch('$url' "catatan/$id.json", {
      'judul': judul,
      'isi': isi,
    });
  }
}
