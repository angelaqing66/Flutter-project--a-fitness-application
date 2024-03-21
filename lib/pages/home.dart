import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class HomePage extends StatelessWidget{
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets =[];

  // void _getCategories(){
  //   categories = CategoryModel.getCategories();
  // }
  // void _getDiets(){
  //   diets = DietModel.getDiets();
  // }

  void _getInitialInfo(){
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(  
      //scaffold is a function to add bars in the app,and create the framework
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40,),
          _CategoriesSection(),
          const SizedBox(height: 40,),
          _dietSection(),
          const SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Padding(
              padding: EdgeInsets.only(left:20),
              child: Text(
                'Popular',
                style:TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                ),
              ),
              const SizedBox(height: 15,),
              ListView.separated(
                itemCount: popularDiets.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(width:25,),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.007),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(popularDiets[index].iconPath,
                        width: 65,
                        height: 65,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            popularDiets[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                             popularDiets[index].level + ' | ' + popularDiets[index].duration +' | ' + popularDiets[index].calorie,
                             style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                             )
                             )
                          ],
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ), 
                   );
                },
              ),
           ],
          ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Padding(
            padding: EdgeInsets.only(left:20),
            child: Text(
              'Recommendation\nfor Diet',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              )
            ),
          ),
          const SizedBox(height:15,),
          Container(
            // color: Colors.blue,
            height: 240,
            child: ListView.separated(
              itemBuilder: (context,index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Text(
                      diets[index].name,
                      style:const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16,
                      )
                    ),
                    Text(
                      diets[index].level + '|' + diets[index].duration + '|' + diets[index].calories,
                      style: const TextStyle(
                        color:Color(0xff7B6F72),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            color:  const Color(0xffC58BF2),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                             const Color(0xff9DCEFF),
                             const Color(0xff92A3FD),
                          ]
                        ),
                        borderRadius: BorderRadius.circular(50)
                      ),
                    )

                  ]
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width:25,),
              itemCount: diets.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              ),

          )
         ],
        );
  }

  Column _CategoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 150,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                separatorBuilder: (context, index) => const SizedBox(width:25,),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(categories[index].iconPath),
                            ),
                          ),
                          Text(
                            categories[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            )
                      ],

                    )
                  );
                }, 
                ),
            ),
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Search Pancake',
              hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
                )
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfast',
      style:TextStyle(
        color:Colors.black,
        fontSize:20,
        fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.green.withOpacity(0.3),
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
            ),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius:BorderRadius.circular(10),
            ),
          ),
      ),
      actions: [      //following is for right button
        GestureDetector(
        onTap: () {

        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          child: SvgPicture.asset(
            'assets/icons/dots.svg',
            height: 5,
            width: 5,
            ),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius:BorderRadius.circular(10)
          ),
        ),
      ),
      ],
    );
  }
}

