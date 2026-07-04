import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

/// Animated splash screen: logo scales & fades in, a lightning bolt
/// "flickers", then the tagline slides up before navigating to Home.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final AnimationController _boltController;
  late final AnimationController _taglineController;

  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _boltFlicker;
  late final Animation<Offset> _taglineSlide;
  late final Animation<double> _taglineOpacity;

  @override
  void initState() {
    super.initState();

    // Logo pops in with an overshoot (elastic) scale + fade.
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _logoScale = CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    );
    _logoOpacity = CurvedAnimation(
      parent: _logoController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
    );

    // Lightning bolt flickers a couple of times once logo has landed.
    _boltController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _boltFlicker = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.2), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.2, end: 1.0), weight: 1),
    ]).animate(_boltController);

    // Tagline slides up from below with a fade.
    _taglineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _taglineSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _taglineController, curve: Curves.easeOut));
    _taglineOpacity = CurvedAnimation(
      parent: _taglineController,
      curve: Curves.easeIn,
    );

    _runSequence();
  }

  Future<void> _runSequence() async {
    await _logoController.forward();
    await _boltController.forward();
    await _taglineController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, animation, __) => const HomeScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _logoController.dispose();
    _boltController.dispose();
    _taglineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryYellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo: rounded square with lightning bolt, like Blinkit's mark.
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return Opacity(
                  opacity: _logoOpacity.value.clamp(0.0, 1.0),
                  child: Transform.scale(
                    scale: _logoScale.value,
                    child: child,
                  ),
                );
              },
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: AppColors.textDark,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: AnimatedBuilder(
                    animation: _boltFlicker,
                    builder: (context, child) {
                      return Opacity(
                        opacity: 0.4 + (0.6 * _boltFlicker.value),
                        child: child,
                      );
                    },
                    child: const Icon(
                      Icons.bolt_rounded,
                      color: AppColors.primaryYellow,
                      size: 72,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            SlideTransition(
              position: _taglineSlide,
              child: FadeTransition(
                opacity: _taglineOpacity,
                child: Column(
                  children: [
                    Text(
                      'blinkit',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Delivery in minutes',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDark.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
