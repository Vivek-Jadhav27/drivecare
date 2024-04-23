import 'package:drivecare/src/presentation/customer/providers/customer_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/servicecard.dart';

class CustomerServicePage extends StatefulWidget {
  const CustomerServicePage({super.key});

  @override
  State<CustomerServicePage> createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
  List _title = [
    "Periodic Service",
    "Ac Service",
    "TYRE Service",
    "Battery Service"
  ];

  List<bool> _isSelected = [true, false, false, false];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerSerivceProvider>(
        builder: (context, provider, child) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 60,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                title: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Service",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
              ),
              body: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: false,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  _isSelected = [false, false, false, false];
                                  setState(() {
                                    _isSelected[selectedIndex] = false;
                                    selectedIndex = index;
                                    _isSelected[selectedIndex] = true;
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: _isSelected[index]
                                        ? Colors.orange
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: _isSelected[index]
                                          ? Colors.orange
                                          : Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 10, top: 5, bottom: 15),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    _title[index],
                                    style: TextStyle(
                                      color: _isSelected[index]
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: false,
                            itemCount: provider.services.length,
                            itemBuilder: (context, index) {
                              return ServiceCard(
                                service: provider.services[index],
                              );
                            }),
                      )
                    ]),
              ),
            ));
  }
}
