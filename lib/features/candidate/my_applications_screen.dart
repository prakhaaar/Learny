import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_gradients.dart';
import '../../../core/constants/app_spacing.dart';

class MyApplicationsScreen extends StatefulWidget {
  const MyApplicationsScreen({super.key});

  @override
  State<MyApplicationsScreen> createState() => _MyApplicationsScreenState();
}

class _MyApplicationsScreenState extends State<MyApplicationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> activeApplications = [
    {
      "title": "Senior Mathematics Teacher",
      "school": "Bright Academy",
      "location": "Atlanta, GA, USA",
      "type": "TEACHING",
      "mode": "FULL TIME",
      "salary": "\$35k - \$45k",
      "status": "interview",
      "statusLabel": "Upcoming Interview",
      "statusDate": "Mar 20, 2025",
      "isReview": true,
    },
    {
      "title": "History Department Head",
      "school": "Greenwood School",
      "location": "Boston, MA, USA",
      "type": "TEACHING",
      "mode": "FULL TIME",
      "salary": "\$35k - \$45k",
      "status": "applied",
      "statusLabel": "Application Sent",
      "statusDate": "Mar 15, 2025",
      "isReview": false,
    },
    {
      "title": "Music Department Head",
      "school": "Riverside High School",
      "location": "Austin, TX, USA",
      "type": "TEACHING",
      "mode": "PART TIME",
      "salary": "\$25k - \$35k",
      "status": "review",
      "statusLabel": "Under Review",
      "statusDate": "Mar 12, 2025",
      "isReview": false,
    },
    {
      "title": "Science Lab Assistant",
      "school": "St. Francis Prep",
      "location": "New York, NY, USA",
      "type": "LAB STAFF",
      "mode": "FULL TIME",
      "salary": "\$30k - \$40k",
      "status": "applied",
      "statusLabel": "Application Sent",
      "statusDate": "Mar 10, 2025",
      "isReview": false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _statsRow(),
            _tabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _applicationsList(activeApplications),
                  _applicationsList([]), // Past — empty for now
                  _applicationsList([]), // Saved — empty for now
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new, size: 18),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "My Applications",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _statsRow() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Row(
        children: [
          _statChip("12 Active", true),
          const SizedBox(width: 8),
          _statChip("4 Past", false),
          const SizedBox(width: 8),
          _statChip("6 Saved", false),
        ],
      ),
    );
  }

  Widget _statChip(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: active
            ? AppColors.primary
            : AppColors.greyLight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: active ? Colors.white : AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      color: AppColors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textSecondary,
        indicatorColor: AppColors.primary,
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        tabs: const [
          Tab(text: "Active (4)"),
          Tab(text: "Past"),
          Tab(text: "Saved (6)"),
        ],
      ),
    );
  }

  Widget _applicationsList(List<Map<String, dynamic>> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          "No applications here yet.",
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: items.length,
      itemBuilder: (context, index) => _applicationCard(items[index]),
    );
  }

  Widget _applicationCard(Map<String, dynamic> app) {
    Color statusColor;
    IconData statusIcon;

    switch (app["status"]) {
      case "interview":
        statusColor = Colors.green;
        statusIcon = Icons.calendar_today_outlined;
        break;
      case "review":
        statusColor = Colors.orange;
        statusIcon = Icons.hourglass_empty_outlined;
        break;
      default:
        statusColor = AppColors.primary;
        statusIcon = Icons.send_outlined;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: const Icon(
                  Icons.school_outlined,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app["title"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${app["school"]} • ${app["location"]}",
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.bookmark, color: AppColors.primary, size: 18),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _tag(app["type"], AppColors.primary),
              const SizedBox(width: 6),
              _tag(app["mode"], AppColors.secondary),
              const Spacer(),
              Text(
                app["salary"],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(statusIcon, size: 14, color: statusColor),
              const SizedBox(width: 6),
              Text(
                app["statusLabel"],
                style: TextStyle(
                  fontSize: 12,
                  color: statusColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                app["statusDate"],
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          if (app["isReview"] == true) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                gradient: AppGradients.primaryGradient,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: const Center(
                child: Text(
                  "View Status Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _tag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
