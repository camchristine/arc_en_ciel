import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../api/api.dart';
import '../../controllers/c_user.dart';
import 'paiement.dart';
import 'package:http/http.dart' as http;

class ModePaiement extends StatefulWidget {
  final Map data;
  // ignore: prefer_typing_uninitialized_variables
  final montant;
  final String echeancier;

  const ModePaiement({
    Key? key,
    required this.data,
    required this.montant,
    required this.echeancier,
  }) : super(key: key);

  @override
  State<ModePaiement> createState() => _ModePaiementState();
}

class _ModePaiementState extends State<ModePaiement> {
  final TextEditingController _telephoneController = TextEditingController();
  final NumberFormat myFormat = NumberFormat.decimalPattern('eu');
  final _cUser = Get.put(CUser());

  //  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   print('test');

  //   // Ajouter un délai de 2 secondes avant d'afficher la fenêtre modale
  //   Future.delayed(Duration(seconds: 2), () {
  //     print('object');
  //     // Utiliser le contexte du Scaffold pour afficher la fenêtre modale
  //     // _showModal(context);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // Ajouter un délai de 2 secondes avant d'afficher la fenêtre modale
    Future.delayed(const Duration(seconds: 0), () {
      print('object');
      // Utiliser le contexte du Scaffold pour afficher la fenêtre modale
      // _showModal(context);
    });
  }

  // Fonction pour afficher la fenêtre modale
  void _showModal(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Scaffold(
            floatingActionButton: Column(
              children: [
                Expanded(child: Container()), // Espace extensible
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Get.off(() => const AwaitWebhook());
                      },
                      style: ButtonStyle(
                          fixedSize: WidgetStateProperty.all(
                            Size(MediaQuery.of(context).size.width, 45),
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Theme.of(context).buttonTheme.colorScheme!.primary,
                          )),
                      child: Text(
                        "S'abonner",
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(
                          Size(MediaQuery.of(context).size.width, 45),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Pas maintenant',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: SingleChildScrollView(
              child: Center(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  Image(
                    image: const AssetImage("assets/images/nav-logo.png"),
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Incroyable mais',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        // style: GoogleFonts.kaushanScript(fontSize: 25),
                      ),
                      Text(
                        ' WAVE 🤩',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),

                        // style:
                        //     GoogleFonts.kaushanScript(fontSize: 25, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "FRAIS DE TRANSACTIONS : 0 F",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "durant toute l'année scolaire.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Card(
                      elevation: 8,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          // style: ListTileStyle(),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Forfait annuel',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    // SizedBox(height: 50,),
                                    Container(
                                        decoration: BoxDecoration(
                                            // border: Border.all(color: Colors.red),
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            'Economisez 37%',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              // const SizedBox(
                              //   height: 15,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "13.500 F CFA par an",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // subtitle: Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          //   child: Text(
                          //     'Total: 13.500 F CFA par an',
                          //     style: Theme.of(context).textTheme.bodySmall,
                          //   ),
                          // ),
                          trailing: Icon(
                            Icons.check_circle_outline_outlined,
                            size: 50,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Text(
                      "Optez pour un abonnement annuel et réglez le coût de la Scolarité, Cantine et Transport de vos enfants via WAVE sans payer aucun frais durant toute l’année scolaire.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              )),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final int v2 = widget.montant;
    final int fraisWave = (v2 * 1 / 100).ceil();
    final int fraisMTN = (v2 * 2 / 100).ceil();
    final int fraisVISA = (v2 * 2.5 / 100).ceil();
    final int fraisOrange = (v2 * 1.5 / 100).ceil();
    final int fraisEliah = (v2 / 100).ceil();
    final int wave = v2 + fraisWave;
    final int mtn = v2 + fraisMTN;
    final int orange = v2 + fraisOrange;
    final int visa = v2 + fraisVISA;

    // Fonction pour afficher la fenêtre modale

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choix de l'opérateur"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchOperatorStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            final operatorStatus = snapshot.data as Map;
            return Column(
              children: [
                buildPaymentCard(
                  title: 'Wave',
                  fraisPercentage: 1,
                  total: wave,
                  image: 'assets/images/wave.png',
                  mode: 'WAVECI',
                  isDisabled: !operatorStatus[
                      'waveEnabled'], // Désactiver si le statut est false
                ),
                const SizedBox(height: 10),
                buildPaymentCard(
                  title: 'Orange Money',
                  fraisPercentage: 1.5,
                  total: orange,
                  image: 'assets/images/orange.png',
                  mode: 'OMCI',
                  backgroundColor: Colors.white,
                  isDisabled: !operatorStatus[
                      'orangeEnabled'], // Désactiver si le statut est false
                ),
                const SizedBox(height: 10),
                buildPaymentCard(
                  title: 'MTN MoMo',
                  fraisPercentage: 2,
                  total: mtn,
                  image: 'assets/images/mtn_momo.png',
                  mode: 'MTNCI',
                  backgroundColor: Colors.amber,
                  isDisabled: !operatorStatus[
                      'mtnEnabled'], // Désactiver si le statut est false
                ),
                const SizedBox(height: 10),
                buildPaymentCard(
                  title: 'VISA / MASTERCARD',
                  fraisPercentage: 2.5,
                  total: visa,
                  image: 'assets/images/visa_mastercard.png',
                  mode: 'CARD',
                  backgroundColor: Colors.white,
                  isDisabled: !operatorStatus[
                      'visaEnabled'], // Désactiver si le statut est false
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<Map> fetchOperatorStatus() async {
    final response = await http.get(Uri.parse(Api.operatorStatus));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Échec de la requête API');
    }
  }

  Widget buildPaymentCard({
    required String title,
    required double fraisPercentage,
    required int total,
    required String image,
    required String mode,
    Color? backgroundColor,
    bool? isDisabled,
  }) {
    var phone = _cUser.user.telephone;
    String phoneNumber = phone.substring(4);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 8,
        child: InkWell(
          onTap: () {
            var phone = _cUser.user.telephone;
            // print(total - widget.montant );
            if (isDisabled == true) return; // Ne fait rien si désactivé
            if (mode == 'MTNCI') {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Column(
                      children: [
                        Text(
                          'Ce numéro est-il correct ?',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Assurez-vous d'entrer un numéro MTN",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    content: TextFormField(
                      decoration: InputDecoration(
                        // hintText: "${_cUser.user.telephone}",
                        labelText: "Numéro de tél.",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(style: BorderStyle.solid)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      autofocus: true,
                      initialValue: phone.substring(4),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Valider'),
                        onPressed: () {
                          // Récupérez le numéro de téléphone et passez-le à la page PaiementPage
                          Navigator.of(context).pop();
                          final data = widget.data;
                          Get.to(() => PaiementPage(
                                data: data,
                                mode: mode,
                                montant: widget.montant,
                                frais: fraisPercentage,
                                frais_eliah: 'FRAIS ELIAH.CI',
                                eliah: total - widget.montant,
                                tel:
                                    phoneNumber, // Utilisez le numéro de téléphone entré
                                echeancier: widget.echeancier,
                              ));
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
              Future.delayed(const Duration(milliseconds: 1500), () {
                Navigator.of(context).pop();
                final data = widget.data;
                Get.to(() => PaiementPage(
                      data: data,
                      mode: mode,
                      montant: widget.montant,
                      frais: fraisPercentage,
                      frais_eliah: 'FRAIS ELIAH.CI',
                      eliah: total - widget.montant,
                      tel: _telephoneController.text.toString(),
                      echeancier: widget.echeancier,
                    ));
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: backgroundColor,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              trailing: isDisabled == true
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'Indisponible',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ))
                  : const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      color: Colors.grey,
                      size: 20,
                    ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$fraisPercentage% - ${myFormat.format(total)} FCFA',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              enabled: isDisabled != true, // Désactivez si le statut est false
            ),
          ),
        ),
      ),
    );
  }
}
