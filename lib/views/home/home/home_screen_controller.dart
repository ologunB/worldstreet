import 'package:ft_worldstreet/data/models/binance_model.dart';
import 'package:ft_worldstreet/data/models/cryptoasset_modal.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:ft_worldstreet/views/global_controller.dart';
import 'package:ft_worldstreet/utils/images.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final globalController = Get.put<GlobalController>(GlobalController());

  @override
  Future<void> onInit() async {
    super.onInit();
    _apiCallForGetResendOtp();
    apiBinance();
  }

  Future<void> _apiCallForGetResendOtp() async {
    try {
      final response = await ApiService.makecryptoApiCall();

      globalController.cryptoModel.value =
          (response as List).map((p) => CryptoModal.fromJson(p)).toList();
      // await apiBinance();
    } catch (e) {
      return;
    }
  }

  Future<void> apiBinance() async {
    try {
      final response = await ApiService.makecryptoBinanceCall(
        "get-binance",
      );

      List<BinanceModal> balances = (response['message']['balances'] as List)
          .map((p) => BinanceModal.fromJson(p))
          .toList();

      BinanceModal usdt =
          balances.where((element) => (element.asset == "USDT")).first;

      globalController
          .updatebinance(double.parse(usdt.free!).toStringAsFixed(2));
    } catch (e) {
      return;
    }
  }

  List rewardImageList = [
    ImageConstant.car1,
    ImageConstant.car,
    ImageConstant.car1,
    ImageConstant.car,
  ];
  List profileImageList = [
    ImageConstant.person1,
    ImageConstant.person2,
  ];
  List cardList = [
    ImageConstant.card,
    ImageConstant.card2,
  ];
}
