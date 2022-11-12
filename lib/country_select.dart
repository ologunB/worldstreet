import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/home/search_country.dart';
import 'package:ft_worldstreet/views/widgets/custom_text.dart';

class CountrySelect extends StatefulWidget {
  const CountrySelect({Key? key}) : super(key: key);

  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("country select"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            dynamic data = await showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
              )),
              builder: (context) {
                return const SearchCountry(selectedCountries: []);
              },
            );
            print(data);
          },
          child: const Text('Show country picker'),
        ),
      ),
    );
  }
}
