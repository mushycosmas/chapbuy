import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

// ignore: must_be_immutable
class ProductListingScreen extends StatefulWidget {
  final dynamic product;
  const ProductListingScreen({super.key, required this.product});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _nameController = TextEditingController(text: 'Cocoa Seed');
  final _descController = TextEditingController(text: 'Agriculture');
  final _rateController = TextEditingController(text: '12');
  final _priceController = TextEditingController(text: '35.00');
  final _categoryController = TextEditingController(text: 'Agriculture');
  final _stockController = TextEditingController(text: '455');
  final _shippingController = TextEditingController(text: '14-21 days');
  final _regionController = TextEditingController(text: 'Ghana');
  final _districtController = TextEditingController(text: 'Kumasi Metropolitan');
  final _tagsController = TextEditingController();

  String _visibility = 'active'; // active, draft, archived

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
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                    child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
                  ),
                  const Expanded(
                    child: Text('Manage your Product Listing',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87)),
                  ),
                  Icon(Icons.delete_outline, color: AppColors.error, size: 22),
                ],
              ),
            ),

            // ── Tabs ──────────────────────────────────────────────────────
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                labelColor: AppColors.success,
                unselectedLabelColor: Colors.grey.shade500,
                indicatorColor: AppColors.success,
                indicatorWeight: 2,
                labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(text: 'Details'),
                  Tab(text: 'Analytics'),
                  Tab(text: 'Settings'),
                ],
              ),
            ),

            // ── Tab Views ─────────────────────────────────────────────────
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _DetailsTab(
                    nameController: _nameController,
                    descController: _descController,
                    rateController: _rateController,
                    priceController: _priceController,
                    categoryController: _categoryController,
                    stockController: _stockController,
                    shippingController: _shippingController,
                    regionController: _regionController,
                    districtController: _districtController,
                  ),
                  const _AnalyticsTab(),
                  _SettingsTab(
                    visibility: _visibility,
                    onVisibilityChanged: (v) => setState(() => _visibility = v),
                    tagsController: _tagsController,
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

// ── Details Tab ───────────────────────────────────────────────────────────────
class _DetailsTab extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descController;
  final TextEditingController rateController;
  final TextEditingController priceController;
  final TextEditingController categoryController;
  final TextEditingController stockController;
  final TextEditingController shippingController;
  final TextEditingController regionController;
  final TextEditingController districtController;

  const _DetailsTab({
    required this.nameController,
    required this.descController,
    required this.rateController,
    required this.priceController,
    required this.categoryController,
    required this.stockController,
    required this.shippingController,
    required this.regionController,
    required this.districtController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Product is Live banner ────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.cardBgGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle_outline, size: 16, color: AppColors.success),
                    const SizedBox(width: 6),
                    Text('Product is Live', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.success)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.visibility_outlined, size: 14, color: AppColors.success),
                    const SizedBox(width: 4),
                    Text('Visible to buyers', style: TextStyle(fontSize: 12, color: AppColors.success)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Upload Media ──────────────────────────────────────────────
          const Text('Upload Product Media',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
          const SizedBox(height: 4),
          Text('Upload media to showcase your products. The first uploaded media will be the main preview.',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
          const SizedBox(height: 12),

          // Main image — full width
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/list.jpg',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 160, width: double.infinity,
                color: Colors.amber.shade100,
                child: Icon(Icons.image_outlined, size: 48, color: Colors.amber.shade400),
              ),
            ),
          ),
          const SizedBox(height: 8),

          const Text('Upload Product Image',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
          const SizedBox(height: 8),

          // Image grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
            children: [
              // All 5 tiles show the cocoa image
              ...List.generate(5, (i) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/list.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.amber.shade100,
                    child: Icon(Icons.image_outlined, color: Colors.amber.shade400, size: 28),
                  ),
                ),
              )),
              // Upload video — dashed green box
              GestureDetector(
                onTap: () {},
                child: CustomPaint(
                  painter: _DashedBorderPainter(
                    color: AppColors.success,
                    strokeWidth: 1.5,
                    gap: 5,
                    dash: 6,
                    radius: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.videocam_outlined,
                            color: AppColors.success, size: 24),
                        const SizedBox(height: 4),
                        Text('Upload video',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.success,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ── Form fields ───────────────────────────────────────────────
          _FormField(label: 'Product Name', controller: nameController),
          const SizedBox(height: 12),
          _FormField(label: 'Description', controller: descController, maxLines: 2),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _FormField(label: 'Rate (per kg)', controller: rateController, keyboardType: TextInputType.number)),
              const SizedBox(width: 12),
              Expanded(child: _FormField(label: 'Price (\$)', controller: priceController, keyboardType: TextInputType.number)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _FormField(label: 'Category', controller: categoryController)),
              const SizedBox(width: 12),
              Expanded(child: _FormField(label: 'Stock Quantity', controller: stockController, keyboardType: TextInputType.number)),
            ],
          ),
          const SizedBox(height: 12),
          _FormField(label: 'Shipping & Delivery (Days)', controller: shippingController,
              hint: 'Free free order to shipment'),
          const SizedBox(height: 12),
          _FormField(label: 'Region', controller: regionController),
          const SizedBox(height: 12),
          _FormField(label: 'District', controller: districtController),
          const SizedBox(height: 24),

          // ── Cancel / Save ─────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Cancel', style: TextStyle(fontSize: 14, color: Colors.black54)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Save Changes', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ── Analytics Tab ─────────────────────────────────────────────────────────────
