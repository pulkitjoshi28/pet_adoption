import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionbloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionevents.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionstates.dart';

class AdoptButton extends StatefulWidget {
  final String id;
  final bool status;

  const AdoptButton({Key? key, required this.status, required this.id}) : super(key: key);

  @override
  State<AdoptButton> createState() => _AdoptButtonState();
}

class _AdoptButtonState extends State<AdoptButton> {
  ConfettiController controller =
      ConfettiController(duration: const Duration(seconds: 10));

  late bool status = widget.status;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetAdoptionBloc, PetStates>(
      buildWhen: (_, state) => (state is PetsLoadedState),
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            status
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        child: const Text(
                          'Adopted',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: 'This pet is already adopted',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.grey[800],
                            textColor: Colors.green,
                          );
                        },
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            status = !status;
                          });
                          controller.play(); // Start the confetti animation.
                          Fluttertoast.showToast(
                            msg: 'Yay!! You have adopted this pet',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.grey[800],
                            textColor: Colors.green,
                          );
                          BlocProvider.of<PetAdoptionBloc>(context)
                              .add(AdoptPetEvent(widget.id));
                        },
                        child: const Text(
                          'Adopt Me',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                confettiController: controller,
                blastDirectionality: BlastDirectionality.explosive,
                emissionFrequency: 0.05,
                numberOfParticles: 30,
                maxBlastForce: 10,
                minBlastForce: 5,
                blastDirection: -pi / 2,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
