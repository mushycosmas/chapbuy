import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool _isEditing = false;

  final _firstNameController  = TextEditingController(text: 'John');
  final _lastNameController   = TextEditingController(text: 'Micheal');
  final _locationController   = TextEditingController(text: 'Lagos');
  final _genderController     = TextEditingController(text: 'Male');
  final _emailController      = TextEditingController(text: 'thegabrielamcpherson@email.com');
  final _phoneController      = TextEditingController(text: '+234 35251398');

  // Read-only values for view mode
  String _firstName  = 'Gabriella';
  String _lastName   = 'McPherson';
  String _location   = 'Lagos';
  String _gender     = 'Male';
  String _email      = 'thegabrielamcpherson@email.com';
  String _phone      = '+234 9036696289';

  void _startEditing() {
    _firstNameController.text  = _firstName;
    _lastNameController.text   = _lastName;
    _locationController.text   = _location;
    _genderController.text     = _gender;
    _emailController.text      = _email;
    _phoneController.text      = _phone;
    setState(() => _isEditing = true);
  }

  void _saveEditing() {
    setState(() {
      _firstName  = _firstNameController.text;
      _lastName   = _lastNameController.text;
      _location   = _locationController.text;
      _gender     = _genderController.text;
      _email      = _emailController.text;
      _phone      = _phoneController.text;
      _isEditing  = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                    child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
                  ),
                  const Expanded(
                    child: Text('Profile', textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87)),
                  ),
                  if (!_isEditing)
                    GestureDetector(
                      onTap: _startEditing,
                      child: Icon(Icons.edit_outlined, size: 22, color: Colors.grey.shade600),
                    )
                  else
                    const SizedBox(width: 22),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Avatar ──────────────────────────────────────────
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 44,
                                backgroundColor: AppColors.primaryBlue.withOpacity(0.15),
                                child: const Icon(Icons.person, size: 44, color: AppColors.primaryBlue),
                              ),
                              if (_isEditing)
                                Positioned(
                                  bottom: 0, right: 0,
                                  child: Container(
                                    width: 26, height: 26,
                                    decoration: BoxDecoration(
                                      color: AppColors.success,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 2),
                                    ),
                                    child: const Icon(Icons.camera_alt, size: 12, color: Colors.white),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Profile photo',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
                          const SizedBox(height: 4),
                          Text('This image will be displayed on your profile',
                              style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                          if (_isEditing) ...[
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.success.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.success.withOpacity(0.3)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.camera_alt_outlined, size: 14, color: AppColors.success),
                                    const SizedBox(width: 6),
                                    Text('Change Photo',
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                                            color: AppColors.success)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ── Fields ──────────────────────────────────────────
                    _isEditing
                        ? _buildEditFields()
                        : _buildViewFields(),

                    const SizedBox(height: 24),

                    // ── Delete / Buttons ─────────────────────────────────
                    if (!_isEditing)
                      Center(
                        child: GestureDetector(
                          onTap: () => _showDeleteDialog(context),
                          child: Text('Delete my account permanently',
                              style: TextStyle(fontSize: 13, color: AppColors.error,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => setState(() => _isEditing = false),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                side: BorderSide(color: Colors.grey.shade300),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text('Cancel', style: TextStyle(color: Colors.black54, fontSize: 14)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _saveEditing,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.success, elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text('Save',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── View Mode Fields ────────────────────────────────────────────────────────
  Widget _buildViewFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ViewField(label: 'First name', value: _firstName),
        const SizedBox(height: 12),
        _ViewField(label: 'Last name', value: _lastName),
        const SizedBox(height: 12),
        _ViewField(label: 'Location', value: _location),
        const SizedBox(height: 12),
        _ViewField(label: 'Gender', value: _gender),
        const SizedBox(height: 12),
        _EmailField(email: _email),
        const SizedBox(height: 12),
        _ViewField(label: 'Phone Number', value: _phone),
      ],
    );
  }

  // ── Edit Mode Fields ────────────────────────────────────────────────────────
  Widget _buildEditFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _EditField(label: 'First name', controller: _firstNameController),
        const SizedBox(height: 12),
        _EditField(label: 'Last name', controller: _lastNameController),
        const SizedBox(height: 12),
        _EditField(label: 'Location', controller: _locationController),
        const SizedBox(height: 12),
        _EditField(label: 'Gender', controller: _genderController),
        const SizedBox(height: 12),
        _EmailFieldEdit(controller: _emailController),
        const SizedBox(height: 12),
        _PhoneEditField(controller: _phoneController),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56, height: 56,
                decoration: BoxDecoration(color: AppColors.error.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(Icons.delete_outline, color: AppColors.error, size: 28),
              ),
              const SizedBox(height: 16),
              const Text('Delete Account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87)),
              const SizedBox(height: 8),
              Text('Are you sure you want to delete your account? This action cannot be undone.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.5)),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Cancel', style: TextStyle(color: Colors.black54)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error, elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── View Field ────────────────────────────────────────────────────────────────
class _ViewField extends StatelessWidget {
  final String label;
  final String value;
  const _ViewField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Text(value, style: const TextStyle(fontSize: 13, color: Colors.black87)),
        ),
      ],
    );
  }
}

// ── Email View Field (with Verified badge) ────────────────────────────────────
class _EmailField extends StatelessWidget {
  final String email;
  const _EmailField({required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email address', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(email, style: TextStyle(fontSize: 13, color: Colors.grey.shade400)),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.check_circle, size: 13, color: AppColors.success),
                  const SizedBox(width: 4),
                  Text('Verified', style: TextStyle(fontSize: 11, color: AppColors.success,
                      fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Edit Field ────────────────────────────────────────────────────────────────
class _EditField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const _EditField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          decoration: InputDecoration(
            filled: true, fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5)),
          ),
        ),
      ],
    );
  }
}

// ── Email Edit Field (greyed out + Verified) ──────────────────────────────────
class _EmailFieldEdit extends StatelessWidget {
  final TextEditingController controller;
  const _EmailFieldEdit({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email address', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.text, style: TextStyle(fontSize: 13, color: Colors.grey.shade400)),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.check_circle, size: 13, color: AppColors.success),
                  const SizedBox(width: 4),
                  Text('Verified', style: TextStyle(fontSize: 11, color: AppColors.success,
                      fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Phone Edit Field (with flag picker) ──────────────────────────────────────
class _PhoneEditField extends StatelessWidget {
  final TextEditingController controller;
  const _PhoneEditField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
        const SizedBox(height: 6),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  const Text('🇳🇬', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 3),
                  Icon(Icons.keyboard_arrow_down, size: 15, color: Colors.grey.shade500),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
                decoration: InputDecoration(
                  filled: true, fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade200)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade200)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}