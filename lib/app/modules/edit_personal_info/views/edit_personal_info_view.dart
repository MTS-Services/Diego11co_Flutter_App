import 'package:diego/app/core/constants/asset_path.dart';
import 'package:diego/app/modules/registration_details_view/views/widget/custom_text_field.dart';
import 'package:diego/app/modules/registration_details_view/views/widget/profile_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditPersonalInfoView
    extends GetView<EditPersonalInfoView> {
  const EditPersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final nomeController = TextEditingController();
    final cognomeController = TextEditingController();
    final dataNascitaController = TextEditingController();
    final luogoNascitaController = TextEditingController();
    final codiceFiscaleController = TextEditingController();
    final aziendaController = TextEditingController();
    final indirizzoController = TextEditingController();
    final partitaIvaController = TextEditingController();
    final codiceSdiController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    AssetPath.appLogoPng,
                  ),
                  SizedBox(height: 15,),
                  ProfileOption(
                    title: 'Imposta il tuo profilo',
                    onTap: () {
                      Get.back();
                    },
                  ),
                 SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Informazioni personali",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
          
                  // CustomTextFields
                  CustomTextField(
                    label: 'Nome',
                    hintText: 'Inserisci il nome',
                    controller: nomeController,
                  ),
                  SizedBox(height: 20.h),
          
                  CustomTextField(
                    label: 'Cognome',
                    hintText: 'Inserisci il cognome',
                    controller: cognomeController,
                  ),
                  SizedBox(height: 20.h),
          
                  CustomTextField(
                    label: 'Data di nascita',
                    hintText: 'GG/MM/AAAA',
                    controller: dataNascitaController,
                  ),
                  SizedBox(height: 20.h),
          
                  CustomTextField(
                    label: 'Luogo di nascita',
                    hintText:
                    'Inserisci il tuo luogo di nascita (paese se estero)',
                    controller: luogoNascitaController,
                  ),
                  SizedBox(height: 20.h),
          
                  CustomTextField(
                    label: 'Codice Fiscale',
                    hintText: '4854551212',
                    controller: codiceFiscaleController,
                  ),
                  SizedBox(height: 20.h),
          
                  CustomTextField(
                    label: 'Azienda (denominazione completa)',
                    hintText: "Inserisci il nome dell'azienda",
                    controller: aziendaController,
                  ),
                  SizedBox(height: 20.h),
          
                  CustomTextField(
                    label: 'Indirizzo sede legale',
                    hintText: "Enter Sede legale",
                    controller: indirizzoController,
                  ),
                  SizedBox(height: 20.h),
          
                  CustomTextField(
                    label: 'Partita IVA',
                    hintText: 'Inserisci partita IVA',
                    controller: partitaIvaController,
                  ),
                  SizedBox(height: 20.h),
          
                  CustomTextField(
                    label: 'Codice SDI',
                    hintText: 'È facoltativo',
                    controller: codiceSdiController,
                  ),
          
                  SizedBox(height: 20.h),
                  Divider(thickness: 1.h),
                  SizedBox(height: 20.h),
          
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offNamed("/set-password-view");
                      },
                      child: Text(
                        "Procedi",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
