import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neon_template/bloc/profile/profile_bloc.dart';
import 'package:flutter_neon_template/bloc/profile/profile_event.dart';
import 'package:flutter_neon_template/bloc/profile/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
        if (state is UserProfileInitial) {
          context.read<UserProfileBloc>().add(UserProfileFetchEvent());
          return Container();
        } else if (state is UserProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserProfileSuccess) {
          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Rachael Wagner",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Junior Product Designer")
                ],
              ),
              const SizedBox(height: 25),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      "Complete your profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "(1/5)",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: List.generate(5, (index) {
                  return Expanded(
                    child: Container(
                      height: 7,
                      margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index == 0 ? Colors.blue : Colors.black12,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final card = profileCompletionCards[index];
                    return SizedBox(
                      width: 160,
                      child: Card(
                        shadowColor: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Icon(
                                card.icon,
                                size: 30,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                card.title,
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Text(card.buttonText),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Padding(padding: EdgeInsets.only(right: 5)),
                  itemCount: profileCompletionCards.length,
                ),
              ),
              const SizedBox(height: 35),
            ],
          );
        } else if (state is UserProfileError) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    icon: CupertinoIcons.doc,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your skills",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  ),
];
