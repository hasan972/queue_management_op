import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:queue_management_op/home_page.dart';
import 'package:queue_management_op/theme/color/my_colors.dart';
import 'package:queue_management_op/widget/constant.dart';
import 'package:queue_management_op/widget/default_text_from_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 // TextEditingController userId = TextEditingController();
  TextEditingController ipAddress = TextEditingController();
  TextEditingController portController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ipAddress.text = ip;
    portController.text = port;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors().white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/kfc.png',
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height / 3.10,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10 * 1.2),
                        topRight: Radius.circular(10 * 1.2)),
                        ),
                child: Column(
                  children: [
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height / 5,
                    //   color: Colors.transparent,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       // Image.asset('assets/images/Transcom.png',
                    //       //     width: MediaQuery.of(context).size.width / 1.8,
                    //       //     height: MediaQuery.of(context).size.height / 11),
                    //     ],
                    //   ),
                    // ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                         
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     left: 30,
                          //     right: 30,
                          //     top: 15,
                          //   ),
                          //   child: DefaultTextFormField(
                          //     text: "User Name ",
                          //     // text: "Login ID / Mobile Number",
                          //     imageUrl: 'assets/images/user.svg',
                          //     isvisibleicon: false,
                          //     controller: userId,
                          //     inputType: TextInputType.text,
                          //     emptyMessage: 'Please enter your User Name',
                          //     obscure: false,
                          //     obsState: () {},
                          //   ),
                          // ),
                           Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                              top: 15,
                            ),
                            child: DefaultTextFormField(
                              text: 'IP Address',
                              imageUrl: 'assets/images/ip.svg',
                              isvisibleicon: false,
                              controller: ipAddress,
                              inputType: TextInputType.number,
                              emptyMessage: 'Please enter your IP Address',
                             obscure: false,
                              obsState: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                              top: 15,
                            ),
                            child: DefaultTextFormField(
                              text: 'Port',
                              imageUrl: 'assets/images/lock.svg',
                              isvisibleicon: false,
                              controller: portController,
                              inputType: TextInputType.number,
                              emptyMessage: 'Please enter your port',
                             obscure: false,
                              obsState: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(
                      height: 25,
                    ),

                    //Login Button
                    InkWell(
                      onTap: () async {
                        ip = ipAddress.text;
                        port = portController.text;
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          color: MyColors().mainColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Connect',
                          style: GoogleFonts.inter(
                            color: MyColors().white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
      ),
    );
  }
}
