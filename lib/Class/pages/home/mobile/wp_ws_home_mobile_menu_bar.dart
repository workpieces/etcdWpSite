import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/common/workpieces_websites_common.dart';
import '../../common/wp_ws_url_unit.dart';

class WPWSHomeMobileMenuBar extends StatelessWidget {
  const WPWSHomeMobileMenuBar({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 88,
      child: Center(
        child: SizedBox(
          width: width,
          child: Row(
            children: [
              Image.asset(
                "images/logo/logo.png",
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                borderRadius: BorderRadius.circular((8.0)),
                child: Text("etcdwp",
                    style: GoogleFonts.sourceSerifPro(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Color(0xff000000),
                      ),
                    )),
              ),
              const Spacer(),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  color: const Color(0x72f1f1f1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular((8.0)),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular((8.0)),
                  onTap: () {
                    WPWSURLUnit.openGithub();
                  },
                  child: Center(
                    child: Text(
                      "Doc",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: const Color(0xb5000000),
                        fontFamily: TextStyleConstant.fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  color: const Color(0x72f1f1f1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular((8.0)),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular((8.0)),
                  onTap: () {
                    WPWSURLUnit.openTwitter();
                  },
                  child: Center(
                    child: Image.asset(
                      "images/web_icon/twitter.png",
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  color: const Color(0x72f1f1f1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular((8.0)),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular((8.0)),
                  onTap: () {
                    WPWSURLUnit.openGithub();
                  },
                  child: Center(
                    child: Image.asset(
                      "images/web_icon/github.png",
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
