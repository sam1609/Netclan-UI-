import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  final List<ProfileItem> items = [
    ProfileItem(
      image: 'assets/image1.jpg',
      text1: 'Garvit Arora',
      text2: 'Dehradun | Student',
      text3: 'Within 400-500 m',
      text4: 'Coffee | Bussiness | Friendship',
      text5: 'Hi community! I am open to new connections',
      progress: '0.2',
    ),
    ProfileItem(
      image: 'assets/image2.jpeg',
      text1: 'Aman Jangra',
      text2: 'Rohtak | QO Tester',
      text3: 'Within 500-600 m',
      text4: 'Coffee | Bussiness | Friendship',
      text5: 'Hi community! I am open to new connections',
      progress: '0.6',
    ),
    ProfileItem(
      image: 'assets/image1.jpg',
      text1: 'Garvit Arora',
      text2: 'Dehradun | Student',
      text3: 'Within 400-500 m',
      text4: 'Coffee | Bussiness | Friendship',
      text5: 'Hi community! I am open to new connections',
      progress: '0.2',
    ),
    ProfileItem(
      image: 'assets/image2.jpeg',
      text1: 'Aman Jangra',
      text2: 'Rohtak | QO Tester',
      text3: 'Within 500-600 m',
      text4: 'Coffee | Bussiness | Friendship',
      text5: 'Hi community! I am open to new connections',
      progress: '0.6',
    ),
    ProfileItem(
      image: 'assets/image1.jpg',
      text1: 'Garvit Arora',
      text2: 'Dehradun | Student',
      text3: 'Within 400-500 m',
      text4: 'Coffee | Bussiness | Friendship',
      text5: 'Hi community! I am open to new connections',
      progress: '0.2',
    ),
    ProfileItem(
      image: 'assets/image2.jpeg',
      text1: 'Aman Jangra',
      text2: 'Rohtak | QO Tester',
      text3: 'Within 500-600 m',
      text4: 'Coffee | Bussiness | Friendship',
      text5: 'Hi community! I am open to new connections',
      progress: '0.6',
    ),
    ProfileItem(
      image: 'assets/image1.jpg',
      text1: 'Garvit Arora',
      text2: 'Dehradun | Student',
      text3: 'Within 400-500 m',
      text4: 'Coffee | Bussiness | Friendship',
      text5: 'Hi community! I am open to new connections',
      progress: '0.2',
    ),
    ProfileItem(
      image: 'assets/image2.jpeg',
      text1: 'Aman Jangra',
      text2: 'Rohtak | QO Tester',
      text3: 'Within 500-600 m',
      text4: 'Coffee | Bussiness | Friendship',
      text5: 'Hi community! I am open to new connections',
      progress: '0.6',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 9, // Takes 90% of the space
                  child: SearchBarWidget(),
                ),
                Expanded(
                  flex: 1, // Takes 10% of the space
                  child: Container(
                    width: double.infinity, // Adjust as needed
                    child: Icon(Icons.filter_list),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  title: ProfileItemWidget(profileItem: items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem {
  final String image;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String progress;
  bool buttonClicked;

  ProfileItem({
    required this.image,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.progress,
    this.buttonClicked = false,
  });
}

class ProfileItemWidget extends StatefulWidget {
  final ProfileItem profileItem;

  ProfileItemWidget({required this.profileItem});

  @override
  _ProfileItemWidgetState createState() => _ProfileItemWidgetState();
}

class _ProfileItemWidgetState extends State<ProfileItemWidget> {
  void onPressed() {
    setState(() {
      widget.profileItem.buttonClicked = !widget.profileItem.buttonClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                widget.profileItem.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.profileItem.text1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.profileItem.text2,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    widget.profileItem.text3,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: double.parse(widget.profileItem.progress),
                      backgroundColor: Colors.grey,
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                  // textStyle: TextStyle(fontWeight: FontWeight.bold
                  //     widget.profileItem.buttonClicked ? Colors.grey : Colors.black,
                  ),
              child: Text(
                widget.profileItem.buttonClicked ? 'PENDING' : '+INVITE',
                style: TextStyle(
                  color: widget.profileItem.buttonClicked
                      ? Colors.grey
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
        Text(
          widget.profileItem.text4,
          style: TextStyle(fontSize: 12),
        ),
        Text(
          widget.profileItem.text5,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(20.0), // Adjust the radius as needed
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
