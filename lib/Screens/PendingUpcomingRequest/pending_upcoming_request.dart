import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Screens/Payments/payment_history.dart';
import 'package:restow/Screens/PendingUpcomingRequest/pending_request.dart';
import 'package:restow/Screens/PendingUpcomingRequest/upcoming_request.dart';
import '../../Widgets/icon.dart';
import '../Notifications/notifications.dart';

class PendingUpcomingRequest extends StatefulWidget {
  final int curindex;
  const PendingUpcomingRequest({Key? key, required this.curindex})
      : super(key: key);

  @override
  _PendingUpcomingRequestState createState() => _PendingUpcomingRequestState();
}

class _PendingUpcomingRequestState extends State<PendingUpcomingRequest>
    with SingleTickerProviderStateMixin {
  late int _selectedIndex;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.curindex);
    _selectedIndex = widget.curindex;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(Get.height * 0.15), // here the desired height
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.03, vertical: Get.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const AppIcon(
                      icon: Icons.arrow_back,
                    )),
                InkWell(
                  onTap: () {
                    Get.to(Notifications());
                  },
                  child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(width: 0, color: Colors.white)),
                    elevation: 8,
                    child: Padding(
                        padding: EdgeInsets.all(Get.width * 0.03),
                        child: SvgPicture.asset(
                          "assets/icons/notification.svg",
                          height: 20,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: Get.width * 0.45,
                  height: Get.height * 0.08,
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: _selectedIndex == 1
                          ? MaterialStateProperty.all<Color>(
                              const Color(0xffF4F4F4))
                          : MaterialStateProperty.all<Color>(kPrimaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Text(
                      "Pending Request",
                      style: TextStyle(
                          fontSize: 13.5,
                          color: _selectedIndex == 1
                              ? const Color(0xff858585)
                              : Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: Get.width * 0.45,
                  height: Get.height * 0.08,
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: _selectedIndex == 0
                          ? MaterialStateProperty.all<Color>(
                              const Color(0xffF4F4F4))
                          : MaterialStateProperty.all<Color>(kPrimaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Text(
                      "Upcoming Request",
                      style: TextStyle(
                          fontSize: 13.5,
                          color: _selectedIndex == 0
                              ? const Color(0xff858585)
                              : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 40,
              child: PageView(
                onPageChanged: (index) {
                  print(index);
                  _selectedIndex = index;
                  setState(() {});
                },
                controller: _pageController,
                children: [
                  PendingRequest(),
                  UpcomingRequest(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
