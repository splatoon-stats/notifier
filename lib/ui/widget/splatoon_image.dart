import 'package:notifier/ui/all.dart';

const String _SPLATOON_STATS_IMAGE_BASE_URL = 'https://splatoon-stats-api.yuki.games/static';

class SplatoonImage extends StatelessWidget {
  const SplatoonImage(this.path);

  final String path;

  @override
  Widget build(BuildContext context) {
    final String src = _SPLATOON_STATS_IMAGE_BASE_URL + path;
    return Image.network(src);
  }
}

class StageImage extends StatelessWidget {
  const StageImage(this.path);

  final String path;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 640 / 360,
      child: SplatoonImage(path),
    );
  }
}

class WeaponImage extends StatelessWidget {
  const WeaponImage(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return SplatoonImage('/stage/$name');
  }
}
