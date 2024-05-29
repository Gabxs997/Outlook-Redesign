import 'package:flutter/material.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/models/Email.dart';
import 'package:outlook/responsive.dart';
import 'package:outlook/screens/email/email_screen.dart';
import 'components/list_of_emails.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    List<Email> emails =
        getEmails(); // Obtener la lista de correos electrónicos de alguna manera

    return Scaffold(
      body: Responsive(
        key: UniqueKey(),
        mobile: ListOfEmails(),
        tablet: Row(
          children: [
            Expanded(
              flex: 2,
              child: SideMenu(),
            ),
            Expanded(
              flex: 6, // Ajustar el tamaño de flex para tablet
              child: ListOfEmails(key: UniqueKey()),
            ),
          ],
        ),
        desktop: Row(
          children: [
            if (_size.width >
                1200) // Ajustar el tamaño de pantalla para mostrar el SideMenu
              Expanded(
                flex: 2,
                child: SideMenu(),
              ),
            Expanded(
              flex: _size.width > 1200 ? 3 : 5,
              child: ListOfEmails(key: UniqueKey()),
            ),
            Expanded(
              flex: _size.width > 1200
                  ? 5
                  : 6, // Ajustar el tamaño de flex para desktop
              child: EmailScreen(
                email: emails.isNotEmpty
                    ? emails[0]
                    : Email(
                        time: '9:00 AM',
                        isChecked: false,
                        image: 'assets/images/user_5.png',
                        name: 'Elenor Bauch',
                        subject: 'Test Subject',
                        body: 'This is a test email body.',
                        isAttachmentAvailable: false,
                        tagColor: Colors.grey,
                      ), // Acceder al primer correo electrónico si la lista no está vacía
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Email> getEmails() {
    // Implementa la lógica para obtener la lista de correos electrónicos aquí
    return []; // Devuelve una lista vacía por defecto
  }
}
