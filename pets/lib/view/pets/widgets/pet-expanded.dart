import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/view/pets/widgets/pet-item.dart';

class PetExpanded extends StatefulWidget {
  const PetExpanded({
    required this.pet,
    required this.size,
    Key? key,
  }) : super(key: key);

  final PetModel pet;
  final double size;

  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<PetExpanded> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Row(
              children: [
                PetItem(
                  pet: widget.pet,
                  size: 70,
                  name: 'Life',
                ),
                PetItem(
                  pet: widget.pet,
                  size: 70,
                  name: 'Happy',
                ),
                PetItem(
                  pet: widget.pet,
                  size: 70,
                  name: 'Clean',
                ),
                PetItem(pet: widget.pet, size: 70, name: 'Eat'),
                PetItem(
                  pet: widget.pet,
                  size: 70,
                  name: 'Sleep',
                )
              ],
            )),
        Expanded(
          flex: 5,
          child: Container(
            width: widget.size,
            height: widget.size,
            color: Colors.white,
            child: widget.pet.imageUrl.contains('svg')
                ? SvgPicture.asset(
                    widget.pet.imageUrl,
                    fit: BoxFit.contain,
                    color: widget.pet.color,
                  )
                : Image.asset(
                    widget.pet.imageUrl,
                    fit: BoxFit.contain,
                    color: widget.pet.color,
                  ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 70,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.fastfood_outlined,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.pet.petClean();
                      });
                    },
                    child: Icon(
                      Icons.bathtub_outlined,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.pet.petSleep();
                      });
                    },
                    child: Icon(
                      Icons.nights_stay_outlined,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.sports_cricket_sharp,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.medical_services_outlined,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
