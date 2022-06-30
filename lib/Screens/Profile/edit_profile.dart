import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/icon.dart';

class EditProfile extends StatefulWidget {
  final name;
  final phone;
  final email;
  final address;
  final postcode;
  final brand;
  final vehicleno;
  EditProfile(
      {Key? key,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.postcode,
      this.brand,
      this.vehicleno})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController postcodeController = TextEditingController(text: "");
  TextEditingController brandController = TextEditingController(text: "");
  TextEditingController vnumberController = TextEditingController(text: "");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var selectedval = "Medium Tow Van";
  List<String> vehicletype = [
    "Medium Tow Van",
    "Medium Tow Van1",
    "Medium Tow Van2"
  ];

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name ?? "";
    phoneController.text = widget.phone ?? "";
    emailController.text = widget.email ?? "";
    addressController.text = widget.address ?? "";
    postcodeController.text = widget.postcode ?? "";
    brandController.text = widget.brand ?? "";
    vnumberController.text = widget.vehicleno ?? "";
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
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back,
                    )),
                SizedBox(
                  width: Get.width * 0.04,
                ),
                Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.2,
                      child: Stack(
                        children: [
                          Container(
                            height: Get.width * 0.32,
                            width: Get.width * 0.32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: kPrimaryColor, width: 2)),
                            child: CircleAvatar(
                              radius: Get.width * 0.15,
                              backgroundImage:
                                  AssetImage("assets/images/profile.png"),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: Get.width * 0.1,
                            // right: 0,
                            child: Container(
                              height: Get.height * 0.06,
                              width: Get.height * 0.06,
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4.0,
                                        spreadRadius: 2),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: CircleAvatar(
                                backgroundColor: Color(0xff3E61B9),
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            cursorColor: textcolor,
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: "Driver Name",
                              hintText: "john",
                              labelStyle: TextStyle(color: Color(0xff969696)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xff333333),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffE4E4E4),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
                          TextFormField(
                            cursorColor: textcolor,
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "johnsondoe@gmail.com",
                              labelStyle: TextStyle(color: Color(0xff969696)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xff333333),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffE4E4E4),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
                          TextFormField(
                            cursorColor: textcolor,
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              hintText: "Phone Number",
                              labelStyle: TextStyle(color: Color(0xff969696)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xff333333),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffE4E4E4),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
                          TextFormField(
                            cursorColor: textcolor,
                            controller: addressController,
                            decoration: InputDecoration(
                              labelText: "Address",
                              hintText: "Address",
                              labelStyle: TextStyle(color: Color(0xff969696)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xff333333),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffE4E4E4),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
                          TextFormField(
                            cursorColor: textcolor,
                            controller: postcodeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Postcode",
                              hintText: "35267",
                              labelStyle: TextStyle(color: Color(0xff969696)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xff333333),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffE4E4E4),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
                          TextFormField(
                            cursorColor: textcolor,
                            controller: brandController,
                            decoration: InputDecoration(
                              labelText: "Tow Vehicle  Brand",
                              hintText: "Tow Vehicle  Brand",
                              labelStyle: TextStyle(color: Color(0xff969696)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xff333333),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffE4E4E4),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
                          TextFormField(
                            cursorColor: textcolor,
                            controller: vnumberController,
                            decoration: InputDecoration(
                              labelText: "Tow Vehicle No",
                              hintText: "Tow Vehicle No",
                              labelStyle: TextStyle(color: Color(0xff969696)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xff333333),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffE4E4E4),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: Get.width,
                            height: Get.height * 0.085,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff333333)),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                menuMaxHeight: Get.height * 0.45,
                                icon: SvgPicture.asset(
                                  "assets/icons/down.svg",
                                  height: Get.width * 0.025,
                                  width: Get.width * 0.025,
                                  color: Color(0xff969696),
                                ),
                                isExpanded: true,
                                value: selectedval,
                                elevation: 5,
                                style: TextStyle(
                                    color: Color(0xff969696), fontSize: 16),
                                items: vehicletype.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontFamily: "Roboto"),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedval = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.03),
                          MyButton(onpress: () {}, btntext: "Submit"),
                          SizedBox(height: Get.height * 0.02),
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
    );
  }
}
