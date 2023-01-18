import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/custom_text.dart';
import 'package:ft_worldstreet/views/widgets/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/models/user_model.dart';
import '../../core/view_models/auth_vm.dart';
import '../leader/copy_leader_view.dart';
import '../widgets/base_view.dart';
import 'filter_view.dart';

class AllTradersView extends StatefulWidget {
  const AllTradersView({Key? key, required this.accounts}) : super(key: key);

  final List<User> accounts;
  @override
  State<AllTradersView> createState() => _AllTradersViewState();
}

class _AllTradersViewState extends State<AllTradersView> {
  int currentIndex = 0;
  PageController pageController = PageController();

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
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: RegularText(
                'Traders',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.all(24.h),
              padding: EdgeInsets.all(4.h),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(6.h),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pageController.jumpToPage(0);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.h),
                          color: currentIndex == 0
                              ? AppColors.white
                              : AppColors.lightBlue,
                        ),
                        child: RegularText(
                          'Traders',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pageController.jumpToPage(1);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.h),
                          color: currentIndex == 1
                              ? AppColors.white
                              : AppColors.lightBlue,
                        ),
                        child: RegularText(
                          'Copied Traders',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoTextField(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30.h),
                        border: Border.all(color: AppColors.dGrey),
                      ),
                      placeholder: 'Search for traders',
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.h, vertical: 6.h),
                      placeholderStyle: GoogleFonts.inter(
                        color: AppColors.dGrey,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.h),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.h),
                            topRight: Radius.circular(20.h),
                          )),
                          builder: (context) {
                            return const FilterView();
                          });
                    },
                    child: Image.asset(
                      'assets/icons/filter.png',
                      height: 24.h,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 14.h),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (a) {
                  setState(() {
                    currentIndex = a;
                  });
                },
                children: [
                  TraderList(accounts: widget.accounts),
                  BaseView<AuthViewModel>(
                    onModelReady: (m) => m.getTraderList(),
                    builder: (_, AuthViewModel usersModel, __) =>
                        usersModel.busy
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(strokeWidth: 2)
                                ],
                              )
                            : usersModel.traders == null
                                ? Center(
                                    child: RegularText(
                                      'An error has occurred',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.red,
                                    ),
                                  )
                                : TraderList(
                                    accounts: usersModel.traders!,
                                    second: true,
                                  ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class TraderList extends StatefulWidget {
  const TraderList({Key? key, required this.accounts, this.second = false})
      : super(key: key);

  final bool second;
  final List<User> accounts;
  @override
  State<TraderList> createState() => _TraderListState();
}

class _TraderListState extends State<TraderList> {
  List<User> accounts = [];

  @override
  void initState() {
    accounts = widget.accounts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return accounts.isEmpty
        ? Center(
            child: RegularText(
              'No Trader has been copied',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          )
        : ListView.builder(
            itemCount: accounts.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
            physics: const ClampingScrollPhysics(),
            itemBuilder: (c, i) {
              User u = accounts[i];
              return Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: InkWell(
                  onTap: () async {
                    dynamic data = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CopyLeaderView(
                                user: u, showUnsub: widget.second)));
                    if (data != null) {
                      accounts.removeWhere((e) => e.id == data);
                      setState(() {});
                      showSnackBar(
                        context,
                        'The Trader\'s trade has been unsubscribed from.',
                        'Success',
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(18.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/p${i % 3}.png',
                          height: 40.h,
                          width: 40.h,
                        ),
                        SizedBox(width: 8.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RegularText(
                              u.watched?.email ?? u.email ?? '',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 4.h),
                            RegularText(
                              '1st',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.dGrey,
                            ),
                          ],
                        ),
                        /*        SizedBox(width: 18.h),
                    Expanded(child: Image.asset('assets/icons/line.png')),
                    SizedBox(width: 18.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RegularText(
                          '\$ 3,457',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RegularText(
                              '0,01%',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.dGrey,
                            ),
                            const Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.green,
                            )
                          ],
                        )
                      ],
                    )*/
                      ],
                    ),
                  ),
                ),
              );
            });
  }
}

List<String> names = [
  'Daniel435',
  'Favour Eden',
  'Zakaria',
  'Richard',
  'Daniel435',
  'Favour Eden',
  'Zakaria',
  'Richard',
  'Daniel435',
  'Favour Eden',
  'Zakaria',
  'Richard'
];
