
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // hanya untuk warna & ikon

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Homepage Concept',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              height: 55,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Text(
                'Homepage',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // BANNER IMAGE
            Container(
              margin: const EdgeInsets.all(16),
              height: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                'https://picsum.photos/600/300',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CupertinoActivityIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Image failed to load'));
                },
              ),
            ),

            // GRID ICON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildGridIcon(
                        context,
                        CupertinoIcons.chat_bubble_2,
                        'Chat',
                        Colors.blue,
                      ),
                      _buildGridIcon(
                        context,
                        CupertinoIcons.calendar,
                        'Calendar',
                        Colors.green,
                      ),
                      _buildGridIcon(
                        context,
                        CupertinoIcons.map,
                        'Map',
                        Colors.purple,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildGridIcon(
                        context,
                        CupertinoIcons.doc_text,
                        'Description',
                        Colors.orange,
                      ),
                      _buildGridIcon(
                        context,
                        CupertinoIcons.cloud_download,
                        'Download',
                        Colors.indigo,
                      ),
                      _buildGridIcon(
                        context,
                        CupertinoIcons.book,
                        'Library',
                        Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),
            // BOTTOM NAVIGATION
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: CupertinoColors.systemGrey4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomIcon(
                    context,
                    CupertinoIcons.home,
                    'Home',
                    active: true,
                  ),
                  _buildBottomIcon(
                    context,
                    CupertinoIcons.person_crop_circle,
                    'Profile',
                  ),
                  _buildBottomIcon(
                    context,
                    CupertinoIcons.settings_solid,
                    'Settings',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridIcon(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        if (label == "Description") {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const DescriptionPage()),
          );
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(
    BuildContext context,
    IconData icon,
    String label, {
    bool active = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (label == 'Profile') {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const ProfilePage()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: active ? CupertinoColors.activeBlue : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: active ? CupertinoColors.activeBlue : Colors.grey,
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Profile')),
      child: SafeArea(
        child: ListView(
          children: [
            _buildProfileCard(),
            const SizedBox(height: 10),
            _buildMenuItem(
              context,
              CupertinoIcons.lock,
              Colors.blue,
              'Privacy Policy',
            ),
            _buildMenuItem(
              context,
              CupertinoIcons.moon,
              Colors.indigo,
              'Theme Mode',
              trailing: 'System',
            ),
            _buildMenuItem(
              context,
              CupertinoIcons.globe,
              Colors.teal,
              'App Language',
              trailing: 'English',
            ),
            _buildMenuItem(
              context,
              CupertinoIcons.bell,
              Colors.orange,
              'Notifications & Sounds',
            ),
            _buildMenuItem(
              context,
              CupertinoIcons.doc_text,
              Colors.purple,
              'Description',
            ),
            _buildMenuItem(
              context,
              CupertinoIcons.square_arrow_right,
              Colors.red,
              'Log out',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: CupertinoColors.activeBlue,
            child: Icon(
              CupertinoIcons.person,
              color: CupertinoColors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Nabil Atha',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: CupertinoColors.black,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'athanabil188@gmail.com',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    Color color,
    String text, {
    String? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CupertinoListTile(
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(text, style: const TextStyle(fontSize: 15)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailing != null)
              Text(
                trailing,
                style: const TextStyle(color: CupertinoColors.systemGrey),
              ),
            const Icon(
              CupertinoIcons.forward,
              size: 18,
              color: CupertinoColors.systemGrey,
            ),
          ],
        ),
        onTap: () {
          if (text == "Description") {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const DescriptionPage()),
            );
          } else {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => DetailScreen(title: text),
              ),
            );
          }
        },
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const CupertinoListTile({
    super.key,
    required this.leading,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 12),
            Expanded(child: title),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

/// DETAIL SCREEN
class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(title)),
      child: SafeArea(
        child: Center(
          child: Text(
            "This is the detail page for $title",
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

/// DESCRIPTION PAGE
class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Description')),
      child: SafeArea(
        child: ListView(
          children: [
            // Banner Gambar
            Container(
              margin: const EdgeInsets.all(16),
              height: 200,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                'https://picsum.photos/800/400',
                fit: BoxFit.cover,
              ),
            ),
            // Text Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "Ini adalah halaman Description.\n\n" 
                "Kamu bisa menambahkan detail informasi di sini, "
                "misalnya penjelasan aplikasi, fitur, atau konten lainnya. "
                "Teks ini bisa panjang dan akan otomatis scrollable karena menggunakan ListView.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
