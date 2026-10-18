import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/neo_theme.dart';

class NeoCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback? onTap;

  const NeoCard({super.key, required this.child, this.color = NeoColors.surface, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: NeoColors.neonGreen, width: 2),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(color: NeoColors.neonGreen, offset: Offset(4, 4), blurRadius: 0),
          ],
        ),
        child: child,
      ),
    );
  }
}

class NeoButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final IconData? icon;

  const NeoButton({super.key, required this.text, required this.onPressed, this.color = NeoColors.neonGreen, this.icon});

  @override
  State<NeoButton> createState() => _NeoButtonState();
}

class _NeoButtonState extends State<NeoButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) { setState(() => _isPressed = false); widget.onPressed(); },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        transform: Matrix4.translationValues(_isPressed ? 3 : 0, _isPressed ? 3 : 0, 0),
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(color: NeoColors.white, width: 2),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isPressed ? [] : const [BoxShadow(color: Colors.white, offset: Offset(4, 4), blurRadius: 0)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[Icon(widget.icon, color: Colors.black), const SizedBox(width: 8)],
            Text(widget.text, style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class NeoTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;

  const NeoTextField({super.key, required this.hint, required this.icon, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: NeoColors.surface,
        border: Border.all(color: NeoColors.neonBlue, width: 2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: NeoColors.neonBlue, offset: Offset(3, 3), blurRadius: 0)],
      ),
      child: TextFormField(
        obscureText: obscure,
        style: GoogleFonts.poppins(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: Colors.grey),
          prefixIcon: Icon(icon, color: NeoColors.neonBlue),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
      ),
    );
  }
}