class _AnalyticsTab extends StatelessWidget {
  const _AnalyticsTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Performance Overview ──────────────────────────────────────
          const Text('Performance Overview',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _MetricCard(
                icon: Icons.remove_red_eye_outlined,
                iconColor: AppColors.primaryBlue,
                bgColor: AppColors.cardBgBlue,
                label: 'Total Views',
                value: '1245',
                change: '+87 this week',
              )),
              const SizedBox(width: 10),
              Expanded(child: _MetricCard(
                icon: Icons.shopping_cart_outlined,
                iconColor: AppColors.success,
                bgColor: AppColors.cardBgGreen,
                label: 'Total Orders',
                value: '34',
                change: '+5 this week',
              )),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _MetricCard(
                icon: Icons.attach_money,
                iconColor: AppColors.purple,
                bgColor: AppColors.cardBgPurple,
                label: 'Total Revenue',
                value: r'$28,900',
                change: r'+$4250 this week',
              )),
              const SizedBox(width: 10),
              Expanded(child: _MetricCard(
                icon: Icons.trending_up,
                iconColor: AppColors.warning,
                bgColor: AppColors.cardBgOrange,
                label: 'Conversion',
                value: '2.7%',
                change: 'Views to orders',
              )),
            ],
          ),
          const SizedBox(height: 20),

          // ── Views This Week Chart ─────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + time filters
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Views This Week',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                    Row(
                      children: ['1D','1W','1M','3M','6M','1Y'].map((label) {
                        final isActive = label == '1M';
                        return Container(
                          margin: const EdgeInsets.only(left: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            color: isActive ? AppColors.success : Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(label,
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: isActive ? Colors.white : Colors.grey.shade400,
                              )),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: '2378 ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '(views)',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 130,
                  child: CustomPaint(
                    painter: _ChartPainter(),
                    size: const Size(double.infinity, 130),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                      .map((d) => Text(d, style: TextStyle(fontSize: 10, color: Colors.grey.shade400)))
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Additional Metrics ────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Additional Metrics', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                _MetricRow(label: 'Average Order Value', value: '\$850'),
                const Divider(height: 20, color: Color(0xFFF0F0F0)),
                _MetricRow(label: 'Click-through Rate', value: '4.2%'),
                const Divider(height: 20, color: Color(0xFFF0F0F0)),
                _MetricRow(label: 'Add to Cart Rate', value: '8.5%'),
                const Divider(height: 20, color: Color(0xFFF0F0F0)),
                _MetricRow(label: 'Listing Quality Score', value: '87/100', valueColor: AppColors.success),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Cancel / Save ─────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Cancel', style: TextStyle(fontSize: 14, color: Colors.black54)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Save Changes', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ── Settings Tab ──────────────────────────────────────────────────────────────
class _SettingsTab extends StatelessWidget {
  final String visibility;
  final ValueChanged<String> onVisibilityChanged;
  final TextEditingController tagsController;

  const _SettingsTab({
    required this.visibility,
    required this.onVisibilityChanged,
    required this.tagsController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Visibility & Status ───────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Visibility & Status',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87)),
                const SizedBox(height: 16),
                _VisibilityOption(
                  title: 'Active Listing',
                  subtitle: 'Product is visible to all buyers',
                  value: 'active',
                  groupValue: visibility,
                  onChanged: onVisibilityChanged,
                  activeColor: AppColors.success,
                ),
                const Divider(height: 20, color: Color(0xFFF0F0F0)),
                _VisibilityOption(
                  title: 'Draft',
                  subtitle: 'Save as draft, not visible to buyers',
                  value: 'draft',
                  groupValue: visibility,
                  onChanged: onVisibilityChanged,
                  activeColor: Colors.grey,
                ),
                const Divider(height: 20, color: Color(0xFFF0F0F0)),
                _VisibilityOption(
                  title: 'Archived',
                  subtitle: 'Hide from listings, keep for records',
                  value: 'archived',
                  groupValue: visibility,
                  onChanged: onVisibilityChanged,
                  activeColor: AppColors.purple,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── SEO & Discoverability ─────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('SEO & Discoverability',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87)),
                const SizedBox(height: 14),
                const Text('Search Tags',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
                const SizedBox(height: 8),
                TextField(
                  controller: tagsController,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'e.g., cashew, nuts, organic, west africa',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text('Add keywords to help buyers find your product',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade400)),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Danger Zone ───────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.error.withOpacity(0.2)),
              boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Danger Zone',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.error)),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: AppColors.error),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text('Delete Product Permanently',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.error)),
                  ),
                ),
                const SizedBox(height: 8),
                Text('This action cannot be undone. All analytics data will be lost.',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ── Cancel / Save ─────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Cancel', style: TextStyle(fontSize: 14, color: Colors.black54)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Save Changes', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ── Visibility Option ─────────────────────────────────────────────────────────
class _VisibilityOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;
  final Color activeColor;

  const _VisibilityOption({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? activeColor : Colors.black87,
                    )),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
              ],
            ),
          ),
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: (v) => onChanged(v!),
            activeColor: activeColor,
          ),
        ],
      ),
    );
  }
}

