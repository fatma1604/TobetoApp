import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/models/catalog_course_model.dart';
import 'package:tobeto_app/config/constant/core/widget/textfield_filter.dart';
import 'package:tobeto_app/pages/catalog/catalog_course_item.dart';

class CatalogCourseFilter extends StatefulWidget {
  const CatalogCourseFilter({Key? key, required this.catalog})
      : super(key: key);
  final List<CatalogCourse> catalog;

  @override
  State createState() => _CatalogCourseListState();
}

class _CatalogCourseListState extends State<CatalogCourseFilter> {
  String searchText = "";
  List<CatalogCourse> filteredCatalogCourses = [];
  int selectedFilter = 0; // Başlangıçta filtre olmadığını temsil eder

  @override
  // Başlangıçta Tüm kurslar gözüksün
  void initState() {
    super.initState();
    filteredCatalogCourses = widget.catalog;
  }

  // <---------- Filter Systems ---------->

  void filterCatalogCourses() {
    setState(() {
      filteredCatalogCourses = widget.catalog
          .where((catalogCourse) =>
              catalogCourse.title
                  .toLowerCase()
                  .contains(searchText.toLowerCase()) &&
              (selectedFilter == 0 ||
                  catalogCourse.filterNumber == selectedFilter))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceH = mediaQueryData.size.height;

    // <---------- TextFieldFilter (Search) ---------->

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFieldFilter(
            onChanged: (value) {
              setState(() {
                searchText = value; // Update the searchText variable
                filterCatalogCourses();
              });
            },
          ),
        ),

        // <---------- filterButtons ---------->

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              filterButton(0, AppText.all),
              filterButton(1, AppText.softWare),
              filterButton(2, AppText.softSkill),
              filterButton(3, AppText.other),
            ],
          ),
        ),

        // <---------- GridView (CourseItemVertical) ---------->

        SizedBox(
          height: deviceH / 1.55,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: filteredCatalogCourses.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 220,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: filteredCatalogCourses.length,
                    itemBuilder: (context, index) {
                      final catalogCourse = filteredCatalogCourses[index];
                      return CatalogCourseItem(catalogCourse: catalogCourse);
                    },
                  )

                // <---------- Not found : ---------->

                : const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          AppText.notFound,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Image(image: AssetImage(AppImage.notFoundImage))
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  // <---------- filterButton Area ---------->

  // <---------- filterButtons Color and Text color Changes with Map Function ---------->

  Map<int, Color> filterButtonColors = {
    1: Colors.grey.shade200,
    2: Colors.grey.shade200,
    3: Colors.grey.shade200,
    0: Colors.deepPurple,
  };

  // <---------- filterButton ---------->

  Widget filterButton(int filter, String text) {
    Color textColor = filterButtonColors[filter] == Colors.grey.shade200
        ? Colors.black
        : Colors.white;
    return GestureDetector(
      onTap: () {
        setState(() {
          filterButtonColors.forEach((key, value) {
            filterButtonColors[key] =
                key == filter ? Colors.deepPurple : Colors.grey.shade200;
          });
          selectedFilter = filter;
          filterCatalogCourses();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: filterButtonColors[filter],
          ),
          alignment: Alignment.center,
          width: 70,
          height: 30,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
