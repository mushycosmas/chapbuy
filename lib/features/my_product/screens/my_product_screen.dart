import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'product_listing_screen.dart';
import 'add_product_screen.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({super.key});

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All Products';
  bool _showFilterMenu = false;

  final List<String> _filterOptions = [
    'All Products (42)',
    'Active (34)',
    'Out of Stock (2)',
    'Draft (2)',
    'Archived (2)',
  ];

  final List<_Product> _products = [
    _Product(name: 'Gold Ore Sample Pack', category: 'Mineral Products', price: r'$2500.00', unit: 'kg', status: 'Active',       weight: '250 kg', views: '261', orders: '0', imagePath: 'assets/images/gold.jpg'),
    _Product(name: 'Gold Ore Sample Pack', category: 'Mineral Products', price: r'$2500.00', unit: 'kg', status: 'Active',       weight: '250 kg', views: '261', orders: '0', imagePath: 'assets/images/gold.jpg'),
    _Product(name: 'Gold Ore Sample Pack', category: 'Mineral Products', price: r'$2500.00', unit: 'kg', status: 'Archived',     weight: '250 kg', views: '261', orders: '0', imagePath: 'assets/images/gold.jpg'),
    _Product(name: 'Gold Ore Sample Pack', category: 'Mineral Products', price: r'$2500.00', unit: 'kg', status: 'Draft',        weight: '250 kg', views: '261', orders: '0', imagePath: 'assets/images/gold.jpg'),
    _Product(name: 'Gold Ore Sample Pack', category: 'Mineral Products', price: r'$2500.00', unit: 'kg', status: 'Archived',     weight: '250 kg', views: '261', orders: '0', imagePath: 'assets/images/gold.jpg'),
    _Product(name: 'Gold Ore Sample Pack', category: 'Mineral Products', price: r'$2500.00', unit: 'kg', status: 'Out of stock', weight: '250 kg', views: '261', orders: '0', imagePath: 'assets/images/gold.jpg'),
    _Product(name: 'Gold Ore Sample Pack', category: 'Mineral Products', price: r'$2500.00', unit: 'kg', status: 'Out of stock', weight: '250 kg', views: '261', orders: '0', imagePath: 'assets/images/gold.jpg'),
    _Product(name: 'Gold Ore Sample Pack', category: 'Mineral Products', price: r'$2500.00', unit: 'kg', status: 'Draft',        weight: '250 kg', views: '261', orders: '0', imagePath: 'assets/images/gold.jpg'),
  ];

  List<_Product> get _filtered {
    final query = _searchController.text.toLowerCase();
    return _products.where((p) {
      if (query.isNotEmpty && !p.name.toLowerCase().contains(query)) return false;
      if (_selectedFilter == 'All Products') return true;
      return p.status.toLowerCase().contains(_selectedFilter.toLowerCase().split(' ')[0].toLowerCase());
    }).toList();
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
                    child: Icon(Icons.chevron_left, size: 28,
                        color: Navigator.canPop(context) ? Colors.black87 : Colors.transparent),
                  ),
                  const Expanded(
                    child: Text('Product', textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black87)),
                  ),
                  const SizedBox(width: 28),
                ],
              ),
            ),

            // ── Stats Row ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _StatChip(
                    icon: Icons.inventory_2_outlined,
                    iconColor: AppColors.primaryBlue,
                    bgColor: AppColors.cardBgBlue,
                    label: 'Products',
                    value: '4',
                    sublabel: 'Active listings',
                  ),
                  const SizedBox(width: 8),
                  _StatChip(
                    icon: Icons.remove_red_eye_outlined,
                    iconColor: AppColors.success,
                    bgColor: AppColors.cardBgGreen,
                    label: 'Views',
                    value: '3,988',
                    sublabel: 'Total views',
                  ),
                  const SizedBox(width: 8),
                  _StatChip(
                    icon: Icons.attach_money,
                    iconColor: AppColors.warning,
                    bgColor: AppColors.cardBgOrange,
                    label: 'Revenue',
                    value: '\$137k',
                    sublabel: 'Total earned',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // ── Search + Filter ───────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (_) => setState(() {}),
                        style: const TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          hintStyle: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                          prefixIcon: Icon(Icons.search, size: 18, color: Colors.grey.shade400),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => _showFilterMenu = !_showFilterMenu),
                    child: Container(
                      height: 42, width: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Icon(Icons.filter_list, size: 18, color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
            ),

            // ── Filter Dropdown ───────────────────────────────────────────
            if (_showFilterMenu)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 16, top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 12, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    children: _filterOptions.map((opt) {
                      final isSelected = _selectedFilter == opt.split(' ')[0];
                      return GestureDetector(
                        onTap: () => setState(() {
                          _selectedFilter = opt.split(' ')[0];
                          _showFilterMenu = false;
                        }),
                        child: Container(
                          width: 160,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.success.withOpacity(0.08) : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(opt,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                color: isSelected ? AppColors.success : Colors.black87,
                              )),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

            const SizedBox(height: 8),

            // ── Product List ──────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                itemCount: _filtered.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _ProductCard(
                      product: _filtered[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductListingScreen(product: _filtered[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ── FAB ───────────────────────────────────────────────────────────────
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => const AddProductScreen(),
          ));
        },
        backgroundColor: AppColors.success,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}

// ── Stat Chip ─────────────────────────────────────────────────────────────────
class _StatChip extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String label;
  final String value;
  final String sublabel;

  const _StatChip({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.label,
    required this.value,
    required this.sublabel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 14, color: iconColor),
                const SizedBox(width: 4),
                Text(label, style: TextStyle(fontSize: 10, color: iconColor, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: iconColor)),
            Text(sublabel, style: TextStyle(fontSize: 9, color: iconColor.withOpacity(0.7))),
          ],
        ),
      ),
    );
  }
}

