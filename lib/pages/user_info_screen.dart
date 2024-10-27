import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 1096,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFF2F5FA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x663F526C),
                blurRadius: 80,
                offset: Offset(0, 40),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: -74,
                top: 42,
                child: SizedBox(
                  width: 375,
                  height: 64,
                  child: Stack(
                    children: [
                      Positioned(
                        left: -67,
                        top: 14,
                        child: Container(
                          width: 360,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x70538EBB),
                                      blurRadius: 30,
                                      offset: Offset(0, 10),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 36,
                                      height: 36,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: 36,
                                              height: 36,
                                              decoration: const ShapeDecoration(
                                                color: Colors.white,
                                                shape: OvalBorder(),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 6,
                                            top: 6,
                                            child: SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: const FlutterLogo(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 274,
                top: 209,
                child: Container(
                  width: 31,
                  height: 28,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/31x28"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 360,
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Opacity(
                              opacity: 0.50,
                              child: Container(
                                width: 4,
                                height: 4,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF313033),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 13),
                            const Opacity(
                              opacity: 0.60,
                              child: Text(
                                '12:00',
                                style: TextStyle(
                                  color: Color(0xFF313033),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 237),
                      SizedBox(
                        height: 14,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 6),
                            const SizedBox(width: 6),
                            Container(
                              width: 8,
                              height: 13,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/8x13"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -266,
                top: 0,
                child: SizedBox(width: 320, height: 209),
              ),
              const Positioned(
                left: 11,
                top: 245,
                child: Text(
                  'Jhon Doe',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 16,
                top: 351,
                child: Text(
                  'Document Type',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                top: 393,
                child: Text(
                  'Country',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 22,
                top: 930,
                child: Text(
                  'Eth account',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 22,
                top: 1013,
                child: Text(
                  'Eth Address Lyf',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                top: 441,
                child: Text(
                  'Birth Date',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                top: 441,
                child: Text(
                  'Birth Date',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                top: 485,
                child: Text(
                  'Membership',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 17,
                top: 544,
                child: Text(
                  'Skills',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 22,
                top: 891,
                child: Text(
                  'Payment',
                  style: TextStyle(
                    color: Color(0xFF120E1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
              const Positioned(
                left: 176,
                top: 352,
                child: SizedBox(
                  width: 88,
                  height: 31,
                  child: Text(
                    'Passport',
                    style: TextStyle(
                      color: Color(0xFF646366),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 176,
                top: 393,
                child: SizedBox(
                  width: 88,
                  height: 31,
                  child: Text(
                    'Ecuador',
                    style: TextStyle(
                      color: Color(0xFF646366),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 22,
                top: 954,
                child: SizedBox(
                  width: 307,
                  height: 31,
                  child: Text(
                    '0x126cf2992cC4f9E84798a20dfE8aF700901a75e7',
                    style: TextStyle(
                      color: Color(0xFF646366),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 22,
                top: 1037,
                child: SizedBox(
                  width: 307,
                  height: 31,
                  child: Text(
                    '0x126cf2992cC4f9E84798a20dfE8aF700901a75e7',
                    style: TextStyle(
                      color: Color(0xFF646366),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 176,
                top: 485,
                child: SizedBox(
                  width: 88,
                  height: 31,
                  child: Text(
                    'Golden',
                    style: TextStyle(
                      color: Color(0xFF646366),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 176,
                top: 441,
                child: SizedBox(
                  width: 88,
                  height: 31,
                  child: Text(
                    '1/10/1995',
                    style: TextStyle(
                      color: Color(0xFF646366),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 264,
                top: 250,
                child: SizedBox(
                  width: 36,
                  height: 49.32,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 36,
                          height: 49.32,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 8.22,
                        child: Container(
                          width: 24,
                          height: 32.88,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: const FlutterLogo(),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 8.22,
                        child: Container(
                          width: 24,
                          height: 32.88,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x70538EBB),
                                blurRadius: 30,
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: const FlutterLogo(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 275,
                top: 531,
                child: SizedBox(
                  width: 36,
                  height: 49.32,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 36,
                          height: 49.32,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 8.22,
                        child: Container(
                          width: 24,
                          height: 32.88,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: const FlutterLogo(),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 8.22,
                        child: Container(
                          width: 24,
                          height: 32.88,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x70538EBB),
                                blurRadius: 30,
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: const FlutterLogo(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 106,
                top: 106,
                child: SizedBox(
                  width: 152,
                  height: 133,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 152,
                          height: 133,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -32.57,
                        top: -92.62,
                        child: Container(
                          width: 233.43,
                          height: 362.95,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://via.placeholder.com/233x363"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 283,
                top: 481,
                child: Container(
                  width: 30,
                  height: 28,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const FlutterLogo(),
                ),
              ),
              const Positioned(
                left: 16,
                top: 583,
                child: SizedBox(
                  width: 300,
                  height: 95,
                  child: Text(
                    'I am a skilled and professional teacher with over 10 years of teaching students and preparing them to ace their final secondary school examination.',
                    style: TextStyle(
                      color: Color(0xFF646366),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 699,
                child: Container(
                  width: 360,
                  height: 174,
                  decoration: const BoxDecoration(color: Color(0xFFF2F5FA)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(width: 360, height: 56),
                            ),
                            Container(
                              width: double.infinity,
                              height: 56,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFEADDFF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                          ),
                                          child: const Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: Text(
                                                    'A',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF4F378A),
                                                      fontSize: 16,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.09,
                                                      letterSpacing: 0.15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              'Programming: Java  20 usd',
                                              style: TextStyle(
                                                color: Color(0xFF1D1B20),
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                height: 0.09,
                                                letterSpacing: 0.50,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(width: 360, height: 56),
                            ),
                            Container(
                              width: double.infinity,
                              height: 56,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFEADDFF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                          ),
                                          child: const Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: Text(
                                                    'A',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF4F378A),
                                                      fontSize: 16,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.09,
                                                      letterSpacing: 0.15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              'English Advanced .   15 usd',
                                              style: TextStyle(
                                                color: Color(0xFF1D1B20),
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                height: 0.09,
                                                letterSpacing: 0.50,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(width: 360, height: 56),
                            ),
                            Container(
                              width: double.infinity,
                              height: 56,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFEADDFF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                          ),
                                          child: const Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: Text(
                                                    'A',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF4F378A),
                                                      fontSize: 16,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.09,
                                                      letterSpacing: 0.15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              'Digital Marketing .     15 usd',
                                              style: TextStyle(
                                                color: Color(0xFF1D1B20),
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                height: 0.09,
                                                letterSpacing: 0.50,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                      
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 11,
                top: 275,
                child: SizedBox(
                  width: 238,
                  height: 26,
                  child: Text(
                    'Team Lead @ Meta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 43,
                top: 306,
                child: SizedBox(
                  width: 252,
                  height: 18,
                  child: Text(
                    'English, Spanish ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 11,
                top: 301,
                child: Container(
                  width: 21,
                  height: 27,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const FlutterLogo(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}