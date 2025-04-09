import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 149,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xffCE048C), Color(0xff4D0A8E)],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.asset(Assets.assetsLogo,fit: BoxFit.fill,),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 50,left: 30),
          child: Text('CYBER \nLINIO',style: TextStyle(
              color: Color(0xffF4BD46),
              fontSize: 24,
              fontWeight: FontWeight.w800
          ),),
        )

      ],
    );
  }
}
