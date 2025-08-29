import 'package:demo_app/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/viewmodel/auth_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int selectedValue = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 65,
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/user_avatar.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: SizedBox(
                height: 45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Welcome!", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8))),
                    Text("AnhQuoc", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Align(
                alignment: AlignmentGeometry.center,
                child: Icon(
                  Icons.settings,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {},
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 6,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [Color(0xFF00B2E7), Color(0xFFE064F7), Color(0xFFFF8D6C)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      )
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 16),

                      Text(
                        "Total Balance",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),

                      SizedBox(height: 6),

                      Text(
                        "6.900.000 VND",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                      Spacer(),

                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.withOpacity(0.5)
                                ),
                                child: Align(
                                  alignment: AlignmentGeometry.center,
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Color(0xFF33FF66),
                                  ),
                                ),
                              ),

                              SizedBox(width: 10,),

                              SizedBox(
                                height: 45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Income",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.8)
                                      ),
                                    ),

                                    Text(
                                      "2.500.000đ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),

                          Spacer(),

                          Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.withOpacity(0.4)
                                ),
                                child: Align(
                                  alignment: AlignmentGeometry.center,
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Color(0xFFFF3333),
                                  ),
                                ),
                              ),

                              SizedBox(width: 10,),

                              SizedBox(
                                height: 45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Expenses",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.8)
                                      ),
                                    ),

                                    Text(
                                      "325.000đ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),
                  ),

                  Text(
                    "View All",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                    ),
                  )
                ],
              ),
            ),

            CategoryItem(
                icon: Icons.food_bank_outlined,
                color: Colors.yellow,
                category: "Food",
                date: "Today",
                price: "45.000"
            ),
            CategoryItem(
                icon: Icons.shopping_bag,
                color: Colors.purple,
                category: "Shopping",
                date: "Today",
                price: "280.000"
            ),
            CategoryItem(
                icon: Icons.local_play,
                color: Colors.red,
                category: "Entertainment",
                date: "Yesterday",
                price: "90.000"
            ),
            CategoryItem(
                icon: Icons.flight,
                color: Colors.green,
                category: "Travel",
                date: "Yesterday",
                price: "1.500.000"
            ),
            CategoryItem(
                icon: Icons.electric_bolt,
                color: Colors.orange,
                category: "Electricity",
                date: "Yesterday",
                price: "350.000"
            ),

            ElevatedButton(
              onPressed: () {
                final authViewModel = context.read<AuthViewModel>();
                authViewModel.signOut();
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),

      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFFFF8D6C), Color(0xFFE064F7), Color(0xFF00B2E7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Icon(Icons.add, size: 32, color: Colors.white,),
          ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  icon: Icon(Icons.grid_view_rounded, color: Colors.black.withOpacity(0.5),)
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  icon: Icon(Icons.person, color: Colors.black.withOpacity(0.5),)
              )
            ],
          ),
        ),
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: CupertinoSegmentedControl<int> (
  //       children: {
  //         0: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //           child: Text("Expenditure"),
  //         ),
  //         1: Padding (
  //           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //           child: Text("Revenue"),
  //         )
  //       },
  //       groupValue: selectedValue,
  //       onValueChanged: (value) {
  //         setState(() {
  //           selectedValue = value;
  //         });
  //       },
  //     )
  //   );
  // }