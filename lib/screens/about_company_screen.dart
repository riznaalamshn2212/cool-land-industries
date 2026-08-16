import 'package:flutter/material.dart';

class AboutCompanyScreen extends StatefulWidget {
  const AboutCompanyScreen({super.key});

  @override
  State<AboutCompanyScreen> createState() => _AboutCompanyScreenState();
}

class _AboutCompanyScreenState extends State<AboutCompanyScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget infoCard({
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.blue.withOpacity(0.35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.10),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 28,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.5,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "About Company",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),

        child: FadeTransition(
          opacity: _fadeAnimation,

          child: Column(
            children: [
              const SizedBox(height: 15),

              ScaleTransition(
                scale: _scaleAnimation,

                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade900,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.20),
                        blurRadius: 25,
                        spreadRadius: 4,
                      ),
                    ],
                  ),

                  child: Image.asset(
                    "assets/images/img.png",
                    height: 130,
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                "COOL LAND INDUSTRIES",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Quality • Comfort • Trust",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 30),

              infoCard(
                icon: Icons.business,
                title: "About Us",
                text:
                "Cool Land Industries is a trusted company dealing "
                    "in quality home appliances, furniture and electronic "
                    "products. We focus on reliable products and excellent "
                    "customer service.",
              ),

              infoCard(
                icon: Icons.shopping_bag,
                title: "Our Products",
                text:
                "Our product range includes Air Coolers, LED TVs, "
                    "Washing Machines, Refrigerators, Beds, Almari, "
                    "Chairs and other home appliances and furniture.",
              ),

              infoCard(
                icon: Icons.verified,
                title: "Our Mission",
                text:
                "Our mission is to provide quality products at "
                    "reasonable prices while maintaining customer "
                    "satisfaction, trust and long-term relationships "
                    "with our customers.",
              ),

              infoCard(
                icon: Icons.handshake,
                title: "Why Choose Us?",
                text:
                "We believe in quality, customer satisfaction, "
                    "trusted service and building long-lasting "
                    "relationships with our customers.",
              ),

              infoCard(
                icon: Icons.star,
                title: "Our Commitment",
                text:
                "We are committed to providing genuine products, "
                    "helpful service and a comfortable shopping "
                    "experience for every customer.",
              ),

              const SizedBox(height: 20),

              const Text(
                "Thank you for choosing\nCool Land Industries",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}