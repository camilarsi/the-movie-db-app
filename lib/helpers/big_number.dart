class BigNumber {
  final int _number;

  BigNumber(this._number);

  int get number => _number;

  String getShortString() {
    if (_number >= 1000000) {
      return '${(_number / 1000000).toStringAsFixed(1)}M';
    }
    if (_number >= 1000) {
      return '${(_number / 1000).toStringAsFixed(1)}K';
    }
    return _number.toString();
  }
}
