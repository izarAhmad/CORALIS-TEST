import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'landing_screen.dart';

class HomeScreen extends StatelessWidget {

  void logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LandingScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 32,
          child: Image.asset('assets/images/logo-coralis.webp'),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      // SIDEBAR
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/logo-coralis.webp', height: 40),
                  SizedBox(height: 10),
                  Text("Custom Software Solutions", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Dashboard"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.business_center),
              title: Text("Services"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Coralis"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () => logout(context),
            ),
          ],
        ),
      ),

      // BODY
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [

          Text(
            "Welcome to Coralis Studio 👋",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 8),

          Text(
            "Your expert partner in custom software development",
            style: TextStyle(color: Colors.grey),
          ),

          SizedBox(height: 20),

          // HERO CARD
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Start Your Digital Project",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Web apps, mobile apps, ERP & game development",
                  style: TextStyle(color: Colors.white70),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text("Consult Now"),
                )
              ],
            ),
          ),

          SizedBox(height: 24),

          Text(
            "Why Choose Coralis",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 16),

          GridView.count(
            crossAxisCount: 2, // 2 kolom
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildWhyItem(Icons.verified, "Warranty Period"),
              _buildWhyItem(Icons.star, "Uniquely Yours"),
              _buildWhyItem(Icons.thumb_up, "Honest Consultation"),
              _buildWhyItem(Icons.support_agent, "Full Support"),
            ],
          ),





          SizedBox(height: 12),

          featureCard("10+ Years Experience", Icons.timeline),
          featureCard("Custom System Development", Icons.code),
          featureCard("Transparent & Honest Consultation", Icons.handshake),
          featureCard("Trusted by Startups & Corporations", Icons.apartment),

          SizedBox(height: 24),

          Text(
            "Our Services",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 12),

          courseCard("Website Development", "Company profile, blog, e-commerce", Icons.web),
          courseCard("Mobile App Development", "Hybrid & Native solutions", Icons.phone_android),
          courseCard("ERP System", "Enterprise business automation", Icons.business),
          courseCard("Game Development", "Educational & entertainment games", Icons.sports_esports),
        ],
      ),
    );
  }

  Widget _buildWhyItem(IconData icon, String title) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 32, color: Colors.blue),
        SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

  // FEATURE CARD
  Widget featureCard(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text("Coralis Studio advantage"),
      ),
    );
  }

  // COURSE CARD
  Widget courseCard(String title, String subtitle, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
