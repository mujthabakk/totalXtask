import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_task/controller/filter_controller/filter_controller.dart';
import 'package:totalx_task/controller/user_provider/user_controller.dart';
import 'package:totalx_task/core/size/size.dart';
import 'package:totalx_task/view/widget/alerbox/aleartbox.dart';
import 'package:totalx_task/view/widget/radiobutton/radiobutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserCollectionController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.location_on,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        title: const Text(
          "Nilambur",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: context.width(310),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      hintText: 'Search by name',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: context.height(650),
                          width: context.width(double.infinity),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: ValueListenableBuilder(
                              valueListenable: filterController,
                              builder: (context, value, _) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 20),
                                      child: Text(
                                        "Sort",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Radiobutton(
                                      isSelected: value == 0 ? true : false,
                                      text: 'All',
                                      ontap: (_) {
                                        filterController.value = 0;
                                        userProvider.getUser();
                                      },
                                    ),
                                    Radiobutton(
                                      isSelected: value == 1 ? true : false,
                                      text: 'Age: Elder',
                                      ontap: (_) {
                                        filterController.value = 1;
                                        userProvider.sortUserAgeGrtrSixty();
                                      },
                                    ),
                                    Radiobutton(
                                      isSelected: value == 2 ? true : false,
                                      text: 'Age: Younger',
                                      ontap: (_) {
                                        filterController.value = 2;
                                        userProvider.sortUserAgelsthanSixty();
                                      },
                                    ),
                                  ],
                                );
                              }),
                        );
                      },
                    );
                  },
                  child: Image.asset("assets/image/Vector (2).png"),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "users Lists",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: Consumer<UserCollectionController>(
                builder: (context, controller, _) {
                  return StreamBuilder(
                    stream: controller.userCollection,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) => Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                                snapshot.data?.docs[index].data()["name"] ??
                                    ""),
                            subtitle: Text(
                                snapshot.data?.docs[index].data()["age"] ?? ""),
                            leading: const CircleAvatar(),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertBox(
                text: 'Add A New User',
              );
            },
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
