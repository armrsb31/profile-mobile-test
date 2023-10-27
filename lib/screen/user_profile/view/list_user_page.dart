import 'package:flutter/material.dart';
import 'package:profile_mobile/screen/user_profile/model/list_user_model.dart';
import 'package:profile_mobile/screen/user_profile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class ListUserPage extends StatelessWidget {
  const ListUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(),
      body: userViewModel.loading ? const CircularProgressIndicator() : buildListUser(list: userViewModel.listUserModel),
    );
  }

  Widget buildListUser({required ListUserModel list}) => ListView.builder(
      itemCount: list.results!.length,
      itemBuilder: (context, index) {
        Results results = list.results![index];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(results.picture!.large!),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    buildDetailProfile(title: 'ชื่อ', content: '${results.name!.title!}. ${results.name!.first!} ${results.name!.last!}'),
                    const SizedBox(height: 4),
                    buildDetailProfile(title: 'เพศ', content: results.gender),
                    const SizedBox(height: 4),
                    buildDetailProfile(title: 'อีเมล', content: results.email),
                    const SizedBox(height: 4),
                    buildDetailProfile(title: 'อายุ', content: results.dob!.age!.toString()),
                    const SizedBox(height: 4),
                    buildDetailProfile(title: 'เบอร์โทรศัพท์', content: results.phone),
                  ],
                ),
              )
            ],
          ),
        );
      });

  Widget buildDetailProfile({required String title, String? content}) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(width: 5),
          Expanded(child: Text(content!, style: const TextStyle(color: Colors.grey))),
        ],
      );
}
