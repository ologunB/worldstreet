import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/models/cryptoasset_modal.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'home_screen_controller.dart';
import 'package:ft_worldstreet/views/global_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/images.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final currencyFormatter = NumberFormat.currency(locale: 'en_US', symbol: "");
  final globalController = Get.put<GlobalController>(GlobalController());
  final homeScreenController =
      Get.put<HomeScreenController>(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage(
                            homeScreenController.cardList[index],
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Crypto Market",
                            style: const TextStyle(color: AppColors.white)
                                .normal12w400,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Balance",
                                    style:
                                        const TextStyle(color: AppColors.white)
                                            .normal14w400,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  index == 0
                                      ? Obx(
                                          () => Text(
                                            "\$${globalController.binace}",
                                            style: const TextStyle(
                                                    color: AppColors.white)
                                                .normal32w600,
                                          ),
                                        )
                                      : Text(
                                          "\$0.00",
                                          style: const TextStyle(
                                                  color: AppColors.white)
                                              .normal32w600,
                                        ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                width: 64,
                                height: 31,
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        ImageConstant.uparrow,
                                        width: 10,
                                      ),
                                      Text(
                                        "+15%",
                                        style: const TextStyle(
                                                color: AppColors.white)
                                            .normal14w400,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Image.asset(
                                ImageConstant.cardarrow,
                                width: 15,
                                height: 15,
                              ),
                              Text(
                                "\$1,816",
                                style: const TextStyle(color: AppColors.white)
                                    .normal14w400,
                              ),
                              Text(
                                "Today’s Profit",
                                style: const TextStyle(color: AppColors.white)
                                    .normal14w400,
                              ),
                              const Spacer(),
                              Image.asset(
                                ImageConstant.dote,
                                width: 20,
                                height: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "Assets",
                    style: const TextStyle().normal20w600,
                  ),
                  const Spacer(),
                  Text(
                    "view all",
                    style:
                        const TextStyle(color: AppColors.skyBlue).normal14w400,
                  ),
                ],
              ),
            ),
            Obx(
              () => globalController.cryptoModel.value.length > 1
                  ? SizedBox(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: globalController.cryptoModel.value.length,
                          itemBuilder: (context, index) {
                            CryptoModal cryptoModal =
                                globalController.cryptoModel.value[index];
                            return Container(
                              margin: const EdgeInsets.all(10),
                              height: 150,
                              width: 188,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cryptoModal.name!,
                                              style: const TextStyle()
                                                  .normal14w500,
                                            ),
                                            Text(
                                              cryptoModal.short!,
                                              style: const TextStyle()
                                                  .normal12w200,
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Image.network(
                                              cryptoModal.image!,
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          "\$${currencyFormatter.format(double.parse(cryptoModal.price!))}",
                                          style: const TextStyle().normal20w600,
                                        ),
                                        const Spacer(),
                                        Text(
                                          "${double.parse(cryptoModal.percentage!).toStringAsFixed(2)}% ^",
                                          style: const TextStyle(
                                                  color: AppColors.skyBlue)
                                              .normal12w400,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  : const Center(
                      child: Text("Loading"),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "Top traders",
                    style: const TextStyle().normal20w600,
                  ),
                  const Spacer(),
                  Text(
                    "view all",
                    style:
                        const TextStyle(color: AppColors.skyBlue).normal14w400,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: context.width,
              height: 200,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: false,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: 72,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(homeScreenController
                                        .profileImageList[index]),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daniel435",
                                  style: const TextStyle().normal16w600,
                                ),
                                const Spacer(),
                                Text(
                                  "1st",
                                  style: const TextStyle().normal12w200,
                                )
                              ],
                            ),
                            const Spacer(),
                            Image.asset(
                              ImageConstant.graph,
                              width: 80,
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  "\$3,457",
                                  style: const TextStyle().normal16w600,
                                ),
                                const Spacer(),
                                Text(
                                  "0.01^",
                                  style: const TextStyle(
                                          color: AppColors.greenUnread)
                                      .normal12w200,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "Rewards",
                    style: const TextStyle().normal20w600,
                  ),
                  const Spacer(),
                  Text(
                    "view all",
                    style:
                        const TextStyle(color: AppColors.skyBlue).normal14w400,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeScreenController.rewardImageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: 180,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(
                                homeScreenController.rewardImageList[index]),
                            fit: BoxFit.cover),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "Copy traders",
                    style: const TextStyle().normal20w600,
                  ),
                  const Spacer(),
                  Text(
                    "view all",
                    style:
                        const TextStyle(color: AppColors.skyBlue).normal14w400,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeScreenController.profileImageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: 150,
                      width: 188,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Daniel435",
                                      style: const TextStyle().normal14w500,
                                    ),
                                    Text(
                                      "ETH",
                                      style: const TextStyle().normal12w200,
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(40),
                                    image: DecorationImage(
                                        image: AssetImage(homeScreenController
                                            .profileImageList[index]),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  "1,132,151",
                                  style: const TextStyle().normal20w600,
                                ),
                                const Spacer(),
                                Text(
                                  "2.35% ^",
                                  style:
                                      const TextStyle(color: AppColors.skyBlue)
                                          .normal12w400,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    )

        //Deawer

        );
  }

  Future<void> apiCallForLogout() async {
    Map<String, dynamic> paras = {};
    try {
      await ApiService.makeApiCall("logout", ApiMethodType.post, params: paras);
      Get.toNamed(AppRouter.loginScreen);
    } catch (e) {
      return;
    }
  }
}
