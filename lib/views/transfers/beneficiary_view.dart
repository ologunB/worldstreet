import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class BeneficiaryScreen extends StatefulWidget {
  const BeneficiaryScreen({Key? key}) : super(key: key);

  @override
  State<BeneficiaryScreen> createState() => _BeneficiaryScreenState();
}

class _BeneficiaryScreenState extends State<BeneficiaryScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Beneficiary List',
          fontSize: 24.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.h),
        child: Column(
          children: [
            WorldStreetField(
              hintText: 'Search',
              textInputType: TextInputType.text,
              maxLines: 1,
              controller: controller,
              removeOutline: true,
              textInputAction: TextInputAction.next,
              onChanged: (a) {
                setState(() {});
              },
            ),
            Expanded(
              child: controller.text.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/e-list.png', height: 172.h),
                          SizedBox(height: 24.h),
                          RegularText(
                            'No Beneficiary',
                            fontSize: 20.sp,
                            textAlign: TextAlign.center,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      children: [
                        SizedBox(height: 36.h),
                        RegularText(
                          'Search result',
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 16.h),
                        ListView.builder(
                            itemCount: 12,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (_, i) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 11.h),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(13.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.h),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 28.h,
                                          backgroundColor: Color(0xff291CC0),
                                          child: RegularText(
                                            'E',
                                            fontSize: 32.sp,
                                            textAlign: TextAlign.center,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 24.h),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 12.h),
                                            RegularText(
                                              'Emmanuel O.',
                                              fontSize: 14.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(height: 4.h),
                                            RegularText(
                                              '@emmanuelO',
                                              fontSize: 14.sp,
                                              color:
                                                  Colors.black.withOpacity(.5),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
