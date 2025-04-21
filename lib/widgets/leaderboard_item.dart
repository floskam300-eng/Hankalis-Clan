import 'package:flutter/material.dart';

class LeadboardItem extends StatelessWidget {
  const LeadboardItem({
    super.key,
    required this.photo,
    required this.leadNumber,
  });

  final String photo;
  final int leadNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 70,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color:
                    leadNumber == 1
                        ? Color.fromRGBO(255, 223, 116, 1)
                        : leadNumber == 3
                        ? Color(0xffCE8946)
                        : Color(0xffC0C0C0),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Image.asset(photo),
              ),
            ),
          ),
          leadNumber == 1
              ? Align(
                alignment: Alignment.topCenter,
                child: Image.asset("../assets/crown.png", height: 40),
              )
              : SizedBox(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 25,
              margin: EdgeInsets.only(bottom: 20),
              child: CircleAvatar(
                backgroundColor:
                    leadNumber == 1
                        ? Color.fromRGBO(255, 223, 116, 1)
                        : leadNumber == 3
                        ? Color(0xffCE8946)
                        : Color(0xffC0C0C0),
                child: Text(
                  leadNumber.toString(),
                  style: TextStyle(
                    color:
                        leadNumber == 1 || leadNumber == 2
                            ? Colors.black
                            : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
