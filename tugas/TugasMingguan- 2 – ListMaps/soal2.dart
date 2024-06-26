List<int> range(int startNum, int finishNum, int step) {
  List<int> result = [];
  for (int i = startNum; i <= finishNum; i += step) {
    result.add(i);
    i + step;
  }
  return result;
}

void main() {
  int start = 1;
  int finish = 10;
  int step = 2;

  List<int> rangeList = range(start, finish, step);
  print(rangeList);
}
