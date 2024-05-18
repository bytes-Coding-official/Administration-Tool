import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? deText = '',
  }) =>
      [enText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ProfileSettings
  {
    'fcx17xnl': {
      'en': 'Complete Profile',
      'de': 'Vollständiges Profil',
    },
    '50p3dqj6': {
      'en': 'Complete your Profile-Settings',
      'de': 'Vervollständige deine Profileinstellungen',
    },
    'dkq1ryfg': {
      'en': 'Your information',
      'de': 'Ihre Informationen',
    },
    'xt634rup': {
      'en': 'Your Name',
      'de': 'Ihr Name',
    },
    'zx5xaek7': {
      'en': 'Email',
      'de': 'Email',
    },
    'svckxjk7': {
      'en': 'Email',
      'de': 'Email',
    },
    'ka02yxp3': {
      'en': 'Phone',
      'de': 'Telefon',
    },
    '58pt8dru': {
      'en': 'Phone',
      'de': 'Telefon',
    },
    'oaa48gll': {
      'en': 'Change Adress',
      'de': 'Adresse ändern',
    },
    'w9gnwzri': {
      'en': 'Change IT-Skills',
      'de': 'IT-Kenntnisse ändern',
    },
    'ohebf1ur': {
      'en': 'Change Languages',
      'de': 'Sprachen ändern',
    },
    'e9h4u4e3': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
    },
    'yfmi94wv': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Adress-Settings
  {
    'xvk3q9k4': {
      'en': 'Complete Adress',
      'de': 'Vollständige Adresse',
    },
    'ivwsse2p': {
      'en': 'Complete your adress information',
      'de': 'Vervollständigen Sie Ihre Adressdaten',
    },
    'pqv49jgr': {
      'en': 'Your information',
      'de': 'Ihre Informationen',
    },
    '0e9c64ob': {
      'en': 'Street and Number',
      'de': 'Straße und Nummer',
    },
    '4kvp5cnu': {
      'en': 'Street',
      'de': 'Straße',
    },
    'vv98yz02': {
      'en': 'Town',
      'de': 'Stadt',
    },
    'tl7vy8f9': {
      'en': 'Town',
      'de': 'Stadt',
    },
    'sqb1k3ec': {
      'en': 'Zip',
      'de': 'Reißverschluss',
    },
    'yxwo7j7o': {
      'en': 'Zip',
      'de': 'Reißverschluss',
    },
    's6h1wnxo': {
      'en': 'Country',
      'de': 'Land',
    },
    '0g14koc1': {
      'en': 'Country',
      'de': 'Land',
    },
    'mpk8lics': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
    },
    'dr5994wq': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // IT-Skills-Settings
  {
    'th69fh0p': {
      'en': 'Complete IT-Skills',
      'de': 'Umfassende IT-Kenntnisse',
    },
    'zwdp76ds': {
      'en': 'Complete your IT-Skills',
      'de': 'Vervollständigen Sie Ihre IT-Kenntnisse',
    },
    'shhe1ydw': {
      'en': 'Your IT-Skills',
      'de': 'Deine IT-Kenntnisse',
    },
    '5ej9zapx': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Language-Settings
  {
    '4bq07mgn': {
      'en': 'Complete Languages',
      'de': 'Komplette Sprachen',
    },
    'whlv0la7': {
      'en': 'Complete your languages',
      'de': 'Vervollständigen Sie Ihre Sprachen',
    },
    'z797zvs5': {
      'en': 'Your Languages',
      'de': 'Ihre Sprachen',
    },
    'pi0dfjv1': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Customer
  {
    'en3up8db': {
      'en': 'ID:',
      'de': 'AUSWEIS:',
    },
    'fwglq52i': {
      'en': 'Name',
      'de': 'Name',
    },
    '6fgimpch': {
      'en': 'Mail',
      'de': 'Mail',
    },
    'igthvfrg': {
      'en': 'Adress',
      'de': 'Ein Kleid',
    },
    'pfk6zl6k': {
      'en': 'Themes',
      'de': 'Themen',
    },
    'w9rexsje': {
      'en': 'Languages',
      'de': 'Sprachen',
    },
    '91qmu550': {
      'en': 'Revenue',
      'de': 'Einnahmen',
    },
    'xf3hox2c': {
      'en': 'Status',
      'de': 'Status',
    },
    'mzuncnhu': {
      'en': 'Add meeting to user',
      'de': 'Meeting dem Benutzer hinzufügen',
    },
    '955no1if': {
      'en': 'Duration',
      'de': 'Dauer',
    },
    'g13pqfbb': {
      'en': 'Betreuer',
      'de': 'Betreuer',
    },
    '365ngbkk': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Customers
  {
    '3xmp7l5l': {
      'en': 'bytes Coding',
      'de': 'Bytes Kodierung',
    },
    'ugt68zzx': {
      'en': 'Platform Navigation',
      'de': 'Platform Navigation',
    },
    '15s2dq8x': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
    },
    '6g8wo7v3': {
      'en': '12',
      'de': '12',
    },
    'lusq685u': {
      'en': 'Chats',
      'de': 'Chats',
    },
    '5zyogc9t': {
      'en': '12',
      'de': '12',
    },
    'uc1usyqa': {
      'en': 'Support Tickets',
      'de': 'Support-Tickets',
    },
    'uuz9xwx4': {
      'en': '12',
      'de': '12',
    },
    'mzevq165': {
      'en': 'Calendar',
      'de': 'Kalender',
    },
    '12tpf17h': {
      'en': 'Settings',
      'de': 'Einstellungen',
    },
    'xahmx4lz': {
      'en': 'Billing',
      'de': 'Abrechnung',
    },
    'azmu0lbt': {
      'en': 'Members',
      'de': 'Mitglieder',
    },
    'nllrgk2r': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
    },
    'jncjn9nc': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
    },
    'tmoj32d1': {
      'en': 'Projects Overview',
      'de': 'Projekte Übersicht',
    },
    'ohbxki3q': {
      'en': 'Review the details below of all current projects.',
      'de': 'Sehen Sie sich unten die Details aller aktuellen Projekte an.',
    },
    'p942dt14': {
      'en': 'All',
      'de': 'Alle',
    },
    'ntn7402o': {
      'en': 'Own Projects',
      'de': 'Eigene Projekte',
    },
    'o6dzwlaw': {
      'en': 'Others',
      'de': 'Andere',
    },
    '4zt58o1s': {
      'en': 'Closed',
      'de': 'Geschlossen',
    },
    'mzguga2z': {
      'en': 'All',
      'de': 'Alle',
    },
    'xzbp5c59': {
      'en': 'Filters',
      'de': 'Filter',
    },
    'ahzd947o': {
      'en': 'Filter here...',
      'de': 'Hier filtern...',
    },
    '73gv4wgu': {
      'en': 'Filter',
      'de': 'Filter',
    },
    'efbd6j4b': {
      'en': 'Filter here...',
      'de': 'Hier filtern...',
    },
    'hv1ie1b8': {
      'en': 'Add Customer',
      'de': 'Kunden hinzufügen',
    },
    'l9lhumzm': {
      'en': 'Add Case',
      'de': 'Fall hinzufügen',
    },
    'n9qnpbyi': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
    },
    'nhxrq5ni': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
    },
    'u27w6351': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Employees
  {
    'lefjjtu5': {
      'en': 'Search for patients...',
      'de': 'Patientensuche...',
    },
    'j34sl75v': {
      'en': 'Team-Members',
      'de': 'Team-Mitglieder',
    },
    '73o0o7i4': {
      'en': 'All of our Customers & Employees',
      'de': 'Alle unsere Kunden und Mitarbeiter',
    },
    'l72xtc1b': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // CreateCase
  {
    'y00zbz7g': {
      'en': 'Title...',
      'de': 'Titel...',
    },
    'eaxq1etl': {
      'en': 'Title...',
      'de': 'Titel...',
    },
    'zrh50pvf': {
      'en': 'Description...',
      'de': 'Beschreibung...',
    },
    'zboepkw1': {
      'en': 'Themes',
      'de': 'Themen',
    },
    'nh1r0238': {
      'en': 'Option 1',
      'de': 'Option 1',
    },
    'u3h0qui2': {
      'en': 'Topics',
      'de': 'Themen',
    },
    'h13kg7qr': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
    },
    'sx3ty69v': {
      'en': 'Customer',
      'de': 'Kunde',
    },
    'osvnesbh': {
      'en': 'Option 1',
      'de': 'Option 1',
    },
    'psh6ke1p': {
      'en': 'Customer Name',
      'de': 'Kundenname',
    },
    'jfcys0av': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
    },
    '1m1enuc4': {
      'en': 'Revenue',
      'de': 'Einnahmen',
    },
    'imvqflfb': {
      'en': 'Price per hour',
      'de': 'Preis pro Stunde',
    },
    'zy0j4m21': {
      'en': '50',
      'de': '50',
    },
    'p25f6cpa': {
      'en': 'Add Case',
      'de': 'Fall hinzufügen',
    },
    '0rdy80es': {
      'en': 'Create Case',
      'de': 'Fall erstellen',
    },
    'brd4f1fu': {
      'en': 'Create a new case with this form',
      'de': 'Erstellen Sie mit diesem Formular einen neuen Fall',
    },
    'vvddebob': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // auth_2_Create
  {
    '7g15vrub': {
      'en': 'bytes Coding',
      'de': 'Bytes Kodierung',
    },
    'yuf6qyzb': {
      'en': 'Get Started',
      'de': 'Loslegen',
    },
    'n8xp8945': {
      'en': 'Create an account by using the form below.',
      'de': 'Erstellen Sie mithilfe des untenstehenden Formulars ein Konto.',
    },
    'hxdqv67a': {
      'en': 'Email',
      'de': 'Email',
    },
    'k3t8iv0d': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'am9thlup': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
    },
    'cp9wwxhh': {
      'en': 'Or sign up with',
      'de': 'Oder registrieren Sie sich mit',
    },
    'zohwxmwa': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
    },
    'l8nmxfqe': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
    },
    '4o69hz8n': {
      'en': 'Already have an account? ',
      'de': 'Sie haben bereits ein Konto?',
    },
    'p5d43lji': {
      'en': 'Sign in here',
      'de': 'Hier anmelden',
    },
    '9fj3ed5h': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // auth_2_Login
  {
    'b1a1m656': {
      'en': 'bytes Coding',
      'de': 'Bytes Kodierung',
    },
    'wc6vlb88': {
      'en': 'Welcome Back',
      'de': 'Willkommen zurück',
    },
    '8yhirh5p': {
      'en': 'Fill out the information below in order to access your account.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um auf Ihr Konto zuzugreifen.',
    },
    '8ucnopf5': {
      'en': 'Email',
      'de': 'Email',
    },
    'petfhqha': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'p3xaauvg': {
      'en': 'Sign In',
      'de': 'Anmelden',
    },
    '08btyait': {
      'en': 'Or sign in with',
      'de': 'Oder melden Sie sich an mit',
    },
    'pmg4jacf': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
    },
    'lhcickgn': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
    },
    '8pwvx02e': {
      'en': 'Don\'t have an account?  ',
      'de': 'Sie haben noch kein Konto?',
    },
    'mk06lsbv': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
    },
    'ak2gtbko': {
      'en': 'Forgot password?',
      'de': 'Passwort vergessen?',
    },
    'vf342axe': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // auth_2_ForgotPassword
  {
    '2gddz9zm': {
      'en': 'bytes Coding',
      'de': 'Bytes Kodierung',
    },
    'ngxwdtah': {
      'en': 'Forgot Password',
      'de': 'Passwort vergessen',
    },
    'rcdhs0gf': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'de':
          'Bitte geben Sie unten Ihre E-Mail-Adresse ein, um einen Link zum Zurücksetzen des Passworts zu erhalten.',
    },
    'mzhbas81': {
      'en': 'Email',
      'de': 'Email',
    },
    'cw6tl9xj': {
      'en': 'Send Reset Link',
      'de': 'Link zum Zurücksetzen senden',
    },
    'wlesa9ou': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // auth_2_createProfile
  {
    'erspxmah': {
      'en': 'bytes Coding',
      'de': 'Bytes Kodierung',
    },
    'x7tuflp8': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // auth_2_Profile
  {
    '3gvgvwg1': {
      'en': 'Your Account',
      'de': 'Ihr Konto',
    },
    'od94gyfg': {
      'en': 'Edit Profile',
      'de': 'Profil bearbeiten',
    },
    '3bqy4rph': {
      'en': 'Edit Adress',
      'de': 'Adresse bearbeiten',
    },
    'v8wpgdwz': {
      'en': 'Edit Languages',
      'de': 'Sprachen bearbeiten',
    },
    'k9gh52ok': {
      'en': 'Edit IT-Skills',
      'de': 'IT-Kenntnisse bearbeiten',
    },
    'yf1kh2jt': {
      'en': 'App Settings',
      'de': 'App Einstellungen',
    },
    'z84qmaed': {
      'en': 'Support',
      'de': 'Unterstützung',
    },
    'dodyl2fx': {
      'en': 'Terms of Service',
      'de': 'Nutzungsbedingungen',
    },
    'zhg4cl4u': {
      'en': 'Log Out',
      'de': 'Ausloggen',
    },
    'bommisgd': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // auth_2_EditProfile
  {
    'xs06iv32': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // support_TicketList
  {
    '8tf2yxr2': {
      'en': 'Ticket #: ',
      'de': 'Fahrkarte #:',
    },
    'b5m54jpy': {
      'en': 'Support Tickets',
      'de': 'Support-Tickets',
    },
    'y1cphusm': {
      'en': 'Below are a list of recent tickets created',
      'de': 'Unten finden Sie eine Liste der zuletzt erstellten Tickets',
    },
    '8bi66y39': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // support_SubmitTicket
  {
    'aekkeure': {
      'en': 'Ticket-Creation',
      'de': 'Ticket-Erstellung',
    },
    'th2f4v4n': {
      'en': 'Create a Support-Ticket here',
      'de': 'Hier Support-Ticket erstellen',
    },
    'vj2kin4a': {
      'en': 'Fill out the form below to submit a ticket.',
      'de':
          'Füllen Sie das untenstehende Formular aus, um ein Ticket einzureichen.',
    },
    '8a83o12g': {
      'en': 'Call Us',
      'de': 'Rufen Sie uns an',
    },
    'txl8rzat': {
      'en': 'Email Us',
      'de': 'Schreiben Sie uns eine E-Mail',
    },
    'ricp38cm': {
      'en': 'What is going on?',
      'de': 'Was ist los?',
    },
    '0l26gje2': {
      'en': 'Short Description of what is going on...',
      'de': 'Kurze Beschreibung dessen, was los ist ...',
    },
    'eyq6jort': {
      'en': 'Choose a priority level',
      'de': 'Wählen Sie eine Prioritätsstufe',
    },
    'nj4gxq7y': {
      'en': 'Emergency',
      'de': 'Notfall',
    },
    'nxn0qt7g': {
      'en': 'High',
      'de': 'Hoch',
    },
    '36ar5gt0': {
      'en': 'Medium',
      'de': 'Mittel',
    },
    'xbub19mw': {
      'en': 'Low',
      'de': 'Niedrig',
    },
    'udk6s772': {
      'en': 'Low',
      'de': 'Niedrig',
    },
    'ngxigtui': {
      'en': 'Upload Screenshot',
      'de': 'Screenshot hochladen',
    },
    '9furp0rw': {
      'en': 'Assign User',
      'de': 'Benutzer zuweisen',
    },
    'zdl3izxa': {
      'en': 'Add User',
      'de': 'Benutzer hinzufügen',
    },
    '0sjmvj9o': {
      'en': 'Submit Ticket',
      'de': 'Ticket übermitteln',
    },
    'h5odabcw': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // support_TicketDetails
  {
    'mscspqqu': {
      'en': 'Ticket Details',
      'de': 'Ticketdetails',
    },
    'ss89pb28': {
      'en': 'Ticket #: ',
      'de': 'Fahrkarte #:',
    },
    'istektt5': {
      'en': 'Below are the details of this support ticket.',
      'de': 'Nachfolgend finden Sie die Einzelheiten zu diesem Support-Ticket.',
    },
    'zuqhc7rn': {
      'en': 'Description',
      'de': 'Beschreibung',
    },
    '2a7z81xx': {
      'en': 'Submitted on',
      'de': 'Eingereicht am',
    },
    '3b2i6hgq': {
      'en': 'Last Edited',
      'de': 'Zuletzt bearbeitet',
    },
    'h1lawcol': {
      'en': 'Status',
      'de': 'Status',
    },
    '915sp9a8': {
      'en': 'Pending',
      'de': 'Ausstehend',
    },
    'zv37t5tt': {
      'en': 'In Progress',
      'de': 'Im Gange',
    },
    'fbik18u7': {
      'en': 'Complete',
      'de': 'Vollständig',
    },
    'l9ecv4xv': {
      'en': 'Submitted',
      'de': 'Gesendet',
    },
    '5g50y16u': {
      'en': 'Please select...',
      'de': 'Bitte auswählen...',
    },
    '74vmywjv': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
    },
    'yy7xpy7w': {
      'en': 'Assigned to',
      'de': 'Zugewiesen an',
    },
    'jvimk02l': {
      'en': 'Submitted By',
      'de': 'Eingereicht von',
    },
    'sacl5x8e': {
      'en': 'Assign',
      'de': 'Zuordnen',
    },
    'x5s786v4': {
      'en': 'Update Ticket',
      'de': 'Ticket aktualisieren',
    },
    'yqpe5xlu': {
      'en': 'Ticket',
      'de': 'Fahrkarte',
    },
    'x6ddm1u4': {
      'en': 'Current Support-Ticket',
      'de': 'Aktuelles Support-Ticket',
    },
  },
  // Billing
  {
    '8zdbsdy4': {
      'en': 'Customer-Information',
      'de': 'Kundeninformation',
    },
    '2mghmw6b': {
      'en': 'Below is a summary of your activity.',
      'de': 'Nachfolgend finden Sie eine Zusammenfassung Ihrer Aktivität.',
    },
    'joipmprf': {
      'en': 'Money Earned',
      'de': 'Verdientes Geld',
    },
    'bvrj937a': {
      'en': 'Average Billing',
      'de': 'Durchschnittliche Abrechnung',
    },
    'ucngtba5': {
      'en': 'Total Customers',
      'de': 'Kunden gesamt',
    },
    'dbqutbci': {
      'en': 'Customer-Information',
      'de': 'Kundeninformation',
    },
    'llfx7g5q': {
      'en': 'An overview of your customer jobs.',
      'de': 'Eine Übersicht Ihrer Kundenaufträge.',
    },
    'fxfdsogo': {
      'en': 'current customers',
      'de': 'derzeitige Kunden',
    },
    '6l634rov': {
      'en': 'completed customers',
      'de': 'abgeschlossene Kunden',
    },
    '82u69mor': {
      'en': 'Customer-Cases',
      'de': 'Kunden-Cases',
    },
    'fnw01e3l': {
      'en': 'A summary of your current customer-cases',
      'de': 'Eine Zusammenfassung Ihrer aktuellen Kundenfälle',
    },
    'msp77w1m': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
    },
    'w0tdj7p3': {
      'en': 'Recent Activity',
      'de': 'Letzte Aktivität',
    },
    '17ihzxhi': {
      'en': 'Below is an overview of tasks & activity completed.',
      'de':
          'Nachfolgend finden Sie eine Übersicht über die abgeschlossenen Aufgaben und Aktivitäten.',
    },
    'fcxcsakp': {
      'en': 'Tasks',
      'de': 'Aufgaben',
    },
    '0nc0tkvo': {
      'en': 'Completed',
      'de': 'Vollendet',
    },
    '2dixago6': {
      'en': 'active',
      'de': 'aktiv',
    },
    'p31pafw5': {
      'en': 'Last 30 Days',
      'de': 'Letzte 30 Tage',
    },
    't6p8ypnx': {
      'en': 'average',
      'de': 'Durchschnitt',
    },
    'sauzmy7r': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // Calendar
  {
    '6zjihlff': {
      'en': 'Month',
      'de': 'Monat',
    },
    '3jt8agg3': {
      'en': 'Coming Up',
      'de': 'Demnächst',
    },
    'rpyeywpy': {
      'en': 'Doctors Check In',
      'de': 'Ärzte checken ein',
    },
    'gef1c0qv': {
      'en': '2:20pm',
      'de': '14:20 Uhr',
    },
    'zb3rbquu': {
      'en': 'Wed, 03/08/2022',
      'de': 'Mi., 08.03.2022',
    },
    '1slthe9b': {
      'en': 'Past Due',
      'de': 'Überfällig',
    },
    'z2wyjgaj': {
      'en': 'Check In',
      'de': 'Einchecken',
    },
    'kedy7xvu': {
      'en': '2:20pm',
      'de': '14:20 Uhr',
    },
    'mkjfy7eg': {
      'en': 'Wed, 03/08/2022',
      'de': 'Mi., 08.03.2022',
    },
    'k3g0z96l': {
      'en': 'Week',
      'de': 'Woche',
    },
    'djbai917': {
      'en': 'Coming Up',
      'de': 'Demnächst',
    },
    'u0ze832q': {
      'en': 'Doctors Check In',
      'de': 'Ärzte checken ein',
    },
    'kgan1xq6': {
      'en': '2:20pm',
      'de': '14:20 Uhr',
    },
    'kmrpccrv': {
      'en': 'Wed, 03/08/2022',
      'de': 'Mi., 08.03.2022',
    },
    't0pw8ab7': {
      'en': 'Past Due',
      'de': 'Überfällig',
    },
    'wjge1m95': {
      'en': 'Check In',
      'de': 'Einchecken',
    },
    'of37b0s3': {
      'en': '2:20pm',
      'de': '14:20 Uhr',
    },
    'k2fe4c49': {
      'en': 'Wed, 03/08/2022',
      'de': 'Mi., 08.03.2022',
    },
    '64srsupd': {
      'en': 'Calender',
      'de': 'Kalander',
    },
    'a04niafv': {
      'en': 'Your current Calender',
      'de': 'Ihr aktueller Kalender',
    },
    'x5uzyw3v': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // chat_2_Details
  {
    'fmeem6gz': {
      'en': 'Group Chat',
      'de': 'Gruppenchat',
    },
    'z9dcgfkq': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // chat_2_main
  {
    '3nlz1j90': {
      'en': 'Add Chat',
      'de': 'Chat hinzufügen',
    },
    'j81ilpuq': {
      'en': 'Group Chat',
      'de': 'Gruppenchat',
    },
    'rebbm36n': {
      'en': 'My Chats',
      'de': 'Meine Chats',
    },
    'u78r69oe': {
      'en': 'Below are your chats and group chats',
      'de': 'Unten sind Ihre Chats und Gruppenchats',
    },
    'wfh3loj4': {
      'en': '__',
      'de': '__',
    },
  },
  // chat_2_InviteUsers
  {
    'hopvi9vs': {
      'en': 'Invite Friends',
      'de': 'Freunde einladen',
    },
    'ql4fu98g': {
      'en': 'Selected',
      'de': 'Ausgewählt',
    },
    'va53uv9s': {
      'en': 'Invite Friends',
      'de': 'Freunde einladen',
    },
    '23ic11yf': {
      'en': 'Select users from below to start a chat.',
      'de': 'Wählen Sie unten Benutzer aus, um einen Chat zu starten.',
    },
    'jy4o2t2o': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // image_Details
  {
    'itj2r1tk': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // createCustomer
  {
    'ebpqrveb': {
      'en': 'Full name',
      'de': 'Vollständiger Name',
    },
    'wl53zgkt': {
      'en': 'Name',
      'de': 'Name',
    },
    '1qwq52s2': {
      'en': 'Phone number',
      'de': 'Telefonnummer',
    },
    'k42rx09i': {
      'en': 'Phone Number',
      'de': 'Telefonnummer',
    },
    'vdzc35iz': {
      'en': 'E-Mail',
      'de': 'Email',
    },
    'cu1rz8hq': {
      'en': 'E-Mail',
      'de': 'Email',
    },
    'w83v5p9g': {
      'en': 'Street',
      'de': 'Straße',
    },
    'dz8s1veo': {
      'en': 'Street',
      'de': 'Straße',
    },
    '8m7j9wso': {
      'en': 'City',
      'de': 'Stadt',
    },
    'vl5t2xru': {
      'en': 'City',
      'de': 'Stadt',
    },
    'vkwdzh8z': {
      'en': 'Zip',
      'de': 'Reißverschluss',
    },
    'as64pn2v': {
      'en': 'Zip',
      'de': 'Reißverschluss',
    },
    'hgyxigwg': {
      'en': 'Country',
      'de': 'Land',
    },
    'naeu1u2u': {
      'en': 'Country',
      'de': 'Land',
    },
    'qzvdq8bg': {
      'en': 'Languages',
      'de': 'Sprachen',
    },
    'xf9ydg3j': {
      'en': 'Option 1',
      'de': 'Option 1',
    },
    '7kfa0wi0': {
      'en': 'Customer Languages',
      'de': 'Kundensprachen',
    },
    'zwexgz3e': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
    },
    'hb047u9p': {
      'en': 'Add Customer',
      'de': 'Kunden hinzufügen',
    },
    'a90yebyy': {
      'en': 'Please enter the patients full name.',
      'de': 'Bitte geben Sie den vollständigen Namen des Patienten ein.',
    },
    'axxavshr': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'vwdmt5ow': {
      'en': 'Please enter an age for the patient.',
      'de': 'Bitte geben Sie das Alter des Patienten ein.',
    },
    'rytsrrvh': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'bez1h19z': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'ul8umbka': {
      'en': 'Please enter the date of birth of the patient.',
      'de': 'Bitte geben Sie das Geburtsdatum des Patienten ein.',
    },
    '29498g7f': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'tndhfkcj': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'vf77bs9f': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'x0gktab6': {
      'en': 'Patient Intake form',
      'de': 'Patientenaufnahmeformular',
    },
    '2ilwg7d0': {
      'en': 'Please fill out the form to continue.',
      'de': 'Bitte füllen Sie das Formular aus, um fortzufahren.',
    },
    'jx8qgyjd': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // AddMeetingToCustomer
  {
    'fq1mmuz6': {
      'en': 'ID:',
      'de': 'AUSWEIS:',
    },
    'et2esaos': {
      'en': 'Option 1',
      'de': 'Option 1',
    },
    'i5paqfsq': {
      'en': 'Tutor',
      'de': 'Tutor',
    },
    'ccl67tsf': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
    },
    '22nnbou1': {
      'en': 'duration',
      'de': 'Dauer',
    },
    'dm5dydjl': {
      'en': '0.0',
      'de': '0,0',
    },
    '0hi0scef': {
      'en': 'Save',
      'de': 'Speichern',
    },
    'd4r08dbo': {
      'en': 'Please enter the patients full name.',
      'de': 'Bitte geben Sie den vollständigen Namen des Patienten ein.',
    },
    'scajuol5': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'nk8m3ef2': {
      'en': 'Please enter an age for the patient.',
      'de': 'Bitte geben Sie das Alter des Patienten ein.',
    },
    'yv7pqmtb': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    '548halmr': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'krymuidf': {
      'en': 'Please enter the date of birth of the patient.',
      'de': 'Bitte geben Sie das Geburtsdatum des Patienten ein.',
    },
    'n82mxek3': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'iw5emeyr': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'eesji8y9': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    '142c9phq': {
      'en': 'Add Meeting',
      'de': 'Meeting hinzufügen',
    },
    '6ak09n8d': {
      'en': 'Add a meeting to a special customer',
      'de': 'Einem besonderen Kunden ein Meeting hinzufügen',
    },
    'h77ncpzt': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // sideNav
  {
    'an40yt0k': {
      'en': 'Navigation',
      'de': 'Navigation',
    },
    'r60f84h5': {
      'en': 'For navigating between screens',
      'de': 'Zur Navigation zwischen Bildschirmen',
    },
    's5ry5cyk': {
      'en': 'bytes Coding',
      'de': 'Bytes Kodierung',
    },
    'naqnbvxd': {
      'en': 'Platform Navigation',
      'de': 'Platform Navigation',
    },
    'ryazebh4': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
    },
    'pb71eaaj': {
      'en': '12',
      'de': '12',
    },
    '9q77itrm': {
      'en': 'Chats',
      'de': 'Chats',
    },
    'zv4sd9zz': {
      'en': '12',
      'de': '12',
    },
    '2xnm6fps': {
      'en': 'Support Tickets',
      'de': 'Support-Tickets',
    },
    'feent0lc': {
      'en': '12',
      'de': '12',
    },
    '9js2z9y7': {
      'en': 'Calendar',
      'de': 'Kalender',
    },
    '8tlki912': {
      'en': 'Settings',
      'de': 'Einstellungen',
    },
    '5zra02cb': {
      'en': 'Billing',
      'de': 'Abrechnung',
    },
    'm9ww17s0': {
      'en': 'Members',
      'de': 'Mitglieder',
    },
    '411g996a': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
    },
    'mc7klcgc': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
    },
    '0qj8uewa': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // editProfile_auth_2
  {
    'i42hhvws': {
      'en': 'Adjust the content below to update your profile.',
      'de': 'Passen Sie den Inhalt unten an, um Ihr Profil zu aktualisieren.',
    },
    'cb6me508': {
      'en': 'Change Photo',
      'de': 'Foto ändern',
    },
    'kzae2g7n': {
      'en': 'Full Name',
      'de': 'Vollständiger Name',
    },
    '7vgor3b8': {
      'en': 'Your full name...',
      'de': 'Ihr vollständiger Name...',
    },
    '8w40lg9d': {
      'en': 'Manager',
      'de': 'Manager',
    },
    'yensxgmy': {
      'en': 'Betreuer',
      'de': 'Betreuer',
    },
    'o6w537y6': {
      'en': 'Kunde',
      'de': 'Kunde',
    },
    'wk1gzwl6': {
      'en': 'Your Role',
      'de': 'Deine Rolle',
    },
    'r14ffmw1': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
    },
    'mv1hv80o': {
      'en': 'Short Description',
      'de': 'kurze Beschreibung',
    },
    'bc8lb6wd': {
      'en': 'A little about you...',
      'de': 'Ein bisschen über Sie …',
    },
  },
  // setPriority_Menu
  {
    '4g1xmiy1': {
      'en': 'Set Priority Level',
      'de': 'Prioritätsstufe festlegen',
    },
    'ceeouso2': {
      'en': 'Emergency',
      'de': 'Notfall',
    },
    'jnz7a7nx': {
      'en': 'High',
      'de': 'Hoch',
    },
    'oorxhq9x': {
      'en': 'Medium',
      'de': 'Mittel',
    },
    'na0320sa': {
      'en': 'Low',
      'de': 'Niedrig',
    },
  },
  // user_ListSmall
  {
    '2lghugn7': {
      'en': 'ME',
      'de': 'MICH',
    },
  },
  // user_List
  {
    'c7r5aq7h': {
      'en': 'Assign User',
      'de': 'Benutzer zuweisen',
    },
    '1fert8cu': {
      'en': 'Select a user from the list below to continue.',
      'de':
          'Wählen Sie einen Benutzer aus der Liste unten aus, um fortzufahren.',
    },
    't9l5esbd': {
      'en': 'Close',
      'de': 'Schließen',
    },
  },
  // chat_DetailsOverlay
  {
    'a0loq5a6': {
      'en': 'Group Chat ID: ',
      'de': 'Gruppenchat-ID:',
    },
    'hspne3ym': {
      'en': 'In this chat',
      'de': 'In diesem Chat',
    },
    '50akzqka': {
      'en': 'Close',
      'de': 'Schließen',
    },
  },
  // chat_ThreadComponent
  {
    'gj24j4e2': {
      'en': 'Start typing here...',
      'de': 'Beginnen Sie hier mit der Eingabe ...',
    },
    'ur37thf2': {
      'en': 'You must enter a message...',
      'de': 'Sie müssen eine Nachricht eingeben...',
    },
    '907lm1aq': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
  },
  // user_ListSmall_1
  {
    'fh4ei39y': {
      'en': 'ME',
      'de': 'MICH',
    },
  },
  // deleteDialog
  {
    '3q0utb1e': {
      'en': 'Options',
      'de': 'Optionen',
    },
    '73scs9a0': {
      'en': 'Invite Users',
      'de': 'Benutzer einladen',
    },
    'av9xz4qx': {
      'en': 'Delete Chat',
      'de': 'Chat löschen',
    },
    '41tv38n3': {
      'en': 'Confirm Delete',
      'de': 'Löschen bestätigen',
    },
    's2cbswob': {
      'en': 'You can\'t undo this action.',
      'de': 'Sie können diese Aktion nicht rückgängig machen.',
    },
    'z54qbopv': {
      'en': 'Delete',
      'de': 'Löschen',
    },
  },
  // Miscellaneous
  {
    'b7nmo9h5': {
      'en': '',
      'de': '',
    },
    'xmayfjdy': {
      'en': '',
      'de': '',
    },
    'rreotz6t': {
      'en': '',
      'de': '',
    },
    '4hucjyt3': {
      'en': '',
      'de': '',
    },
    'pe8bwhny': {
      'en': '',
      'de': '',
    },
    'ayl7ml95': {
      'en': '',
      'de': '',
    },
    'cj4pi052': {
      'en': '',
      'de': '',
    },
    'p3lm87a3': {
      'en': '',
      'de': '',
    },
    'hac7gowh': {
      'en': '',
      'de': '',
    },
    'hq7117qt': {
      'en': '',
      'de': '',
    },
    'iej24wiy': {
      'en': '',
      'de': '',
    },
    '4dk1neen': {
      'en': '',
      'de': '',
    },
    'oymp1cmr': {
      'en': '',
      'de': '',
    },
    'tezxva0s': {
      'en': '',
      'de': '',
    },
    '3fjb95pu': {
      'en': '',
      'de': '',
    },
    'ybkbd0h9': {
      'en': '',
      'de': '',
    },
    'tsufngwo': {
      'en': '',
      'de': '',
    },
    '0uulr27y': {
      'en': '',
      'de': '',
    },
    'lieon019': {
      'en': '',
      'de': '',
    },
    'waotbjhx': {
      'en': '',
      'de': '',
    },
    'pbn6f25j': {
      'en': '',
      'de': '',
    },
    '804gd7i9': {
      'en': '',
      'de': '',
    },
    'j4z3yl1s': {
      'en': '',
      'de': '',
    },
    '525aerw5': {
      'en': '',
      'de': '',
    },
    'xm7jo5yr': {
      'en': '',
      'de': '',
    },
    'guzgv3lj': {
      'en': '',
      'de': '',
    },
    'vodnos5o': {
      'en': '',
      'de': '',
    },
    'fwchmphj': {
      'en': '',
      'de': '',
    },
  },
].reduce((a, b) => a..addAll(b));