// ── Product Card ──────────────────────────────────────────────────────────────
class _ProductCard extends StatelessWidget {
  final _Product product;
  final VoidCallback onTap;

  const _ProductCard({required this.product, required this.onTap});

  Color get _statusColor {
    switch (product.status) {
      case 'Active':       return AppColors.success;
      case 'Archived':     return AppColors.purple;
      case 'Draft':        return Colors.grey;
      case 'Out of stock': return AppColors.error;
      default:             return Colors.grey;
    }
  }

  Color get _statusBgColor {
    switch (product.status) {
      case 'Active':       return AppColors.cardBgGreen;
      case 'Archived':     return AppColors.cardBgPurple;
      case 'Draft':        return Colors.grey.shade100;
      case 'Out of stock': return AppColors.cardBgRed;
      default:             return Colors.grey.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Row(
          children: [
            // Product image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: product.imagePath != null
                  ? Image.asset(
                      product.imagePath!,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 64, height: 64,
                        color: Colors.amber.shade100,
                        child: Icon(Icons.inventory_2_outlined, color: Colors.amber.shade600, size: 28),
                      ),
                    )
                  : Container(
                      width: 64, height: 64,
                      color: Colors.amber.shade100,
                      child: Icon(Icons.inventory_2_outlined, color: Colors.amber.shade600, size: 28),
                    ),
            ),
            const SizedBox(width: 12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(product.name,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87),
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                      _ThreeDotMenu(product: product),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(product.category, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(product.price,
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.success)),
                      Text(' / ${product.unit}',
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: _statusBgColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(product.status,
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: _statusColor)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.scale_outlined, size: 12, color: Colors.grey.shade400),
                      const SizedBox(width: 3),
                      Text(product.weight, style: TextStyle(fontSize: 11, color: Colors.grey.shade400)),
                      const SizedBox(width: 10),
                      Icon(Icons.remove_red_eye_outlined, size: 12, color: Colors.grey.shade400),
                      const SizedBox(width: 3),
                      Text(product.views, style: TextStyle(fontSize: 11, color: Colors.grey.shade400)),
                      const SizedBox(width: 10),
                      Icon(Icons.shopping_bag_outlined, size: 12, color: Colors.grey.shade400),
                      const SizedBox(width: 3),
                      Text('${product.orders} orders', style: TextStyle(fontSize: 11, color: Colors.grey.shade400)),
                    ],
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

// ── 3-dot Menu ────────────────────────────────────────────────────────────────
class _ThreeDotMenu extends StatelessWidget {
  final _Product product;
  const _ThreeDotMenu({required this.product});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, size: 18, color: Colors.grey.shade500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (val) {},
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 'view',
          child: Row(children: [
            Icon(Icons.visibility_outlined, size: 16, color: AppColors.primaryBlue),
            const SizedBox(width: 8),
            const Text('View Product', style: TextStyle(fontSize: 13)),
          ]),
        ),
        PopupMenuItem(
          value: 'edit',
          child: Row(children: [
            Icon(Icons.edit_outlined, size: 16, color: Colors.black54),
            const SizedBox(width: 8),
            const Text('Edit Product', style: TextStyle(fontSize: 13)),
          ]),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Row(children: [
            Icon(Icons.delete_outline, size: 16, color: AppColors.error),
            const SizedBox(width: 8),
            Text('Delete', style: TextStyle(fontSize: 13, color: AppColors.error)),
          ]),
        ),
      ],
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────
class _Product {
  final String name;
  final String category;
  final String price;
  final String unit;
  final String status;
  final String weight;
  final String views;
  final String orders;
  final String? imagePath;

  const _Product({
    required this.name,
    required this.category,
    required this.price,
    required this.unit,
    required this.status,
    required this.weight,
    required this.views,
    required this.orders,
    this.imagePath,
  });
}