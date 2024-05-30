import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../constantes/constantes.dart';
import 'operations.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key, this.schoolid});
  final String? schoolid;

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final TextEditingController naissanceController = TextEditingController();
  final TextEditingController _matriculeController = TextEditingController();
  bool isDate = false;

  final _formKey = GlobalKey<FormState>();

  void updateDate(DateTime newDate) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String dateFormatted = formatter.format(newDate);
    setState(() {
      naissanceController.text = dateFormatted;
    });
  }

  // Future<void> setBirthday() async {
  //   DateTime currentDate = DateTime.now();

  //   FocusScope.of(context).requestFocus(FocusNode());

  //   DateTime? selectedDate = await showCupertinoModalPopup<DateTime>(
  //     context: context,
  //     builder: (BuildContext builder) {
  //       return Container(
  //         color: Theme.of(context).canvasColor,
  //         height: MediaQuery.of(context).size.height / 3,
  //         child: CupertinoDatePicker(
  //           mode: CupertinoDatePickerMode.date,
  //           dateOrder: DatePickerDateOrder.dmy,
  //           initialDateTime: currentDate,
  //           minimumDate: DateTime(1900),
  //           maximumDate: currentDate,
  //           onDateTimeChanged: (DateTime newDateTime) {
  //             updateDate(newDateTime);
  //           },
  //         ),
  //       );
  //     },
  //   );

  //   if (selectedDate != null) {
  //     updateDate(selectedDate);
  //   }
  // }

    void setBirthday() async {
    DateTime? date = DateTime(1900);
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    date = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: "ENTREZ UNE DATE",
      errorFormatText: "Format invalide essayez avec: xx/xx/xxxx",
      errorInvalidText: "",
      fieldHintText: "xx/xx/xxxx",
      fieldLabelText: "Entrez la date de naissance",
    );
    if (date != null) {
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String dateFormatted = formatter.format(date);
      setState(() {
        naissanceController.text = dateFormatted;
        isDate = true;
      });
    }
  }

  void valider({required TextEditingController matricule}) async {
    Get.to(() => Operation(
          matricule: _matriculeController.text.trim().toString(),
          naissance: naissanceController.text,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: FilledButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              valider(matricule: _matriculeController);
            }
          },
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width, 55),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: const Text(
            'Rechercher',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // Container(
      //     height: MediaQuery.of(context).size.height * 0.055,
      //     width: MediaQuery.of(context).size.width * 0.9,
      //     decoration: BoxDecoration(
      //       color: Theme.of(context).buttonTheme.colorScheme!.primaryContainer,
      //       borderRadius: BorderRadius.circular(20.0),
      //       border: const Border.fromBorderSide(BorderSide.none),
      //     ),
      //     child: InkWell(
      //       onTap: () {
      //         if (_formKey.currentState!.validate()) {
      //           valider(matricule: _matriculeController);
      //         }
      //       },
      //       child: const Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           AutoSizeText(
      //             "Rechercher",
      //             style: TextStyle(
      //                 fontSize: 14.0,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.white),
      //             maxLines: 1,
      //             overflow: TextOverflow.ellipsis,
      //           ),
      //         ],
      //       ),
      //     )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // appBar: AppBar(
      //   // centerTitle: true,
      //   title: const AutoSizeText(
      //     "CSV - PAY",
      //     maxLines: 1,
      //     overflow: TextOverflow.ellipsis,
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   // backgroundColor: Couleurs.CouleurSecondaire,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.notifications_none,
      //         // size: 35,
      //       ),
      //       onPressed: () {
      //         // logout();
      //       },
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage("assets/images/arc.jpg"),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Center(
                    child: AutoSizeText(
                      "IDENTIFICATION",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium,
                      maxFontSize: 20,
                      minFontSize: 12,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //Image.asset("assets/images/registration.png", width: 200,),

                  Container(
                    margin: const EdgeInsets.only(
                      left: Dimensions.MobileMargin,
                      right: Dimensions.MobileMargin,
                    ),
                    child: TextFormField(
                      controller: _matriculeController,
                      //inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9]'))],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Ex: XXXXXXXXXX",
                        prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Icon(
                              Icons.credit_card,
                              // color: Couleurs.ButtonCouleur,
                            )),
                        labelText: "Matricule ou Numéro de téléphone",
                        filled: true,
                        // fillColor: Colors.white,

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(style: BorderStyle.solid)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              // color: Couleurs.ButtonCouleur,
                              ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez saisir le matricule ou votre numéro de tél";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  Container(
                    // height: 60,
                    margin: const EdgeInsets.only(
                      left: Dimensions.MobileMargin,
                      right: Dimensions.MobileMargin,
                    ),
                    child: TextFormField(
                      controller: naissanceController,
                      onTap: () {
                        setBirthday();
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                          child: Icon(
                            Icons.date_range,
                            // color: Couleurs.ButtonCouleur,
                          ),
                        ),
                        labelText: "Date de naissance de l'élève",
                        hintText: "Entrez la date de naissance de l'élève",
                        filled: true,
                        // fillColor: Colors.white,

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(style: BorderStyle.solid)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            width: 1,
                            // color: Couleurs.ButtonCouleur,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer la date de naissance de l'élève";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
