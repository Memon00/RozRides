import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy notifications for demonstration
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Welcome to RozRides!',
        'message': 'Start your journey by exploring our premium car listings.',
        'time': '2 hours ago',
        'isUnread': true,
        'icon': Icons.waving_hand,
        'color': Colors.amber,
      },
      {
        'title': 'Profile Verified',
        'message': 'Your identity has been successfully verified. You can now rent cars.',
        'time': '1 day ago',
        'isUnread': false,
        'icon': Icons.verified_user,
        'color': Colors.green,
      },
      {
        'title': 'New Feature Alert',
        'message': 'Check out our new "With Driver" option for a stress-free ride.',
        'time': '2 days ago',
        'isUnread': false,
        'icon': Icons.new_releases,
        'color': Theme.of(context).primaryColor,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () {},
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications yet',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We\'ll notify you about bookings and updates',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade500,
                        ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: notification['isUnread']
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.05)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: notification['isUnread']
                          ? Theme.of(context).primaryColor.withValues(alpha: 0.2)
                          : Colors.grey.shade200,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: (notification['color'] as Color).withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        notification['icon'] as IconData,
                        color: notification['color'] as Color,
                        size: 24,
                      ),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification['title'] as String,
                            style: TextStyle(
                              fontWeight: notification['isUnread']
                                  ? FontWeight.bold
                                  : FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        if (notification['isUnread'])
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Text(
                          notification['message'] as String,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          notification['time'] as String,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
