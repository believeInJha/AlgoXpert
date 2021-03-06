import 'package:app/ui/analysis.dart';
import 'package:app/ui/parentcard.dart';
import 'package:app/visualizer/ColorConstants.dart';
import 'package:app/visualizer/SortScreen.dart';
import 'package:app/visualizer/VisulizerProvider.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_item.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Size size;
  double topStatus = 0;
  double bottomStatus = 0;

  int selectedIndex = 0;
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  List isOpen = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List leadingIcons = [
    "assets/images/graph.png",
    "assets/images/search.png",
    "assets/images/sort.png",
    "assets/images/plus.png",
    "assets/images/data.png",
    "assets/images/process.png",
  ];
  List listText = [
    "Graph",
    "Search",
    "Sort",
    "Maths",
    "Data Structures",
    "Greedy"
  ];
  List trailingIcons = [
    "assets/images/Cityscapes Downtown.png",
    "assets/images/Cityscapes Downtown-1.png",
    "assets/images/Cityscapes Downtown-2.png",
    "assets/images/Cityscapes Downtown-3.png",
    "assets/images/Cityscapes Downtown-4.png",
    "assets/images/Cityscapes Downtown-5.png",
  ];
  Map database = {
    "Graph": ["Depth_First_Search", "Breadth_First_Search"],
    "Search": ["Binary_Search", "Linear_Search"],
    "Sort": [
      "Bubble_Sort",
      "Heap_Sort",
      "Insertion_Sort",
      "Merge_Sort",
      "Quick_Sort",
      "Selection_Sort"
    ],
    "Maths": [
      "Even_Odd",
      "Factorial",
      "Fibonacci",
      "Greatest_Common_Divisor",
      "Lowest_Common_Multiple",
      "Max_Pairwise_Product",
      "Prime_Numbers",
      "Swap_Numbers"
    ],
    "Data Structures": [
      "AVL_Tree",
      "Array_Methods",
      "Binary_Search_Tree",
      "Huffman_Tree",
      "Infix_to_Postfix",
      "Infix_to_Prefix",
      "Intersect_Arrays",
      "Postfix_to_Infix",
      "Prefix_to_Infix",
      "Priority_Queue",
      "Queue_using_Array",
      "Queue_using_Linked_List",
      "Queue_using_Stacks",
      "Reverse_Linked_List",
      "Stack_using_Array",
      "Stack_using_Linked_List",
      "Stack_using_Queues",
      "Union_Array",
      "Union_Sorted_Array"
    ],
    "Greedy": ["Knapsack_Problem"],
  };
  List numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 1440, width: 720, allowFontScaling: true);
    numbers.shuffle();
    size = MediaQuery
        .of(context)
        .size;
    topStatus = MediaQuery
        .of(context)
        .padding
        .top;
    bottomStatus = MediaQuery
        .of(context)
        .padding
        .bottom;

    return Scaffold(
      backgroundColor: Color(0xdd001529),
      body: Container(
        color: Color(0xFF3F5F9),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              backgroundColor: Color(0xdd001529),
              pinned: this._pinned,
              snap: this._snap,
              floating: this._floating,
              expandedHeight: 495.0.h,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                 title:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset('assets/lottie/logo.json',width: 30),
                    SizedBox(width: 5,),
                    Text("AlgoXpert",
                        style: GoogleFonts.abrilFatface(
                            fontSize: 20, color:Colors.pinkAccent)),
                  ],
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 60.w,
                            ),
                            Image.asset(
                              "assets/images/appbar.png",
                            ),
                          ],
                        )),
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/images/appbartext.png",color: Colors.pinkAccent,),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            SliverList(delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (selectedIndex == 1) {
                    if (index > 0) return null;
                    return HomeScreen();
                  }
                  else if (selectedIndex == 2) {
                    if (index > 0) return null;
                    return x(size, topStatus, bottomStatus);
                  }
                  if (selectedIndex == 0) {
                    if (index > 5) return null;
                    return ParentCard(
                        database: database,
                        index: index,
                        trailingIcons: trailingIcons,
                        listText: listText,
                        isOpen: isOpen,
                        leadingIcons: leadingIcons,
                        numbers: numbers);
                  }
                  return null;
                }))
          ],
        ),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(

          barBackgroundColor: Color(0xdd001529),

          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          unselectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.white,
          showSelectedItemShadow: true,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
            print(selectedIndex);
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
            selectedBackgroundColor: Color(0xdd626EE3),
          ),
          FFNavigationBarItem(
            iconData: Icons.analytics,
            label: 'Analyze',
            selectedBackgroundColor: Colors.purple,
          ),
          FFNavigationBarItem(
            iconData: Icons.graphic_eq,
            label: 'Visualize',
            selectedBackgroundColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}

