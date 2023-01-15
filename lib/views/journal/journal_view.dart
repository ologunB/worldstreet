import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../journal/journal_details_view.dart';
import '../widgets/custom_text.dart';

class JournalView extends StatefulWidget {
  const JournalView({Key? key}) : super(key: key);

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: RegularText(
          'Journal',
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 12.h),
          ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.h),
              physics: const ClampingScrollPhysics(),
              itemBuilder: (_, i) {
                return JournalItem(i: i);
              }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: RegularText(
              'UPCOMING EVENTS',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.dGrey,
              fontFamily: 'Gilroy',
            ),
          ),
          ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.h),
              physics: const ClampingScrollPhysics(),
              itemBuilder: (_, i) {
                return JournalItem(i: i);
              }),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}

class JournalItem extends StatelessWidget {
  const JournalItem({Key? key, required this.i}) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: InkWell(
        onTap: () {
          push(context, const JournalDetailsView());
        },
        child: Container(
          padding: EdgeInsets.all(14.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/icons/j${i.isEven ? 0 : 1}.png',
                  height: 80.h,
                  width: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText(
                      'Sandra Fredriksson RFID. Filopod tillväxtföretag genade. Barbro tosa. Rune Löfgren issade med desism. ',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 4.h),
                    RegularText(
                      'Today, 4:00 PM',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.dGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
