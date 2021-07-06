part of 'widgets.dart';

class SecondaryButton extends StatelessWidget {
  final title;
  bool? focus;
  final icon;
  final color;
  void Function()? onPress;
  final backgroundColor;
  final radius;

  SecondaryButton({
    Key? key,
    this.title,
    this.focus,
    this.color,
    this.backgroundColor,
    this.icon,
    this.onPress,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPress,
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Icon(icon),
      ),
      autofocus: focus,
      label: Text(title),
      style: TextButton.styleFrom(
        primary: color,
        alignment: Alignment.centerLeft,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: radius,
        ),
      ),
    );
  }
}
