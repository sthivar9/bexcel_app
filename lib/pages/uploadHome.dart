import 'package:bexcel/pages/examplchart.dart';
import 'package:bexcel/pages/examplestate.dart';
import 'package:bexcel/storage/upload_page.dart';
import 'package:bexcel/utils/Custom_Container_Button.dart';
import 'package:bexcel/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddHome extends StatefulWidget {
  const AddHome({super.key});

  @override
  State<AddHome> createState() => _AddHomeState();
}

class _AddHomeState extends State<AddHome> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Set the status bar color
      statusBarIconBrightness:
          Brightness.light, // Dark icons for light background
    ));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi,",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 26,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "DASHBOARD",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 32,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainerButton(
                      bcolor: Color.fromARGB(255, 247, 200, 70),
                      bwidth: 150,
                      bheight: 90,
                      bicon: Icons.shopping_bag_sharp,
                      btext: "",
                    ),
                    CustomContainerButton(
                      bcolor: Color.fromRGBO(252, 87, 78, 1),
                      bwidth: 210,
                      bheight: 90,
                      bicon: Icons.people,
                      btext: "CUSTOMER",
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainerButton(
                      bcolor: Color.fromRGBO(252, 87, 78, 1),
                      bwidth: 220,
                      bheight: 90,
                      bicon: Icons.attach_money,
                      btext: "INVENTORY",
                    ),
                    CustomContainerButton(
                      bcolor: Color.fromRGBO(138, 233, 128, 1),
                      bwidth: 150,
                      bheight: 90,
                      bicon: Icons.cases_outlined,
                      btext: "",
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomButton(
                        text: "upload photo",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UploadPage()));
                        }),
                    const SizedBox(
                      width: 6,
                    ),
                    CustomButton(
                        text: "Heat Map",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Examplestate()));
                        }),
                    const SizedBox(
                      width: 6,
                    ),
                    CustomButton(
                        text: "Line Chart",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LineChartSample()));
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