// ── Metric Card ───────────────────────────────────────────────────────────────
class _MetricCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String label;
  final String value;
  final String change;

  const _MetricCard({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.label,
    required this.value,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: iconColor),
              const SizedBox(width: 5),
              Expanded(
                child: Text(label,
                    style: TextStyle(fontSize: 11, color: iconColor, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(change,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
        ],
      ),
    );
  }
}

// ── Metric Row ────────────────────────────────────────────────────────────────
class _MetricRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _MetricRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
        Text(value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: valueColor ?? Colors.black87,
            )),
      ],
    );
  }
}

// ── Form Field ────────────────────────────────────────────────────────────────
class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hint;
  final int maxLines;
  final TextInputType keyboardType;

  const _FormField({
    required this.label,
    required this.controller,
    this.hint,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Enhanced Chart Painter ────────────────────────────────────────────────────
class _ChartPainter extends CustomPainter {
  final List<double> points = const [0.30, 0.42, 0.28, 0.55, 0.38, 0.72, 0.48, 0.65, 0.40, 0.58, 0.45, 0.68, 0.52];

  Offset _pointAt(int i, Size size) {
    final x = i * size.width / (points.length - 1);
    final y = size.height * 0.88 - points[i] * size.height * 0.75;
    return Offset(x, y);
  }

  void _drawDashed(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    const dashLen = 5.0;
    const gapLen = 4.0;
    final dx = p2.dx - p1.dx;
    final dy = p2.dy - p1.dy;
    final dist = (dx * dx + dy * dy) > 0
        ? (dx * dx + dy * dy) < 1e10 ? (dx * dx + dy * dy) : 0.0
        : 0.0;
    if (dist == 0) return;
    final len = dist == 0 ? 1.0 : dist;
    // simple approach: just draw dashes along the line
    double traveled = 0;
    final total = (dx.abs() > dy.abs()) ? dx.abs() : dy.abs();
    final nx = dx / (total == 0 ? 1 : total);
    final ny = dy / (total == 0 ? 1 : total);
    double x = p1.dx, y = p1.dy;
    bool drawing = true;
    while ((nx > 0 ? x <= p2.dx : x >= p2.dx) ||
           (ny > 0 ? y <= p2.dy : y >= p2.dy)) {
      final seg = drawing ? dashLen : gapLen;
      final ex = x + nx * seg;
      final ey = y + ny * seg;
      if (drawing) canvas.drawLine(Offset(x, y), Offset(ex, ey), paint);
      x = ex; y = ey;
      drawing = !drawing;
      traveled += seg;
      if (traveled > 500) break;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // ── Grid lines ──
    final gridPaint = Paint()
      ..color = const Color(0xFFF5F5F5)
      ..strokeWidth = 1;
    for (int i = 0; i <= 3; i++) {
      final y = size.height * 0.1 + (size.height * 0.8 / 3) * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // ── Smooth curve ──
    final linePath = Path();
    final fillPath = Path();
    for (int i = 0; i < points.length; i++) {
      final p = _pointAt(i, size);
      if (i == 0) {
        linePath.moveTo(p.dx, p.dy);
        fillPath.moveTo(0, size.height);
        fillPath.lineTo(p.dx, p.dy);
      } else {
        final prev = _pointAt(i - 1, size);
        final cpX = (prev.dx + p.dx) / 2;
        linePath.cubicTo(cpX, prev.dy, cpX, p.dy, p.dx, p.dy);
        fillPath.cubicTo(cpX, prev.dy, cpX, p.dy, p.dx, p.dy);
      }
    }
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    // Gradient fill
    canvas.drawPath(
      fillPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF27AE60).withOpacity(0.35),
            const Color(0xFF27AE60).withOpacity(0.0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
        ..style = PaintingStyle.fill,
    );

    // Line stroke
    canvas.drawPath(
      linePath,
      Paint()
        ..color = const Color(0xFF27AE60)
        ..strokeWidth = 2.5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    // ── Find peak ──
    int peakIdx = 0;
    for (int i = 1; i < points.length; i++) {
      if (points[i] > points[peakIdx]) peakIdx = i;
    }
    final peak = _pointAt(peakIdx, size);

    // ── Dashed crosshair FIRST (behind dot) ──
    final crossPaint = Paint()
      ..color = const Color(0xFF3498DB).withOpacity(0.4)
      ..strokeWidth = 1;
    _drawDashed(canvas, Offset(0, peak.dy), Offset(size.width, peak.dy), crossPaint);
    _drawDashed(canvas, Offset(peak.dx, 0), Offset(peak.dx, size.height), crossPaint);

    // ── Single green dot at peak ON TOP of crosshair ──
    canvas.drawCircle(peak, 8, Paint()..color = const Color(0xFF27AE60).withOpacity(0.2));
    canvas.drawCircle(peak, 6, Paint()..color = Colors.white);
    canvas.drawCircle(peak, 4.5, Paint()..color = const Color(0xFF27AE60));
  }

  @override
  bool shouldRepaint(_) => false;
}

// ── Dashed Border Painter ─────────────────────────────────────────────────────
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double dash;
  final double radius;

  const _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.dash,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(strokeWidth / 2, strokeWidth / 2,
            size.width - strokeWidth, size.height - strokeWidth),
        Radius.circular(radius),
      ));

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      bool draw = true;
      while (distance < metric.length) {
        final len = draw ? dash : gap;
        if (draw) {
          canvas.drawPath(
            metric.extractPath(distance, distance + len),
            paint,
          );
        }
        distance += len;
        draw = !draw;
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}