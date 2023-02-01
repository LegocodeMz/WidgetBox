import 'package:widgetbox/models/widgetModel.dart';
import 'package:flutter/material.dart';
import 'package:widgetbox/routes/rootScreen.dart';
import 'package:widgetbox/utils/constants/colors.dart';
import 'package:widgetbox/utils/drawer/main.dart';
import 'widgetList.dart';

class PersonalizedWidgets extends StatefulWidget {
  const PersonalizedWidgets({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PersonalizedWidgetsState();
  }
}

class PersonalizedWidgetsState extends State<PersonalizedWidgets> {
  bool searching = false;
  String searchString = '';
  WidgetCategoy? _selectedCategory;
  bool _isExpanded = false;
  final _controller = TextEditingController();

  AppBar showSearchBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      iconTheme: Theme.of(context).primaryIconTheme,
      title: TextField(
        keyboardType: TextInputType.text,
        autofocus: true,
        controller: _controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                searching = false;
                searchString = '';
              });
            },
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _controller.clear();
              setState(() {
                searchString = '';
              });
            },
            icon: const Icon(Icons.clear),
          ),
          hintText: 'Search....',
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        onSubmitted: (String text) {
          setState(() {
            searchString = text;
          });
        },
        onChanged: (String text) {
          setState(() {
            searchString = text;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: searching
            ? showSearchBar(context)
            : AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: const Text("Choose Your Best One"),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        searching = true;
                      });
                    },
                    icon: const Icon(Icons.search),
                  )
                ],
                centerTitle: true,
              ),
        backgroundColor: PRIMARY,
        // drawer: SettingsWidget(),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) => setState(() {
                        _isExpanded = !isExpanded;
                      }),
                  elevation: 0,
                  expandedHeaderPadding: const EdgeInsets.all(1),
                  dividerColor: Colors.white,
                  children: const [
                    // ExpansionPanel(
                    //   backgroundColor: Theme.of(context).backgroundColor,
                    //   isExpanded: _isExpanded,
                    //   headerBuilder: (context, isExpanded) {
                    //     if (isExpanded) {
                    //       return Container();
                    //     } else {
                    //       return SizedBox(
                    //         height: 50,
                    //         child: ListView(
                    //             scrollDirection: Axis.horizontal,
                    //             physics: const AlwaysScrollableScrollPhysics(),
                    //             children: [
                    //                   Padding(
                    //                     padding: const EdgeInsets.symmetric(
                    //                         horizontal: 5, vertical: 5),
                    //                     child: ChoiceChip(
                    //                       label: const Text("All Widgets"),
                    //                       //selectedColor: Theme.of(context).primaryColor,
                    //                       selected: _selectedCategory == null,
                    //                       onSelected: (value) => setState(() {
                    //                         _selectedCategory = null;
                    //                       }),
                    //                     ),
                    //                   )
                    //                 ] +
                    //                 WidgetCategoy.values
                    //                     .map((e) => Padding(
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   horizontal: 5,
                    //                                   vertical: 5),
                    //                           child: ChoiceChip(
                    //                             key: UniqueKey(),
                    //                             label: Text(
                    //                                 e.toString().split(".")[1]),
                    //                             //selectedColor: Theme.of(context).primaryColor,
                    //                             selected:
                    //                                 _selectedCategory == e,
                    //                             onSelected: (value) =>
                    //                                 setState(() {
                    //                               _selectedCategory = e;
                    //                             }),
                    //                           ),
                    //                         ))
                    //                     .toList()),
                    //       );
                    //     }
                    //   },
                    //   body: const Text(""),
                    // body: Wrap(
                    //     runSpacing: -15,
                    //     children: [
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(
                    //                 horizontal: 5, vertical: 5),
                    //             child: ChoiceChip(
                    //               label: const Text("All Widgets"),
                    //               //selectedColor: Theme.of(context).primaryColor,
                    //               selected: _selectedCategory == null,
                    //               onSelected: (value) => setState(() {
                    //                 _selectedCategory = null;
                    //               }),
                    //             ),
                    //           )
                    //         ] +
                    //         WidgetCategoy.values
                    //             .map((e) => Padding(
                    //                   padding: const EdgeInsets.symmetric(
                    //                       horizontal: 5, vertical: 5),
                    //                   child: ChoiceChip(
                    //                     label:
                    //                         Text(e.toString().split(".")[1]),
                    //                     //selectedColor: Theme.of(context).primaryColor,
                    //                     selected: _selectedCategory == e,
                    //                     onSelected: (value) => setState(() {
                    //                       _selectedCategory = e;
                    //                     }),
                    //                   ),
                    //                 ))
                    //             .toList()),
                    // ),
                  ]),
            ),
            // Expanded(child: getWidgetList(searchString, context)),
          ],
        ));
  }

  ListView getWidgetList(String filter, BuildContext context) {
    List<WidgetModel> widgetList = List.from(widgets);
    widgetList.sort((a, b) => a.name.compareTo(b.name));

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      children: filterWidgets(
          (_selectedCategory == null)
              ? widgetList
              : widgetList
                  .where(
                      (element) => element.category.contains(_selectedCategory))
                  .toList(),
          filter,
          context),
    );
  }

  List<Widget> filterWidgets(
      List<WidgetModel> widgets, String filter, BuildContext context) {
    List<WidgetModel> filtered = [];

    for (var item in widgets) {
      String itemName = item.name.toLowerCase();
      String subtitle = item.subtitle.toLowerCase();
      if (itemName.contains(filter.toLowerCase())) {
        filtered.add(item);
      } else if (subtitle.contains(filter.toLowerCase())) {
        filtered.add(item);
      }
    }

    if (filtered.isEmpty) {
      return [
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text('No widget found!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
        ),
      ];
    }

    return filtered.map((item) => buildListItem(item, context)).toList();
  }

  ListTile buildListItem(WidgetModel item, BuildContext context) {
    CircleAvatar arrow = CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
      ),
    );

    return ListTile(
      leading: arrow,
      title: Text(
        "${item.name} Widget",
        style: Theme.of(context).textTheme.headline1,
      ),
      subtitle: item.subtitle.isEmpty
          ? null
          : Text(
              item.subtitle,
              style: Theme.of(context).textTheme.subtitle1,
            ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RootScreen(item),
          ),
        );
      },
    );
  }
}
