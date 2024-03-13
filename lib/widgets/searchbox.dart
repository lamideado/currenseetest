import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:currenseetest/services/functions.dart';
import 'package:currenseetest/themes/colors.dart';

class SearchBarr extends StatefulWidget {
  const SearchBarr({super.key});
  static TextEditingController searchcontroller =
  TextEditingController(text: '');

  @override
  _SearchBarrState createState() => _SearchBarrState();
}

class _SearchBarrState extends State<SearchBarr> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                        child: TextField(
                          controller: SearchBarr.searchcontroller,
                          decoration: InputDecoration(
                              hintText: 'Search a Keyword or a Phrase',
                              hintStyle: GoogleFonts.lato(),
                              border: InputBorder.none),
                        ))
                  ],
                )),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.darkgrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
