import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFF7A6FF0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage('assets/eren.jpeg'),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Eren Yeager',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'eren@something.com | +91 123 456 789',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildProfileOption(
              context,
              icon: Icons.edit,
              title: 'Edit profile information',
              onTap: () {
                // Handle edit profile information
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              trailing: const Text(
                'ON',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                // Handle notifications
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.language,
              title: 'Language',
              trailing: const Text(
                'English',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                // Handle language
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.security,
              title: 'Security',
              onTap: () {
                // Handle security
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.color_lens,
              title: 'Theme',
              trailing: const Text(
                'Light mode',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                // Handle theme
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () {
                // Handle help & support
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.contact_mail,
              title: 'Contact us',
              onTap: () {
                // Handle contact us
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.privacy_tip,
              title: 'Privacy policy',
              onTap: () {
                // Handle privacy policy
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context,
      {required IconData icon,
      required String title,
      Widget? trailing,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }
}
