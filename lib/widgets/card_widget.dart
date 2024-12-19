import 'package:flutter/material.dart';
import 'package:flutter_day10_database/constents/spacing.dart';
import 'package:flutter_day10_database/model/student.dart';
import 'package:flutter_day10_database/pages/list_page.dart';
import 'package:flutter_day10_database/service/database.dart';
import 'package:flutter_day10_database/widgets/text_field_widget.dart';

class CardWidget extends StatefulWidget {
  final Student student;
  const CardWidget({super.key, required this.student});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  void clearData() {
    nameController.clear();
    salaryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Text("${widget.student.id} )"),
                  const SizedBox(width: 8),
                  Text(widget.student.name.toString()),
                ],
              ),
            ),
            Text(widget.student.age.toString()),
            Text(widget.student.salary.toString()),
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    await Database().deleteUser(id: widget.student.id!);
                    if (context.mounted) {
                      context
                          .findAncestorStateOfType<ListPageState>()
                          ?.setState(() {});
                    }
                  },
                  child: Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.red.shade300,
                  ),
                ),
                height12,
                InkWell(
                    onTap: () {
                      nameController.text = widget.student.name!;
                      salaryController.text = widget.student.salary.toString();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  height24,
                                  TextFieldWidget(
                                      controller: nameController, text: "name"),
                                  height24,
                                  TextFieldWidget(
                                      controller: salaryController,
                                      text: "salary"),
                                  height24,
                                  ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        await Database().updateUser(
                                            name: nameController.text,
                                            salary: double.parse(
                                                salaryController.text),
                                            id: widget.student.id!);
                                        if (context.mounted) {
                                          clearData();
                                          context
                                              .findAncestorStateOfType<
                                                  ListPageState>()
                                              ?.setState(() {});
                                          Navigator.pop(context);
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(e.toString()),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade100,
                                    ),
                                    child: const Text(
                                      "edit student",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.edit, size: 20)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
