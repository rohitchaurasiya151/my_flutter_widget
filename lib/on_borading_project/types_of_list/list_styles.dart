
import 'package:flutter/material.dart';
import 'package:my_flutter_widget/on_borading_project/types_of_list/parallax_effect.dart';
import '../widget/parent_widget.dart';


class ListStyles extends StatelessWidget {
  ListStyles({Key? key}) : super(key: key);

  final typesOfList = ["parallax"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("List Types")),
        body: ListView.builder(
            itemCount: typesOfList.length,
            itemBuilder: (BuildContext context, int index) {
              return ParentWidget(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExampleParallax()));
              },parentWidgetName: typesOfList[index],);
            }));
  }
}
