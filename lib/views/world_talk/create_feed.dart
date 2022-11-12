import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateFeedView extends StatefulWidget {
  const CreateFeedView({Key? key}) : super(key: key);

  @override
  State<CreateFeedView> createState() => _CreateFeedViewState();
}

class _CreateFeedViewState extends State<CreateFeedView> {
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
              )),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegularText(
                'Draft',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.skyBlue,
                fontFamily: 'Poppins',
              ),
            ],
          ),
          SizedBox(width: 8.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.skyBlue,
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                  child: RegularText(
                    'Talk',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12.h),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 17.r,
                  backgroundColor: Colors.grey,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70.r),
                    child: Image.asset('assets/icons/image.png'),
                  ),
                ),
                SizedBox(width: 8.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.h, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.h),
                    border: Border.all(color: AppColors.skyBlue, width: 1.h),
                  ),
                  child: RegularText(
                    'Public',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.skyBlue,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _focusNode.requestFocus();
                },
                child: TextField(
                  focusNode: _focusNode,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'What do you think about the Market today?',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset('assets/icons/camera.png',
                        height: 70.h, width: 70.h),
                    SizedBox(width: 16.h),
                    ...List.generate(8, (index) => 0)
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(right: 16.h),
                            child: Image.asset(
                              'assets/icons/image.png',
                              height: 70.h,
                              width: 70.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
