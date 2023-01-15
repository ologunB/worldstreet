import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class JournalDetailsView extends StatefulWidget {
  const JournalDetailsView({Key? key}) : super(key: key);

  @override
  State<JournalDetailsView> createState() => _JournalDetailsViewState();
}

class _JournalDetailsViewState extends State<JournalDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 6.h),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 24.h,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.h),
        children: [
          RegularText(
            'Journal',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 24.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.h),
            child: Image.asset('assets/icons/j0.png'),
          ),
          SizedBox(height: 16.h),
          RegularText(
            'The perfect way to trade and make great profit covered.',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              RegularText(
                'Today, 4:00 PM, ',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.dGrey,
              ),
              RegularText(
                'by Tosin',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.skyBlue,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          RegularText(
            'Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. Sandra Fredriksson RFID. Filotillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. ',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
