void main() {
  Future.delayed(Duration(seconds: 2), () {
    print("Life");
  }).then((value) => {
        Future.delayed(Duration(seconds: 2), () {
          print("Is");
        }).then((value) => {
              Future.delayed(Duration(seconds: 2), () {
                print("Never Flat");
              })
            })
      });
}
