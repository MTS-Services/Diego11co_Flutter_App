import 'package:diego/app/modules/registration_details_view/views/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../registration_details_view/views/widget/profile_option.dart';
import '../controllers/set_password_view_controller.dart';

class SetPasswordViewView extends GetView<SetPasswordViewController> {
  SetPasswordViewView({super.key});

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileOption(
                    title: 'Imposta il tuo profilo',
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Imposta password",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),

                  /// PASSWORD FIELD
                  CustomTextField(
                    label: "Scegli una password",
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserisci una password';
                      }
                      if (value.length < 8) {
                        return 'La password deve contenere almeno 8 caratteri';
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Deve contenere almeno una lettera maiuscola (A-Z)';
                      }
                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Deve contenere almeno una lettera minuscola (a-z)';
                      }
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Deve contenere almeno un numero (0-9)';
                      }
                      if (!RegExp(r'[!@#\$%\^&\*\?_~\-]').hasMatch(value)) {
                        return 'Deve contenere almeno un carattere speciale (!, ?, \$, %, &)';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Lunghezza minima: 8 caratteri (consigliati 12 o più)",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Deve includere almeno:",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "• 1 lettera maiuscola (A–Z)",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "• 1 lettera minuscola (a–z)",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "• 1 numero (0–9)",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "• 1 carattere speciale (!, ?, \$, %, &)",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 35),

                  /// CONFIRM PASSWORD FIELD
                  CustomTextField(
                    label: "Conferma password",
                    hintText: "Conferma password",
                    controller: confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Conferma la password';
                      }
                      if (value != passwordController.text) {
                        return 'Le password non coincidono';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  const Divider(thickness: 1),
                  const SizedBox(height: 30),

                  /// BUTTON
                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Procedi',
                        style: TextStyle(fontSize: 16),
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
