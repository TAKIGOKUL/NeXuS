import 'package:flutter/material.dart';
import 'join_community.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Codology Community'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset('assets/banner.png', fit: BoxFit.cover),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Codology',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text('4.3 (10K+ members)'),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JoinCommunityPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        'Join Community',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '"Programming is the art of algorithm design and the craft of debugging errant code."',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'About community'),
              Tab(text: 'Feed'),
              Tab(text: 'Sessions'),
              Tab(text: 'Challenges'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                aboutCommunityTab(),
                feedTab(),
                sessionsTab(),
                challengesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutCommunityTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to Codology Community 👋',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              imageCard('assets/wildlife.jpeg'),
              imageCard('assets/image2.jpeg'),
              imageCard('assets/image3.jpeg'),
              imageCard('assets/image4.jpeg'),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'What is this community for?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget imageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imagePath,
        width: (MediaQuery.of(context).size.width - 48) / 2,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget feedTab() {
    return const Center(child: Text('Feed Content Here'));
  }

  Widget sessionsTab() {
    return const Center(child: Text('Sessions Content Here'));
  }

  Widget challengesTab() {
    return const Center(child: Text('Challenges Content Here'));
  }
}
