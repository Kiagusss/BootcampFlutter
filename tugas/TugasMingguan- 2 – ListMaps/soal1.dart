List<int> range(int startNum, int finishNum) {
  List<int> result = [];
  for (int i = startNum; i <= finishNum; i++) {
    result.add(i);
  }
  return result;
}

void main() {
  int start = 1;
  int finish = 10;
  
  List<int> rangeList = range(start, finish);
  print(rangeList); 
}
