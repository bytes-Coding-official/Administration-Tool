import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de', 'es', 'fr'];

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
    String? esText = '',
    String? frText = '',
  }) =>
      [enText, deText, esText, frText][languageIndex] ?? '';

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
      'es': 'Perfil completo',
      'fr': 'Profil complet',
    },
    '50p3dqj6': {
      'en': 'Complete your Profile-Settings',
      'de': 'Vervollständige deine Profileinstellungen',
      'es': 'Complete la configuración de su perfil',
      'fr': 'Complétez vos paramètres de profil',
    },
    'dkq1ryfg': {
      'en': 'Your information',
      'de': 'Ihre Informationen',
      'es': 'Tu información',
      'fr': 'Vos informations',
    },
    'xt634rup': {
      'en': 'Your Name',
      'de': 'Ihr Name',
      'es': 'Su nombre',
      'fr': 'votre nom',
    },
    'zx5xaek7': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'svckxjk7': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'ka02yxp3': {
      'en': 'Phone',
      'de': 'Telefon',
      'es': 'Teléfono',
      'fr': 'Téléphone',
    },
    '58pt8dru': {
      'en': 'Phone',
      'de': 'Telefon',
      'es': 'Teléfono',
      'fr': 'Téléphone',
    },
    'oaa48gll': {
      'en': 'Change Adress',
      'de': 'Adresse ändern',
      'es': 'Cambiar dirección',
      'fr': 'Changer d\'adresse',
    },
    'w9gnwzri': {
      'en': 'Change IT-Skills',
      'de': 'IT-Kenntnisse ändern',
      'es': 'Cambiar las habilidades de TI',
      'fr': 'Changer les compétences informatiques',
    },
    'ohebf1ur': {
      'en': 'Change Languages',
      'de': 'Sprachen ändern',
      'es': 'Cambiar idiomas',
      'fr': 'Changer de langue',
    },
    'e9h4u4e3': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
    },
    'yfmi94wv': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // Adress-Settings
  {
    'xvk3q9k4': {
      'en': 'Complete Adress',
      'de': 'Vollständige Adresse',
      'es': 'Dirección completa',
      'fr': 'Adresse complète',
    },
    'ivwsse2p': {
      'en': 'Complete your adress information',
      'de': 'Vervollständigen Sie Ihre Adressdaten',
      'es': 'Completa los datos de tu dirección',
      'fr': 'Complétez vos informations d\'adresse',
    },
    'pqv49jgr': {
      'en': 'Your information',
      'de': 'Ihre Informationen',
      'es': 'Tu información',
      'fr': 'Vos informations',
    },
    '0e9c64ob': {
      'en': 'Street and Number',
      'de': 'Straße und Nummer',
      'es': 'Calle y número',
      'fr': 'Rue et numéro',
    },
    '4kvp5cnu': {
      'en': 'Street',
      'de': 'Straße',
      'es': 'Calle',
      'fr': 'Rue',
    },
    'vv98yz02': {
      'en': 'Town',
      'de': 'Stadt',
      'es': 'Ciudad',
      'fr': 'Ville',
    },
    'tl7vy8f9': {
      'en': 'Town',
      'de': 'Stadt',
      'es': 'Ciudad',
      'fr': 'Ville',
    },
    'sqb1k3ec': {
      'en': 'Postal-Code',
      'de': 'Postleitzahl',
      'es': 'Código Postal',
      'fr': 'Code Postal',
    },
    'yxwo7j7o': {
      'en': 'Postal-Code',
      'de': 'Postleitzahl',
      'es': 'Código Postal',
      'fr': 'Code Postal',
    },
    's6h1wnxo': {
      'en': 'Country',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    '0g14koc1': {
      'en': 'Country',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    'mpk8lics': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
    },
    'dr5994wq': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // IT-Skills-Settings
  {
    'th69fh0p': {
      'en': 'Complete IT-Skills',
      'de': 'Umfassende IT-Kenntnisse',
      'es': 'Completas habilidades de TI',
      'fr': 'Compétences informatiques complètes',
    },
    'zwdp76ds': {
      'en': 'Complete your IT-Skills',
      'de': 'Vervollständigen Sie Ihre IT-Kenntnisse',
      'es': 'Complete sus habilidades de TI',
      'fr': 'Complétez vos compétences informatiques',
    },
    'shhe1ydw': {
      'en': 'Your IT-Skills',
      'de': 'Deine IT-Kenntnisse',
      'es': 'Tus habilidades de TI',
      'fr': 'Vos compétences informatiques',
    },
    'o9puwj76': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
    },
    'w70117by': {
      'en': 'new IT-Skills ',
      'de': 'neue IT-Kenntnisse',
      'es': 'nuevas habilidades de TI',
      'fr': 'nouvelles compétences informatiques',
    },
    'awk15nmc': {
      'en': 'Add IT Skills here',
      'de': 'Fügen Sie hier IT-Kenntnisse hinzu',
      'es': 'Agregue habilidades de TI aquí',
      'fr': 'Ajoutez des compétences informatiques ici',
    },
    'ocq5kvbi': {
      'en': 'Add',
      'de': 'Hinzufügen',
      'es': 'Agregar',
      'fr': 'Ajouter',
    },
    '5ej9zapx': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // Language-Settings
  {
    '4bq07mgn': {
      'en': 'Complete Languages',
      'de': 'Komplette Sprachen',
      'es': 'Idiomas completos',
      'fr': 'Langues complètes',
    },
    'whlv0la7': {
      'en': 'Complete your languages',
      'de': 'Vervollständigen Sie Ihre Sprachen',
      'es': 'Completa tus idiomas',
      'fr': 'Complétez vos langues',
    },
    'z797zvs5': {
      'en': 'Your Languages',
      'de': 'Ihre Sprachen',
      'es': 'Tus idiomas',
      'fr': 'Vos langues',
    },
    '9umukc55': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
    },
    'pnbjiyri': {
      'en': 'new Language',
      'de': 'neue Sprache',
      'es': 'nuevo idioma',
      'fr': 'nouveau langage',
    },
    'ujxa03re': {
      'en': 'Add Language here',
      'de': 'Fügen Sie hier eine Sprache hinzu',
      'es': 'Añadir idioma aquí',
      'fr': 'Ajouter une langue ici',
    },
    'rfcncdh0': {
      'en': 'Add',
      'de': 'Hinzufügen',
      'es': 'Agregar',
      'fr': 'Ajouter',
    },
    'pi0dfjv1': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // Customer
  {
    'fwglq52i': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
    },
    '6fgimpch': {
      'en': 'Mail',
      'de': 'Mail',
      'es': 'Correo',
      'fr': 'Mail',
    },
    'igthvfrg': {
      'en': 'Adress',
      'de': 'Kunden-Adresse',
      'es': 'Dirección del cliente',
      'fr': 'Adresse du client',
    },
    'pfk6zl6k': {
      'en': 'Themes',
      'de': 'Themen',
      'es': 'Temas',
      'fr': 'Thèmes',
    },
    'w9rexsje': {
      'en': 'Languages',
      'de': 'Sprachen',
      'es': 'Idiomas',
      'fr': 'Langues',
    },
    '91qmu550': {
      'en': 'Revenue',
      'de': 'Einnahmen',
      'es': 'Ganancia',
      'fr': 'Revenu',
    },
    'xf3hox2c': {
      'en': 'Status',
      'de': 'Status',
      'es': 'Estado',
      'fr': 'Statut',
    },
    'mzuncnhu': {
      'en': 'Add meeting to user',
      'de': 'Meeting dem Benutzer hinzufügen',
      'es': 'Agregar reunión al usuario',
      'fr': 'Ajouter une réunion à l\'utilisateur',
    },
    '955no1if': {
      'en': 'Date',
      'de': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'uwi3huii': {
      'en': 'Duration',
      'de': 'Dauer',
      'es': 'Duración',
      'fr': 'Durée',
    },
    '8c86p3v1': {
      'en': 'Costs',
      'de': 'Kosten',
      'es': 'Costos',
      'fr': 'Frais',
    },
    'g13pqfbb': {
      'en': 'Supervisor',
      'de': 'Aufsicht',
      'es': 'Supervisor',
      'fr': 'Superviseur',
    },
    'w6upyuwo': {
      'en': 'ID:',
      'de': 'AUSWEIS:',
      'es': '',
      'fr': '',
    },
    '365ngbkk': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // Main
  {
    '3xmp7l5l': {
      'en': 'bytes Coding',
      'de': 'bytes Coding',
      'es': '',
      'fr': '',
    },
    'ugt68zzx': {
      'en': 'Platform Navigation',
      'de': 'Platform Navigation',
      'es': 'Navegación de plataforma',
      'fr': 'Navigation sur la plateforme',
    },
    '15s2dq8x': {
      'en': 'Main-Menu',
      'de': 'Hauptmenü',
      'es': 'Menú principal',
      'fr': 'Menu principal',
    },
    '6g8wo7v3': {
      'en': '12',
      'de': '12',
      'es': '12',
      'fr': '12',
    },
    'lusq685u': {
      'en': 'Chats',
      'de': 'Chats',
      'es': 'Charlas',
      'fr': 'Discussions',
    },
    '5zyogc9t': {
      'en': '12',
      'de': '12',
      'es': '12',
      'fr': '12',
    },
    'uc1usyqa': {
      'en': 'Support Tickets',
      'de': 'Support-Tickets',
      'es': 'Boletos de soporte',
      'fr': 'Billets d\'assistance',
    },
    'uuz9xwx4': {
      'en': '12',
      'de': '12',
      'es': '12',
      'fr': '12',
    },
    'mzevq165': {
      'en': 'Calendar',
      'de': 'Kalender',
      'es': 'Calendario',
      'fr': 'Calendrier',
    },
    '12tpf17h': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
    'xahmx4lz': {
      'en': 'Billing',
      'de': 'Abrechnung',
      'es': 'Facturación',
      'fr': 'Facturation',
    },
    'azmu0lbt': {
      'en': 'Members',
      'de': 'Mitglieder',
      'es': 'Miembros',
      'fr': 'Membres',
    },
    'v3wuo8gh': {
      'en': 'Light-Mode',
      'de': 'Licht-Modus',
      'es': 'Modo de luz',
      'fr': 'Mode lumière',
    },
    '1m01zim9': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
    },
    'tmoj32d1': {
      'en': 'Projects Overview',
      'de': 'Projekte Übersicht',
      'es': 'Resumen de proyectos',
      'fr': 'Aperçu des projets',
    },
    'ohbxki3q': {
      'en': 'Review the details below of all current projects.',
      'de': 'Sehen Sie sich unten die Details aller aktuellen Projekte an.',
      'es':
          'Revise los detalles a continuación de todos los proyectos actuales.',
      'fr': 'Consultez les détails ci-dessous de tous les projets en cours.',
    },
    'p942dt14': {
      'en': 'All',
      'de': 'Alle',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'ntn7402o': {
      'en': 'Own Projects',
      'de': 'Eigene Projekte',
      'es': 'Proyectos Propios',
      'fr': 'Propres projets',
    },
    'o6dzwlaw': {
      'en': 'Others',
      'de': 'Andere',
      'es': 'Otros',
      'fr': 'Autres',
    },
    '4zt58o1s': {
      'en': 'Closed',
      'de': 'Geschlossen',
      'es': 'Cerrado',
      'fr': 'Fermé',
    },
    'mzguga2z': {
      'en': 'All',
      'de': 'Alle',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'xzbp5c59': {
      'en': 'Filters',
      'de': 'Filter',
      'es': 'Filtros',
      'fr': 'Filtres',
    },
    'ahzd947o': {
      'en': 'Filter here...',
      'de': 'Hier filtern...',
      'es': 'Filtrar aquí...',
      'fr': 'Filtrez ici...',
    },
    '73gv4wgu': {
      'en': 'Filter',
      'de': 'Filter',
      'es': 'Filtrar',
      'fr': 'Filtre',
    },
    'efbd6j4b': {
      'en': 'Filter here...',
      'de': 'Hier filtern...',
      'es': 'Filtrar aquí...',
      'fr': 'Filtrez ici...',
    },
    'hv1ie1b8': {
      'en': 'Add Customer',
      'de': 'Kunden hinzufügen',
      'es': 'Agregar cliente',
      'fr': 'Ajouter un client',
    },
    'aaep28x3': {
      'en': 'Add Case',
      'de': 'Fall hinzufügen',
      'es': 'Agregar caso',
      'fr': 'Ajouter un cas',
    },
    'n9qnpbyi': {
      'en': 'ID#: ',
      'de': 'ID#: ',
      'es': '',
      'fr': '',
    },
    'nhxrq5ni': {
      'en': 'ID#: ',
      'de': 'ID#: ',
      'es': '',
      'fr': '',
    },
    'ati3ejso': {
      'en': 'ID#: ',
      'de': 'ID#: ',
      'es': '',
      'fr': '',
    },
    'u27w6351': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // Users
  {
    'lefjjtu5': {
      'en': 'Search for people...',
      'de': 'Suche nach Personen...',
      'es': 'Búsqueda de personas...',
      'fr': 'Recherche de personnes...',
    },
    'm4jj16bz': {
      'en': 'Search for people...',
      'de': '',
      'es': '',
      'fr': '',
    },
    'j34sl75v': {
      'en': 'Team-Members',
      'de': 'Team-Mitglieder',
      'es': 'Miembros del equipo',
      'fr': 'Membres de l\'équipe',
    },
    '73o0o7i4': {
      'en': 'All of our Customers & Employees',
      'de': 'Alle unsere Kunden und Mitarbeiter',
      'es': 'Todos nuestros clientes y empleados',
      'fr': 'Tous nos clients et employés',
    },
    'l72xtc1b': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // CreateCase
  {
    '63tpu80q': {
      'en': 'ID:',
      'de': 'ID:',
      'es': 'ID:',
      'fr': 'ID:',
    },
    '91f8nfh0': {
      'en': 'Case ID',
      'de': 'Fall-ID',
      'es': 'Identificación del caso',
      'fr': 'Numéro de cas',
    },
    'q2qhf2ce': {
      'en': 'Case ID...',
      'de': 'Fall-ID...',
      'es': 'Identificación del caso...',
      'fr': 'Numéro d\'identification du cas...',
    },
    'y00zbz7g': {
      'en': 'Title...',
      'de': 'Titel...',
      'es': 'Título...',
      'fr': 'Titre...',
    },
    'eaxq1etl': {
      'en': 'Title...',
      'de': 'Titel...',
      'es': 'Título...',
      'fr': 'Titre...',
    },
    'zrh50pvf': {
      'en': 'Description...',
      'de': 'Beschreibung...',
      'es': 'Descripción...',
      'fr': 'Description...',
    },
    'zboepkw1': {
      'en': 'Themes',
      'de': 'Themen',
      'es': 'Temas',
      'fr': 'Thèmes',
    },
    'nh1r0238': {
      'en': 'Option 1',
      'de': 'Option 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
    },
    'u3h0qui2': {
      'en': 'Topics',
      'de': 'Themen',
      'es': 'Temas',
      'fr': 'Les sujets',
    },
    'h13kg7qr': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'sx3ty69v': {
      'en': 'Customer',
      'de': 'Kunde',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'osvnesbh': {
      'en': 'Option 1',
      'de': 'Option 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
    },
    'psh6ke1p': {
      'en': 'Customer Name',
      'de': 'Kundenname',
      'es': 'Nombre del cliente',
      'fr': 'Nom du client',
    },
    'jfcys0av': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '1m1enuc4': {
      'en': 'Revenue',
      'de': 'Einnahmen',
      'es': 'Ganancia',
      'fr': 'Revenu',
    },
    'imvqflfb': {
      'en': 'Price per hour',
      'de': 'Preis pro Stunde',
      'es': 'Precio por hora',
      'fr': 'Prix ​​par heure',
    },
    'zy0j4m21': {
      'en': '50',
      'de': '50',
      'es': '50',
      'fr': '50',
    },
    'p25f6cpa': {
      'en': 'Add Case',
      'de': 'Fall hinzufügen',
      'es': 'Agregar caso',
      'fr': 'Ajouter un cas',
    },
    '0rdy80es': {
      'en': 'Create Case',
      'de': 'Fall erstellen',
      'es': 'Crear caso',
      'fr': 'Créer un cas',
    },
    'brd4f1fu': {
      'en': 'Create a new case with this form',
      'de': 'Erstellen Sie mit diesem Formular einen neuen Fall',
      'es': 'Crear un nuevo caso con este formulario',
      'fr': 'Créez un nouveau dossier avec ce formulaire',
    },
    'vvddebob': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_Create
  {
    '7g15vrub': {
      'en': 'bytes Coding',
      'de': 'bytes Coding',
      'es': '',
      'fr': '',
    },
    'yuf6qyzb': {
      'en': 'Get Started',
      'de': 'Loslegen',
      'es': 'Empezar',
      'fr': 'Commencer',
    },
    'n8xp8945': {
      'en': 'Create an account by using the form below.',
      'de': 'Erstellen Sie mithilfe des untenstehenden Formulars ein Konto.',
      'es': 'Cree una cuenta utilizando el siguiente formulario.',
      'fr': 'Créez un compte en utilisant le formulaire ci-dessous.',
    },
    'hxdqv67a': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'k3t8iv0d': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'am9thlup': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'cp9wwxhh': {
      'en': 'Or sign up with',
      'de': 'Oder registrieren Sie sich mit',
      'es': 'O regístrate con',
      'fr': 'Ou inscrivez-vous avec',
    },
    'zohwxmwa': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
    },
    'l8nmxfqe': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
    },
    '4o69hz8n': {
      'en': 'Already have an account? ',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte?',
    },
    'p5d43lji': {
      'en': 'Sign in here',
      'de': 'Hier anmelden',
      'es': 'Firme aquí',
      'fr': 'Se connecter ici',
    },
    '9fj3ed5h': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_Login
  {
    'b1a1m656': {
      'en': 'bytes Coding',
      'de': 'bytes Coding',
      'es': '',
      'fr': '',
    },
    'wc6vlb88': {
      'en': 'Welcome Back',
      'de': 'Willkommen zurück',
      'es': 'Bienvenido de nuevo',
      'fr': 'Content de te revoir',
    },
    '8yhirh5p': {
      'en': 'Fill out the information below in order to access your account.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um auf Ihr Konto zuzugreifen.',
      'es': 'Complete la información a continuación para acceder a su cuenta.',
      'fr':
          'Remplissez les informations ci-dessous afin d\'accéder à votre compte.',
    },
    '8ucnopf5': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'petfhqha': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'p3xaauvg': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    '08btyait': {
      'en': 'Or sign in with',
      'de': 'Oder melden Sie sich an mit',
      'es': 'O inicia sesión con',
      'fr': 'Ou connectez-vous avec',
    },
    'pmg4jacf': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
    },
    'lhcickgn': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
    },
    '8pwvx02e': {
      'en': 'Don\'t have an account?  ',
      'de': 'Sie haben noch kein Konto?',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'mk06lsbv': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'ak2gtbko': {
      'en': 'Forgot password?',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    'vf342axe': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_ForgotPassword
  {
    '2gddz9zm': {
      'en': 'bytes Coding',
      'de': 'bytes Coding',
      'es': '',
      'fr': '',
    },
    'ngxwdtah': {
      'en': 'Forgot Password',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    'rcdhs0gf': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'de':
          'Bitte geben Sie unten Ihre E-Mail-Adresse ein, um einen Link zum Zurücksetzen des Passworts zu erhalten.',
      'es':
          'Complete su correo electrónico a continuación para recibir un enlace para restablecer la contraseña.',
      'fr':
          'Veuillez remplir votre e-mail ci-dessous afin de recevoir un lien de réinitialisation du mot de passe.',
    },
    'mzhbas81': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'cw6tl9xj': {
      'en': 'Send Reset Link',
      'de': 'Link zum Zurücksetzen senden',
      'es': 'Enviar enlace de reinicio',
      'fr': 'Envoyer le lien de réinitialisation',
    },
    'wlesa9ou': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_createProfile
  {
    'erspxmah': {
      'en': 'bytes Coding',
      'de': 'bytes Coding',
      'es': '',
      'fr': '',
    },
    'x7tuflp8': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_Profile
  {
    '3gvgvwg1': {
      'en': 'Your Account',
      'de': 'Ihr Konto',
      'es': 'Su cuenta',
      'fr': 'Votre compte',
    },
    'od94gyfg': {
      'en': 'Edit Profile',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    '3bqy4rph': {
      'en': 'Edit Adress',
      'de': 'Adresse bearbeiten',
      'es': 'Editar dirección',
      'fr': 'Modifier l\'adresse',
    },
    'v8wpgdwz': {
      'en': 'Edit Languages',
      'de': 'Sprachen bearbeiten',
      'es': 'Editar idiomas',
      'fr': 'Modifier les langues',
    },
    'k9gh52ok': {
      'en': 'Edit IT-Skills',
      'de': 'IT-Kenntnisse bearbeiten',
      'es': 'Editar habilidades de TI',
      'fr': 'Modifier les compétences informatiques',
    },
    'yf1kh2jt': {
      'en': 'App Settings',
      'de': 'App Einstellungen',
      'es': 'Ajustes de Aplicacion',
      'fr': 'Paramètres de l\'application',
    },
    'z84qmaed': {
      'en': 'Support',
      'de': 'Unterstützung',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    'dodyl2fx': {
      'en': 'Terms of Service',
      'de': 'Nutzungsbedingungen',
      'es': 'Términos de servicio',
      'fr': 'Conditions d\'utilisation',
    },
    'zhg4cl4u': {
      'en': 'Log Out',
      'de': 'Ausloggen',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'bommisgd': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_EditProfile
  {
    'xs06iv32': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // support_TicketList
  {
    '8tf2yxr2': {
      'en': 'Ticket #: ',
      'de': 'Ticket #: ',
      'es': '',
      'fr': '',
    },
    'b5m54jpy': {
      'en': 'Support Tickets',
      'de': 'Support-Tickets',
      'es': 'Boletos de soporte',
      'fr': 'Billets d\'assistance',
    },
    'y1cphusm': {
      'en': 'Below are a list of recent tickets created',
      'de': 'Unten finden Sie eine Liste der zuletzt erstellten Tickets',
      'es':
          'A continuación se muestra una lista de tickets creados recientemente.',
      'fr': 'Vous trouverez ci-dessous une liste des tickets récemment créés',
    },
    '8bi66y39': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // support_SubmitTicket
  {
    'aekkeure': {
      'en': 'Ticket-Creation',
      'de': 'Ticket-Erstellung',
      'es': 'Creación de entradas',
      'fr': 'Création de tickets',
    },
    'th2f4v4n': {
      'en': 'Create a Support-Ticket here',
      'de': 'Hier Support-Ticket erstellen',
      'es': 'Cree un ticket de soporte aquí',
      'fr': 'Créez un ticket de support ici',
    },
    'vj2kin4a': {
      'en': 'Fill out the form below to submit a ticket.',
      'de':
          'Füllen Sie das untenstehende Formular aus, um ein Ticket einzureichen.',
      'es': 'Complete el siguiente formulario para enviar un ticket.',
      'fr': 'Remplissez le formulaire ci-dessous pour soumettre un ticket.',
    },
    '8a83o12g': {
      'en': 'Call Us',
      'de': 'Rufen Sie uns an',
      'es': 'Llámanos',
      'fr': 'Appelez-nous',
    },
    'txl8rzat': {
      'en': 'Email Us',
      'de': 'Schreiben Sie uns eine E-Mail',
      'es': 'Envíanos un correo electrónico',
      'fr': 'Envoyez-nous un email',
    },
    'ricp38cm': {
      'en': 'What is going on?',
      'de': 'Was ist los?',
      'es': '¿Qué está pasando?',
      'fr': 'Que se passe-t-il?',
    },
    '0l26gje2': {
      'en': 'Short Description of what is going on...',
      'de': 'Kurze Beschreibung dessen, was los ist ...',
      'es': 'Breve descripción de lo que está pasando...',
      'fr': 'Brève description de ce qui se passe...',
    },
    'eyq6jort': {
      'en': 'Choose a priority level',
      'de': 'Wählen Sie eine Prioritätsstufe',
      'es': 'Elija un nivel de prioridad',
      'fr': 'Choisissez un niveau de priorité',
    },
    'nj4gxq7y': {
      'en': 'Emergency',
      'de': 'Notfall',
      'es': 'Emergencia',
      'fr': 'Urgence',
    },
    'nxn0qt7g': {
      'en': 'High',
      'de': 'Hoch',
      'es': 'Alto',
      'fr': 'Haut',
    },
    '36ar5gt0': {
      'en': 'Medium',
      'de': 'Mittel',
      'es': 'Medio',
      'fr': 'Moyen',
    },
    'xbub19mw': {
      'en': 'Low',
      'de': 'Niedrig',
      'es': 'Bajo',
      'fr': 'Faible',
    },
    'udk6s772': {
      'en': 'Low',
      'de': 'Niedrig',
      'es': 'Bajo',
      'fr': 'Faible',
    },
    'ngxigtui': {
      'en': 'Upload Screenshot',
      'de': 'Screenshot hochladen',
      'es': 'Cargar captura de pantalla',
      'fr': 'Télécharger une capture d\'écran',
    },
    '9furp0rw': {
      'en': 'Assign User',
      'de': 'Benutzer zuweisen',
      'es': 'Asignar usuario',
      'fr': 'Attribuer un utilisateur',
    },
    'zdl3izxa': {
      'en': 'Add User',
      'de': 'Benutzer hinzufügen',
      'es': 'Agregar usuario',
      'fr': 'Ajouter un utilisateur',
    },
    '0sjmvj9o': {
      'en': 'Submit Ticket',
      'de': 'Ticket übermitteln',
      'es': 'Enviar ticket',
      'fr': 'Envoyer le ticket',
    },
    'h5odabcw': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // support_TicketDetails
  {
    'mscspqqu': {
      'en': 'Ticket Details',
      'de': 'Ticketdetails',
      'es': 'Detalles del boleto',
      'fr': 'Détails du billet',
    },
    'ss89pb28': {
      'en': 'Ticket #: ',
      'de': 'Ticket #: ',
      'es': '',
      'fr': '',
    },
    'istektt5': {
      'en': 'Below are the details of this support ticket.',
      'de': 'Nachfolgend finden Sie die Einzelheiten zu diesem Support-Ticket.',
      'es':
          'A continuación se detallan los detalles de este ticket de soporte.',
      'fr': 'Vous trouverez ci-dessous les détails de ce ticket d\'assistance.',
    },
    'zuqhc7rn': {
      'en': 'Description',
      'de': 'Beschreibung',
      'es': 'Descripción',
      'fr': 'Description',
    },
    '2a7z81xx': {
      'en': 'Submitted on',
      'de': 'Eingereicht am',
      'es': 'Presentado el',
      'fr': 'Soumis le',
    },
    '3b2i6hgq': {
      'en': 'Last Edited',
      'de': 'Zuletzt bearbeitet',
      'es': 'Última edición',
      'fr': 'Dernière modification',
    },
    'h1lawcol': {
      'en': 'Status',
      'de': 'Status',
      'es': 'Estado',
      'fr': 'Statut',
    },
    '915sp9a8': {
      'en': 'Pending',
      'de': 'Ausstehend',
      'es': 'Pendiente',
      'fr': 'En attente',
    },
    'zv37t5tt': {
      'en': 'In Progress',
      'de': 'Im Gange',
      'es': 'En curso',
      'fr': 'En cours',
    },
    'fbik18u7': {
      'en': 'Complete',
      'de': 'Vollständig',
      'es': 'Completo',
      'fr': 'Complet',
    },
    'l9ecv4xv': {
      'en': 'Submitted',
      'de': 'Gesendet',
      'es': 'Enviado',
      'fr': 'Soumis',
    },
    '5g50y16u': {
      'en': 'Please select...',
      'de': 'Bitte auswählen...',
      'es': 'Por favor seleccione...',
      'fr': 'Veuillez sélectionner...',
    },
    '74vmywjv': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'yy7xpy7w': {
      'en': 'Assigned to',
      'de': 'Zugewiesen an',
      'es': 'Asignado a',
      'fr': 'Assigné à',
    },
    'jvimk02l': {
      'en': 'Submitted By',
      'de': 'Eingereicht von',
      'es': 'Presentado por',
      'fr': 'Proposé par',
    },
    'sacl5x8e': {
      'en': 'Assign',
      'de': 'Zuordnen',
      'es': 'Asignar',
      'fr': 'Attribuer',
    },
    'x5s786v4': {
      'en': 'Update Ticket',
      'de': 'Ticket aktualisieren',
      'es': 'Boleto de actualización',
      'fr': 'Mettre à jour le ticket',
    },
    'yqpe5xlu': {
      'en': 'Ticket',
      'de': 'Ticket',
      'es': '',
      'fr': '',
    },
    'x6ddm1u4': {
      'en': 'Current Support-Ticket',
      'de': 'Aktuelles Support-Ticket',
      'es': 'Ticket de soporte actual',
      'fr': 'Ticket de support actuel',
    },
  },
  // EmployeeBilling
  {
    '8zdbsdy4': {
      'en': 'Customer-Information',
      'de': 'Kundeninformation',
      'es': 'Información al cliente',
      'fr': 'Informations client',
    },
    '2mghmw6b': {
      'en': 'Below is a summary of your activity',
      'de': 'Nachfolgend finden Sie eine Zusammenfassung Ihrer Aktivitäten',
      'es': 'A continuación se muestra un resumen de su actividad.',
      'fr': 'Ci-dessous un résumé de votre activité',
    },
    'joipmprf': {
      'en': 'Money Earned',
      'de': 'Verdientes Geld',
      'es': 'Dinero ganado',
      'fr': 'L\'argent gagné',
    },
    'bvrj937a': {
      'en': 'Average Billing',
      'de': 'Durchschnittliche Abrechnung',
      'es': 'Facturación promedio',
      'fr': 'Facturation moyenne',
    },
    'ucngtba5': {
      'en': 'Total Customers',
      'de': 'Kunden gesamt',
      'es': 'Clientes totales',
      'fr': 'Clients totaux',
    },
    'dbqutbci': {
      'en': 'Customer-Information',
      'de': 'Kundeninformation',
      'es': 'Información al cliente',
      'fr': 'Informations client',
    },
    'llfx7g5q': {
      'en': 'An overview of your customer jobs.',
      'de': 'Eine Übersicht Ihrer Kundenaufträge.',
      'es': 'Una descripción general de los trabajos de sus clientes.',
      'fr': 'Un aperçu de vos tâches clients.',
    },
    'fxfdsogo': {
      'en': 'current customers',
      'de': 'derzeitige Kunden',
      'es': 'clientes actuales',
      'fr': 'clients actuels',
    },
    '6l634rov': {
      'en': 'completed customers',
      'de': 'abgeschlossene Kunden',
      'es': 'clientes completados',
      'fr': 'clients complétés',
    },
    '82u69mor': {
      'en': 'Customer-Cases',
      'de': 'Kunden-Cases',
      'es': 'Casos de clientes',
      'fr': 'Cas clients',
    },
    'fnw01e3l': {
      'en': 'A summary of your current customer-cases',
      'de': 'Eine Zusammenfassung Ihrer aktuellen Kundenfälle',
      'es': 'Un resumen de los casos de sus clientes actuales',
      'fr': 'Un résumé de vos cas clients actuels',
    },
    'msp77w1m': {
      'en': 'ID#: ',
      'de': 'ID#: ',
      'es': '',
      'fr': '',
    },
    '1xsokerm': {
      'en': 'Customer-Meetings',
      'de': 'Kunden-Meetings',
      'es': 'Reuniones con clientes',
      'fr': 'Rendez-vous clients',
    },
    'bx7t1x0h': {
      'en': 'A summary of your meetings',
      'de': 'Eine Zusammenfassung Ihrer Meetings',
      'es': 'Un resumen de sus reuniones',
      'fr': 'Un résumé de vos réunions',
    },
    'ymj55p09': {
      'en': 'Date',
      'de': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    '9jkwcq7p': {
      'en': 'Duration',
      'de': 'Dauer',
      'es': 'Duración',
      'fr': 'Durée',
    },
    'o52da1js': {
      'en': 'Costs',
      'de': 'Kosten',
      'es': 'Costos',
      'fr': 'Frais',
    },
    'phi510ca': {
      'en': 'Supervisor',
      'de': 'Aufsicht',
      'es': 'Supervisor',
      'fr': 'Superviseur',
    },
    'w0tdj7p3': {
      'en': 'Recent Activity',
      'de': 'Letzte Aktivität',
      'es': 'Actividad reciente',
      'fr': 'Activité récente',
    },
    '17ihzxhi': {
      'en': 'Below is an overview of tasks & activity completed.',
      'de':
          'Nachfolgend finden Sie eine Übersicht über die abgeschlossenen Aufgaben und Aktivitäten.',
      'es':
          'A continuación se muestra una descripción general de las tareas y actividades completadas.',
      'fr':
          'Vous trouverez ci-dessous un aperçu des tâches et des activités réalisées.',
    },
    'fcxcsakp': {
      'en': 'Tasks',
      'de': 'Aufgaben',
      'es': 'Tareas',
      'fr': 'Tâches',
    },
    '0nc0tkvo': {
      'en': 'Completed',
      'de': 'Vollendet',
      'es': 'Terminado',
      'fr': 'Complété',
    },
    '2dixago6': {
      'en': 'active',
      'de': 'aktiv',
      'es': 'activo',
      'fr': 'actif',
    },
    'p31pafw5': {
      'en': 'Last 30 Days',
      'de': 'Letzte 30 Tage',
      'es': 'Últimos 30 días',
      'fr': 'Les 30 derniers jours',
    },
    't6p8ypnx': {
      'en': 'average',
      'de': 'Durchschnitt',
      'es': 'promedio',
      'fr': 'moyenne',
    },
    'sauzmy7r': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // Calendar
  {
    '6zjihlff': {
      'en': 'Month',
      'de': 'Monat',
      'es': 'Mes',
      'fr': 'Mois',
    },
    '3jt8agg3': {
      'en': 'Coming Up',
      'de': 'Demnächst',
      'es': 'Subiendo',
      'fr': 'À venir',
    },
    'rpyeywpy': {
      'en': 'Doctors Check In',
      'de': 'Ärzte checken ein',
      'es': 'Registro de médicos',
      'fr': 'Enregistrement des médecins',
    },
    'gef1c0qv': {
      'en': '2:20pm',
      'de': '14:20 Uhr',
      'es': '14:20',
      'fr': '14h20',
    },
    'zb3rbquu': {
      'en': 'Wed, 03/08/2022',
      'de': 'Mi., 08.03.2022',
      'es': 'mié, 08/03/2022',
      'fr': 'mer, 03/08/2022',
    },
    '1slthe9b': {
      'en': 'Past Due',
      'de': 'Überfällig',
      'es': 'Vencido',
      'fr': 'En souffrance',
    },
    'z2wyjgaj': {
      'en': 'Check In',
      'de': 'Einchecken',
      'es': 'Registrarse',
      'fr': 'Enregistrement',
    },
    'kedy7xvu': {
      'en': '2:20pm',
      'de': '14:20 Uhr',
      'es': '14:20',
      'fr': '14h20',
    },
    'mkjfy7eg': {
      'en': 'Wed, 03/08/2022',
      'de': 'Mi., 08.03.2022',
      'es': 'mié, 08/03/2022',
      'fr': 'mer, 03/08/2022',
    },
    'k3g0z96l': {
      'en': 'Week',
      'de': 'Woche',
      'es': 'Semana',
      'fr': 'Semaine',
    },
    'djbai917': {
      'en': 'Coming Up',
      'de': 'Demnächst',
      'es': 'Subiendo',
      'fr': 'À venir',
    },
    'u0ze832q': {
      'en': 'Doctors Check In',
      'de': 'Ärzte checken ein',
      'es': 'Registro de médicos',
      'fr': 'Enregistrement des médecins',
    },
    'kgan1xq6': {
      'en': '2:20pm',
      'de': '14:20 Uhr',
      'es': '14:20',
      'fr': '14h20',
    },
    'kmrpccrv': {
      'en': 'Wed, 03/08/2022',
      'de': 'Mi., 08.03.2022',
      'es': 'mié, 08/03/2022',
      'fr': 'mer, 03/08/2022',
    },
    't0pw8ab7': {
      'en': 'Past Due',
      'de': 'Überfällig',
      'es': 'Vencido',
      'fr': 'En souffrance',
    },
    'wjge1m95': {
      'en': 'Check In',
      'de': 'Einchecken',
      'es': 'Registrarse',
      'fr': 'Enregistrement',
    },
    'of37b0s3': {
      'en': '2:20pm',
      'de': '14:20 Uhr',
      'es': '14:20',
      'fr': '14h20',
    },
    'k2fe4c49': {
      'en': 'Wed, 03/08/2022',
      'de': 'Mi., 08.03.2022',
      'es': 'mié, 08/03/2022',
      'fr': 'mer, 03/08/2022',
    },
    '64srsupd': {
      'en': 'Calender',
      'de': 'Kalander',
      'es': 'Calandrar',
      'fr': 'Calandre',
    },
    'a04niafv': {
      'en': 'Your current Calender',
      'de': 'Ihr aktueller Kalender',
      'es': 'Tu calendario actual',
      'fr': 'Votre calendrier actuel',
    },
    'x5uzyw3v': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // chat_2_Details
  {
    'fmeem6gz': {
      'en': 'Group Chat',
      'de': 'Gruppenchat',
      'es': 'Grupo de chat',
      'fr': 'Discussion de groupe',
    },
    'z9dcgfkq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // chat_2_main
  {
    '3nlz1j90': {
      'en': 'Add Chat',
      'de': 'Chat hinzufügen',
      'es': 'Agregar chat',
      'fr': 'Ajouter une discussion',
    },
    'j81ilpuq': {
      'en': 'Group Chat',
      'de': 'Gruppenchat',
      'es': 'Grupo de chat',
      'fr': 'Discussion de groupe',
    },
    'oq6hlue0': {
      'en': 'My Chats',
      'de': 'Meine Chats',
      'es': 'Mis Chats',
      'fr': 'Mes discussions',
    },
    'qwk0a6ke': {
      'en': 'Below are your chats and group chats',
      'de': 'Unten sind Ihre Chats und Gruppenchats',
      'es': 'A continuación se muestran tus chats y chats grupales.',
      'fr':
          'Vous trouverez ci-dessous vos discussions et discussions de groupe',
    },
    'wfh3loj4': {
      'en': '__',
      'de': '__',
      'es': '__',
      'fr': '__',
    },
  },
  // chat_2_InviteUsers
  {
    'hopvi9vs': {
      'en': 'Invite Users',
      'de': 'Benutzer einladen',
      'es': 'Invitar usuarios',
      'fr': 'Inviter des utilisateurs',
    },
    'ql4fu98g': {
      'en': 'Selected',
      'de': 'Ausgewählt',
      'es': 'Seleccionado',
      'fr': 'Choisi',
    },
    '2b5fgo9t': {
      'en': 'Invite Users',
      'de': 'Benutzer einladen',
      'es': 'Invitar usuarios',
      'fr': 'Inviter des utilisateurs',
    },
    'pdl3903c': {
      'en': 'Select users from below to start a chat.',
      'de': 'Wählen Sie unten Benutzer aus, um einen Chat zu starten.',
      'es': 'Seleccione usuarios de abajo para iniciar un chat.',
      'fr':
          'Sélectionnez les utilisateurs ci-dessous pour démarrer une discussion.',
    },
    'jy4o2t2o': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // image_Details
  {
    'r61wss33': {
      'en': 'Image Details',
      'de': 'Bilddetails',
      'es': 'Detalles de la imagen',
      'fr': 'Détails de l\'image',
    },
    'itj2r1tk': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // createCustomer
  {
    'ebpqrveb': {
      'en': 'Full name',
      'de': 'Vollständiger Name',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'wl53zgkt': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
    },
    '1qwq52s2': {
      'en': 'Phone number',
      'de': 'Telefonnummer',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'k42rx09i': {
      'en': 'Phone Number',
      'de': 'Telefonnummer',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'vdzc35iz': {
      'en': 'E-Mail',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'cu1rz8hq': {
      'en': 'E-Mail',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'w83v5p9g': {
      'en': 'Street',
      'de': 'Straße',
      'es': 'Calle',
      'fr': 'Rue',
    },
    'dz8s1veo': {
      'en': 'Street',
      'de': 'Straße',
      'es': 'Calle',
      'fr': 'Rue',
    },
    '8m7j9wso': {
      'en': 'City',
      'de': 'Stadt',
      'es': 'Ciudad',
      'fr': 'Ville',
    },
    'vl5t2xru': {
      'en': 'City',
      'de': 'Stadt',
      'es': 'Ciudad',
      'fr': 'Ville',
    },
    'vkwdzh8z': {
      'en': 'Postal-Code',
      'de': 'Postleitzahl',
      'es': 'Código Postal',
      'fr': 'Code Postal',
    },
    'as64pn2v': {
      'en': 'Postal-Code',
      'de': 'Postleitzahl',
      'es': 'Código Postal',
      'fr': 'Code Postal',
    },
    'hgyxigwg': {
      'en': 'Country',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    'naeu1u2u': {
      'en': 'Country',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    'qzvdq8bg': {
      'en': 'Languages',
      'de': 'Sprachen',
      'es': 'Idiomas',
      'fr': 'Langues',
    },
    'xf9ydg3j': {
      'en': 'Option 1',
      'de': 'Option 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
    },
    '7kfa0wi0': {
      'en': 'Customer Languages',
      'de': 'Kundensprachen',
      'es': 'Idiomas del cliente',
      'fr': 'Langues du client',
    },
    'zwexgz3e': {
      'en': 'Search for an element...',
      'de': 'Suche nach einem Element...',
      'es': 'Buscar un elemento...',
      'fr': 'Rechercher un élément...',
    },
    'hb047u9p': {
      'en': 'Add Customer',
      'de': 'Kunden hinzufügen',
      'es': 'Agregar cliente',
      'fr': 'Ajouter un client',
    },
    'the8au5f': {
      'en': 'Create Customer',
      'de': 'Kunden anlegen',
      'es': 'Crear cliente',
      'fr': 'Créer un client',
    },
    'ic0u8pqs': {
      'en': 'Create new Customer with this Form',
      'de': 'Erstellen Sie mit diesem Formular einen neuen Kunden',
      'es': 'Crear nuevo Cliente con este Formulario',
      'fr': 'Créer un nouveau client avec ce formulaire',
    },
    'jx8qgyjd': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // AddMeetingToCustomer
  {
    'fq1mmuz6': {
      'en': 'ID:',
      'de': 'ID:',
      'es': '',
      'fr': '',
    },
    'et2esaos': {
      'en': 'Option 1',
      'de': 'Option 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
    },
    'i5paqfsq': {
      'en': 'Tutor',
      'de': 'Tutor',
      'es': 'Tutor',
      'fr': 'Tuteur',
    },
    'ccl67tsf': {
      'en': 'Search for an element...',
      'de': 'Suche nach einem Element...',
      'es': 'Buscar un elemento...',
      'fr': 'Rechercher un élément...',
    },
    '22nnbou1': {
      'en': 'duration',
      'de': 'Dauer',
      'es': 'duración',
      'fr': 'durée',
    },
    'dm5dydjl': {
      'en': '0.0',
      'de': '0,0',
      'es': '0.0',
      'fr': '0,0',
    },
    'xp4nfe90': {
      'en': 'costs',
      'de': 'Dauer',
      'es': 'duración',
      'fr': 'durée',
    },
    'ao4af596': {
      'en': '0.0',
      'de': '0,0',
      'es': '0.0',
      'fr': '0,0',
    },
    '0hi0scef': {
      'en': 'Save',
      'de': 'Speichern',
      'es': 'Ahorrar',
      'fr': 'Sauvegarder',
    },
    'd4r08dbo': {
      'en': 'Please enter the patients full name.',
      'de': 'Bitte geben Sie den vollständigen Namen des Patienten ein.',
      'es': 'Por favor ingrese el nombre completo del paciente.',
      'fr': 'Veuillez saisir le nom complet du patient.',
    },
    'scajuol5': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'nk8m3ef2': {
      'en': 'Please enter an age for the patient.',
      'de': 'Bitte geben Sie das Alter des Patienten ein.',
      'es': 'Por favor ingrese una edad para el paciente.',
      'fr': 'Veuillez entrer un âge pour le patient.',
    },
    'yv7pqmtb': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '548halmr': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'krymuidf': {
      'en': 'Please enter the date of birth of the patient.',
      'de': 'Bitte geben Sie das Geburtsdatum des Patienten ein.',
      'es': 'Por favor ingrese la fecha de nacimiento del paciente.',
      'fr': 'Veuillez saisir la date de naissance du patient.',
    },
    'n82mxek3': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'iw5emeyr': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'eesji8y9': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '142c9phq': {
      'en': 'Add Meeting',
      'de': 'Meeting hinzufügen',
      'es': 'Agregar reunión',
      'fr': 'Ajouter une réunion',
    },
    '6ak09n8d': {
      'en': 'Add a meeting to a special customer',
      'de': 'Einem besonderen Kunden ein Meeting hinzufügen',
      'es': 'Agregar una reunión a un cliente especial',
      'fr': 'Ajouter une réunion à un client spécial',
    },
    'h77ncpzt': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // SideNav
  {
    'an40yt0k': {
      'en': 'Navigation',
      'de': 'Navigation',
      'es': 'Navegación',
      'fr': 'La navigation',
    },
    'r60f84h5': {
      'en': 'For navigating between screens',
      'de': 'Zur Navigation zwischen Bildschirmen',
      'es': 'Para navegar entre pantallas',
      'fr': 'Pour naviguer entre les écrans',
    },
    's5ry5cyk': {
      'en': 'bytes Coding',
      'de': 'bytes Coding',
      'es': '',
      'fr': '',
    },
    'naqnbvxd': {
      'en': 'Platform Navigation',
      'de': 'Platform Navigation',
      'es': 'Navegación de plataforma',
      'fr': 'Navigation sur la plateforme',
    },
    'ryazebh4': {
      'en': 'Main-Menu',
      'de': 'Dashboard',
      'es': '',
      'fr': '',
    },
    'pb71eaaj': {
      'en': '12',
      'de': '12',
      'es': '12',
      'fr': '12',
    },
    '9q77itrm': {
      'en': 'Chats',
      'de': 'Chats',
      'es': 'Charlas',
      'fr': 'Discussions',
    },
    'zv4sd9zz': {
      'en': '12',
      'de': '12',
      'es': '12',
      'fr': '12',
    },
    '2xnm6fps': {
      'en': 'Support Tickets',
      'de': 'Support-Tickets',
      'es': 'Boletos de soporte',
      'fr': 'Billets d\'assistance',
    },
    'feent0lc': {
      'en': '12',
      'de': '12',
      'es': '12',
      'fr': '12',
    },
    '9js2z9y7': {
      'en': 'Calendar',
      'de': 'Kalender',
      'es': 'Calendario',
      'fr': 'Calendrier',
    },
    '8tlki912': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
    '5zra02cb': {
      'en': 'Billing',
      'de': 'Abrechnung',
      'es': 'Facturación',
      'fr': 'Facturation',
    },
    'm9ww17s0': {
      'en': 'Members',
      'de': 'Mitglieder',
      'es': 'Miembros',
      'fr': 'Membres',
    },
    '411g996a': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
      'es': 'Modo de luz',
      'fr': 'Mode lumière',
    },
    'mc7klcgc': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
    },
    '0qj8uewa': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // CustomerBilling
  {
    'brait1y8': {
      'en': 'Customer-Information',
      'de': 'Kundeninformation',
      'es': 'Información al cliente',
      'fr': 'Informations client',
    },
    'odno4o2l': {
      'en': 'Below is a summary of your activity',
      'de': 'Nachfolgend finden Sie eine Zusammenfassung Ihrer Aktivitäten',
      'es': 'A continuación se muestra un resumen de su actividad.',
      'fr': 'Ci-dessous un résumé de votre activité',
    },
    'xxc5wt2v': {
      'en': 'Money Spend',
      'de': 'Geld ausgeben',
      'es': 'Gasto de dinero',
      'fr': 'Dépense d\'argent',
    },
    'xrcnzlbf': {
      'en': 'Average Costs',
      'de': 'Durchschnittliche Kosten',
      'es': 'Costos promedio',
      'fr': 'Coûts moyens',
    },
    'azw44sx6': {
      'en': 'Total Meetings',
      'de': 'Gesamtzahl der Meetings',
      'es': 'Total de reuniones',
      'fr': 'Total des réunions',
    },
    'd35fb2ze': {
      'en': 'Customer-Meetings',
      'de': 'Kunden-Meetings',
      'es': 'Reuniones con clientes',
      'fr': 'Rendez-vous clients',
    },
    '4stawemd': {
      'en': 'A summary of your meetings',
      'de': 'Eine Zusammenfassung Ihrer Meetings',
      'es': 'Un resumen de sus reuniones',
      'fr': 'Un résumé de vos réunions',
    },
    '72cuvxfy': {
      'en': 'Date',
      'de': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'ff89rf83': {
      'en': 'Duration',
      'de': 'Dauer',
      'es': 'Duración',
      'fr': 'Durée',
    },
    '0drowsmc': {
      'en': 'Costs',
      'de': 'Kosten',
      'es': 'Costos',
      'fr': 'Frais',
    },
    'libsyzti': {
      'en': 'Supervisor',
      'de': 'Aufsicht',
      'es': 'Supervisor',
      'fr': 'Superviseur',
    },
    '8c0dhi8u': {
      'en': 'Recent Activity',
      'de': 'Letzte Aktivität',
      'es': 'Actividad reciente',
      'fr': 'Activité récente',
    },
    '9l3zb0oq': {
      'en': 'Below is an overview of tasks & activity completed.',
      'de':
          'Nachfolgend finden Sie eine Übersicht über die abgeschlossenen Aufgaben und Aktivitäten.',
      'es':
          'A continuación se muestra una descripción general de las tareas y actividades completadas.',
      'fr':
          'Vous trouverez ci-dessous un aperçu des tâches et des activités réalisées.',
    },
    'dcaewooa': {
      'en': 'Tasks',
      'de': 'Aufgaben',
      'es': 'Tareas',
      'fr': 'Tâches',
    },
    '52zat9vf': {
      'en': 'Completed',
      'de': 'Vollendet',
      'es': 'Terminado',
      'fr': 'Complété',
    },
    'mwnhrn33': {
      'en': 'active',
      'de': 'aktiv',
      'es': 'activo',
      'fr': 'actif',
    },
    'uxb09uyj': {
      'en': 'Last 30 Days',
      'de': 'Letzte 30 Tage',
      'es': 'Últimos 30 días',
      'fr': 'Les 30 derniers jours',
    },
    'd03ypani': {
      'en': 'average',
      'de': 'Durchschnitt',
      'es': 'promedio',
      'fr': 'moyenne',
    },
    'cddgguhy': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // ProfileEmployee
  {
    'wnodt0nu': {
      'en': 'Mail',
      'de': 'Mail',
      'es': 'Correo',
      'fr': 'Mail',
    },
    'kmtjql97': {
      'en': 'Call',
      'de': 'Anruf',
      'es': 'Llamar',
      'fr': 'Appel',
    },
    'pu04pfxz': {
      'en': 'User-Description',
      'de': 'Benutzer-Beschreibung',
      'es': 'Descripción de usuario',
      'fr': 'Description de l\'utilisateur',
    },
    'jxgl8tmv': {
      'en': 'Money Earned',
      'de': 'Verdientes Geld',
      'es': 'Dinero ganado',
      'fr': 'L\'argent gagné',
    },
    '1sovajv3': {
      'en': 'Average Billing',
      'de': 'Durchschnittliche Abrechnung',
      'es': 'Facturación promedio',
      'fr': 'Facturation moyenne',
    },
    'amq25o7c': {
      'en': 'Total Customers',
      'de': 'Kunden gesamt',
      'es': 'Clientes totales',
      'fr': 'Clients totaux',
    },
    'j5z2op8x': {
      'en': 'Employee-Information',
      'de': 'Mitarbeiterinformation',
      'es': 'Información del empleado',
      'fr': 'Informations sur les employés',
    },
    'yv1tophe': {
      'en': 'An overview of their customer jobs.',
      'de': 'Eine Übersicht ihrer Kundenjobs.',
      'es': 'Una visión general de los trabajos de sus clientes.',
      'fr': 'Un aperçu de leurs tâches clients.',
    },
    'nxmksly7': {
      'en': 'current customers',
      'de': 'derzeitige Kunden',
      'es': 'clientes actuales',
      'fr': 'clients actuels',
    },
    'jj0tni5e': {
      'en': 'completed customers',
      'de': 'abgeschlossene Kunden',
      'es': 'clientes completados',
      'fr': 'clients complétés',
    },
    'ymhq664h': {
      'en': 'Employee-Skills',
      'de': 'Mitarbeiter-Skills',
      'es': 'Habilidades de los empleados',
      'fr': 'Compétences des employés',
    },
    '3fkffaue': {
      'en': 'Employee-Languages',
      'de': 'Mitarbeiter-Sprachen',
      'es': 'Idiomas de los empleados',
      'fr': 'Langues des employés',
    },
    'f49vqwjs': {
      'en': 'Customer-Meetings',
      'de': 'Kunden-Meetings',
      'es': 'Reuniones con clientes',
      'fr': 'Rendez-vous clients',
    },
    '77i9y8d1': {
      'en': 'A summary of their meetings',
      'de': 'Eine Zusammenfassung ihrer Treffen',
      'es': 'Un resumen de sus reuniones.',
      'fr': 'Un résumé de leurs réunions',
    },
    'j8agtzis': {
      'en': 'Date',
      'de': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'tn9ygrs2': {
      'en': 'Duration',
      'de': 'Dauer',
      'es': 'Duración',
      'fr': 'Durée',
    },
    'fl675kqg': {
      'en': 'Costs',
      'de': 'Kosten',
      'es': 'Costos',
      'fr': 'Frais',
    },
    '5tnjst8t': {
      'en': 'Supervisor',
      'de': 'Aufsicht',
      'es': 'Supervisor',
      'fr': 'Superviseur',
    },
    '79sv2fvf': {
      'en': 'User Profile',
      'de': 'Benutzerprofil',
      'es': 'Perfil del usuario',
      'fr': 'Profil de l\'utilisateur',
    },
    'np02awzv': {
      'en': 'Complete selected User Profile',
      'de': 'Ausgewähltes Benutzerprofil vervollständigen',
      'es': 'Completar el perfil de usuario seleccionado',
      'fr': 'Compléter le profil utilisateur sélectionné',
    },
    '1byh2jsg': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // ProfileUser
  {
    'm6b8boxn': {
      'en': 'Mail',
      'de': 'Mail',
      'es': 'Correo',
      'fr': 'Mail',
    },
    't8vz9hvc': {
      'en': 'Call',
      'de': 'Anruf',
      'es': 'Llamar',
      'fr': 'Appel',
    },
    '0boaf6k3': {
      'en': 'User-Description',
      'de': 'Benutzer-Beschreibung',
      'es': 'Descripción de usuario',
      'fr': 'Description de l\'utilisateur',
    },
    '6111v0jh': {
      'en': 'Money Spend',
      'de': 'Geld ausgeben',
      'es': 'Gasto de dinero',
      'fr': 'Dépense d\'argent',
    },
    'w1wt2vr6': {
      'en': 'Average Costs',
      'de': 'Durchschnittliche Kosten',
      'es': 'Costos promedio',
      'fr': 'Coûts moyens',
    },
    'wxdt7dec': {
      'en': 'Total Meetings',
      'de': 'Gesamtzahl der Meetings',
      'es': 'Total de reuniones',
      'fr': 'Total des réunions',
    },
    '0wr4a1s4': {
      'en': 'Customer-Skills',
      'de': 'Kunden-Skills',
      'es': 'Habilidades del cliente',
      'fr': 'Compétences client',
    },
    'gzahnh8h': {
      'en': 'Customer-Languages',
      'de': 'Kundensprachen',
      'es': 'Idiomas del cliente',
      'fr': 'Langues du client',
    },
    'dpos0v43': {
      'en': 'Customer-Meetings',
      'de': 'Kunden-Meetings',
      'es': 'Reuniones con clientes',
      'fr': 'Rendez-vous clients',
    },
    'cpabnexa': {
      'en': 'A summary of their meetings',
      'de': 'Eine Zusammenfassung ihrer Treffen',
      'es': 'Un resumen de sus reuniones.',
      'fr': 'Un résumé de leurs réunions',
    },
    'rtwqlk4h': {
      'en': 'Date',
      'de': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    '3e8hb6wh': {
      'en': 'Duration',
      'de': 'Dauer',
      'es': 'Duración',
      'fr': 'Durée',
    },
    'tmkn04zx': {
      'en': 'Costs',
      'de': 'Kosten',
      'es': 'Costos',
      'fr': 'Frais',
    },
    'dt34ieih': {
      'en': 'Supervisor',
      'de': 'Aufsicht',
      'es': 'Supervisor',
      'fr': 'Superviseur',
    },
    'ersuo796': {
      'en': 'User Profile',
      'de': 'Benutzerprofil',
      'es': 'Perfil del usuario',
      'fr': 'Profil de l\'utilisateur',
    },
    'nrav9y19': {
      'en': 'Complete selected User Profile',
      'de': 'Ausgewähltes Benutzerprofil vervollständigen',
      'es': 'Completar el perfil de usuario seleccionado',
      'fr': 'Compléter le profil utilisateur sélectionné',
    },
    't6mioyok': {
      'en': 'Home',
      'de': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // editProfile_auth_2
  {
    'i42hhvws': {
      'en': 'Adjust the content below to update your profile.',
      'de': 'Passen Sie den Inhalt unten an, um Ihr Profil zu aktualisieren.',
      'es': 'Ajuste el contenido a continuación para actualizar su perfil.',
      'fr': 'Ajustez le contenu ci-dessous pour mettre à jour votre profil.',
    },
    'cb6me508': {
      'en': 'Change Photo',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
      'fr': 'Changer la photo',
    },
    'kzae2g7n': {
      'en': 'Full Name',
      'de': 'Vollständiger Name',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    '7vgor3b8': {
      'en': 'Your full name...',
      'de': 'Ihr vollständiger Name...',
      'es': 'Tu nombre completo...',
      'fr': 'Ton nom complet...',
    },
    'zmpduv5f': {
      'en': 'Phone-Number',
      'de': 'Telefonnummer',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'ylu1rmoi': {
      'en': 'Your Phone-Number...',
      'de': 'Deine Telefonnummer...',
      'es': 'Su número de teléfono...',
      'fr': 'Votre numéro de téléphone...',
    },
    '9kyh4fuc': {
      'en': 'Email-Adress',
      'de': 'E-Mail-Adresse',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    '1pkkrkac': {
      'en': 'Your Phone-Number...',
      'de': 'Deine Telefonnummer...',
      'es': 'Su número de teléfono...',
      'fr': 'Votre numéro de téléphone...',
    },
    'kmiy5qxl': {
      'en': 'User Role',
      'de': 'Benutzer-Rolle',
      'es': 'Rol del usuario',
      'fr': 'Rôle d\'utilisateur',
    },
    'wkjljldr': {
      'en': 'Your role...',
      'de': 'Deine Rolle...',
      'es': 'Tu rol...',
      'fr': 'Ton rôle...',
    },
    'mv1hv80o': {
      'en': 'Short Description',
      'de': 'kurze Beschreibung',
      'es': 'Breve descripción',
      'fr': 'brève description',
    },
    'bc8lb6wd': {
      'en': 'A little about you...',
      'de': 'Ein bisschen über Sie …',
      'es': 'Un poco sobre ti...',
      'fr': 'Un peu de toi...',
    },
  },
  // setPriority_Menu
  {
    '4g1xmiy1': {
      'en': 'Set Priority Level',
      'de': 'Prioritätsstufe festlegen',
      'es': 'Establecer nivel de prioridad',
      'fr': 'Définir le niveau de priorité',
    },
    'ceeouso2': {
      'en': 'Emergency',
      'de': 'Notfall',
      'es': 'Emergencia',
      'fr': 'Urgence',
    },
    'jnz7a7nx': {
      'en': 'High',
      'de': 'Hoch',
      'es': 'Alto',
      'fr': 'Haut',
    },
    'oorxhq9x': {
      'en': 'Medium',
      'de': 'Mittel',
      'es': 'Medio',
      'fr': 'Moyen',
    },
    'na0320sa': {
      'en': 'Low',
      'de': 'Niedrig',
      'es': 'Bajo',
      'fr': 'Faible',
    },
  },
  // user_ListSmall
  {
    '2lghugn7': {
      'en': 'ME',
      'de': 'ICH',
      'es': 'YO',
      'fr': 'MOI',
    },
  },
  // user_List
  {
    'c7r5aq7h': {
      'en': 'Assign User',
      'de': 'Benutzer zuweisen',
      'es': 'Asignar usuario',
      'fr': 'Attribuer un utilisateur',
    },
    '1fert8cu': {
      'en': 'Select a user from the list below to continue.',
      'de':
          'Wählen Sie einen Benutzer aus der Liste unten aus, um fortzufahren.',
      'es': 'Seleccione un usuario de la lista a continuación para continuar.',
      'fr':
          'Sélectionnez un utilisateur dans la liste ci-dessous pour continuer.',
    },
    't9l5esbd': {
      'en': 'Close',
      'de': 'Schließen',
      'es': 'Cerca',
      'fr': 'Fermer',
    },
  },
  // chat_DetailsOverlay
  {
    'a0loq5a6': {
      'en': 'Group Chat ID: ',
      'de': 'Gruppenchat-ID:',
      'es': 'ID de chat grupal:',
      'fr': 'Identifiant de discussion de groupe :',
    },
    'hspne3ym': {
      'en': 'In this chat',
      'de': 'In diesem Chat',
      'es': 'en esta charla',
      'fr': 'Dans cette discussion',
    },
    '50akzqka': {
      'en': 'Close',
      'de': 'Schließen',
      'es': 'Cerca',
      'fr': 'Fermer',
    },
  },
  // chat_ThreadComponent
  {
    'gj24j4e2': {
      'en': 'Start typing here...',
      'de': 'Beginnen Sie hier mit der Eingabe ...',
      'es': 'Empieza a escribir aquí...',
      'fr': 'Commencez à taper ici...',
    },
    'ur37thf2': {
      'en': 'You must enter a message...',
      'de': 'Sie müssen eine Nachricht eingeben...',
      'es': 'Debes ingresar un mensaje...',
      'fr': 'Vous devez saisir un message...',
    },
    '907lm1aq': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // user_ListSmall_1
  {
    'fh4ei39y': {
      'en': 'ME',
      'de': 'ICH',
      'es': 'YO',
      'fr': 'MOI',
    },
  },
  // deleteDialog
  {
    '3q0utb1e': {
      'en': 'Options',
      'de': 'Optionen',
      'es': 'Opciones',
      'fr': 'Possibilités',
    },
    '73scs9a0': {
      'en': 'Invite Users',
      'de': 'Benutzer einladen',
      'es': 'Invitar usuarios',
      'fr': 'Inviter des utilisateurs',
    },
    'av9xz4qx': {
      'en': 'Delete Chat',
      'de': 'Chat löschen',
      'es': 'Eliminar chat',
      'fr': 'Supprimer le chat',
    },
    '41tv38n3': {
      'en': 'Confirm Delete',
      'de': 'Löschen bestätigen',
      'es': 'Confirmar eliminación',
      'fr': 'Confirmation de la suppression',
    },
    's2cbswob': {
      'en': 'You can\'t undo this action.',
      'de': 'Sie können diese Aktion nicht rückgängig machen.',
      'es': 'No puedes deshacer esta acción.',
      'fr': 'Vous ne pouvez pas annuler cette action.',
    },
    'z54qbopv': {
      'en': 'Delete',
      'de': 'Löschen',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
  },
  // Miscellaneous
  {
    'b7nmo9h5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xmayfjdy': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rreotz6t': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4hucjyt3': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pe8bwhny': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ayl7ml95': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'cj4pi052': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'p3lm87a3': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'hac7gowh': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'hq7117qt': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'iej24wiy': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4dk1neen': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'oymp1cmr': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tezxva0s': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '3fjb95pu': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ybkbd0h9': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tsufngwo': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '0uulr27y': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'lieon019': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'waotbjhx': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pbn6f25j': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '804gd7i9': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'j4z3yl1s': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '525aerw5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xm7jo5yr': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'guzgv3lj': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'vodnos5o': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fwchmphj': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
