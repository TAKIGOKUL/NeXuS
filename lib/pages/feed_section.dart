import 'package:flutter/material.dart';

class FeedSection extends StatelessWidget {
  const FeedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Communities'),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Communities',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('All communities', style: TextStyle(fontSize: 16)),
                GestureDetector(
                  onTap: () {
                    // Handle "View all" click
                    print("View all clicked");
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle Technology community click
                      print("Technology clicked");
                    },
                    child: const CommunityIcon(
                        imagePath: 'assets/technology.jpg',
                        label: 'Technology'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle Art & Craft community click
                      print("Art & Craft clicked");
                    },
                    child: const CommunityIcon(
                        imagePath: 'assets/art_craft.jpg',
                        label: 'Art & Craft'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle Spirituality community click
                      print("Spirituality clicked");
                    },
                    child: const CommunityIcon(
                        imagePath: 'assets/spirituality.jpg',
                        label: 'Spirituality'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle Codology community click
                      print("Codology clicked");
                    },
                    child: const CommunityIcon(
                        imagePath: 'assets/codology.png', label: 'Codology'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.blue,
                    tabs: [
                      Tab(text: 'My feed'),
                      Tab(text: 'My communities'),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        200, // Adjust height as necessary
                    child: const TabBarView(
                      children: [
                        MyFeedTab(),
                        Center(child: Text('My communities tab content')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityIcon extends StatelessWidget {
  final String imagePath;
  final String label;

  const CommunityIcon(
      {super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class MyFeedTab extends StatelessWidget {
  const MyFeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 16),
          PostInputField(),
          SizedBox(height: 16),
          PostCard(
            community: 'Codology',
            author: 'Aishu V',
            department: 'Mech, CEA',
            content:
                'This is what I learned in my recent hackathon\n\n"The whole secret of existence"\n\n"The whole secret of existence lies in the pursuit of meaning, purpose, and connection. It is a delicate dance between self-discovery, compassion for others, and embracing the ever-unfolding mysteries of life. Finding harmony in the ebb and flow of experiences, we unlock the profound beauty that resides within our shared journey."',
          ),
        ],
      ),
    );
  }
}

class PostInputField extends StatelessWidget {
  const PostInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/eren.jpeg'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'write your post here',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Add your post in',
                    style: TextStyle(color: Colors.grey)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Publish Post',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String community;
  final String author;
  final String department;
  final String content;

  const PostCard({
    super.key,
    required this.community,
    required this.author,
    required this.department,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Posted in $community',
                  style: const TextStyle(color: Colors.blue),
                ),
                const Text(
                  'view community',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '$author\n$department',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}
