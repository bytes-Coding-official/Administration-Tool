import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['de', 'en'];

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
    String? deText = '',
    String? enText = '',
  }) =>
      [deText, enText][languageIndex] ?? '';

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
  // Authentication
  {
    'fnkl9nxv': {
      'de': 'Gravity Administration',
      'en': '',
    },
    'ho0jokvx': {
      'de': 'Create Account',
      'en': '',
    },
    '2kggfqp3': {
      'de': 'Create Account',
      'en': '',
    },
    'tabjc6o9': {
      'de': 'Let\'s get started by filling out the form below.',
      'en': '',
    },
    'msl0vvs3': {
      'de': 'Email',
      'en': '',
    },
    'vz7v3sbc': {
      'de': 'Password',
      'en': '',
    },
    '3n99nl1c': {
      'de': 'Password',
      'en': '',
    },
    'tluuwlce': {
      'de': 'Get Started',
      'en': '',
    },
    't78gufcs': {
      'de': 'Or sign up with',
      'en': '',
    },
    'snuuspxp': {
      'de': 'Continue with Google',
      'en': '',
    },
    'uq3ff74n': {
      'de': 'Continue with Github',
      'en': '',
    },
    'rhkl6yxv': {
      'de': 'Log In',
      'en': '',
    },
    'cr1zpkrk': {
      'de': 'Welcome Back',
      'en': '',
    },
    '6u28aa3d': {
      'de': 'Fill out the information below in order to access your account.',
      'en': '',
    },
    '4y15t37i': {
      'de': 'Email',
      'en': '',
    },
    'mp5rpc43': {
      'de': 'Password',
      'en': '',
    },
    'kw1pakw1': {
      'de': 'Sign In',
      'en': '',
    },
    'c3abgfi3': {
      'de': 'Or sign in with',
      'en': '',
    },
    'e457f16g': {
      'de': 'Continue with Google',
      'en': '',
    },
    '05p03u8l': {
      'de': 'Continue with Apple',
      'en': '',
    },
    'prt4w2ga': {
      'de': 'Forgot Password?',
      'en': '',
    },
    '765yb2zd': {
      'de': 'Home',
      'en': '',
    },
  },
  // Profile
  {
    'uqu5csll': {
      'de': 'Account',
      'en': '',
    },
    'obaxqsrk': {
      'de': 'Timetable',
      'en': '',
    },
    'd20oaw05': {
      'de': 'Edit Profile',
      'en': '',
    },
    'fxy1jmw7': {
      'de': 'General',
      'en': '',
    },
    '1p8chce6': {
      'de': 'Logout',
      'en': '',
    },
    'kwyg0nyc': {
      'de': 'Terms of Service',
      'en': '',
    },
    'kxza41l3': {
      'de': 'Profile',
      'en': '',
    },
    's1i9h4b9': {
      'de': 'Home',
      'en': '',
    },
  },
  // ProfileSettings
  {
    'ripwkxbx': {
      'de': 'Complete Profile',
      'en': '',
    },
    '9fqt11ur': {
      'de': 'Your information',
      'en': '',
    },
    'xvmlg8yu': {
      'de': 'Your Name',
      'en': '',
    },
    '0bk2fxt7': {
      'de': 'Email',
      'en': '',
    },
    'yhne5pu7': {
      'de': 'Email',
      'en': '',
    },
    'soor353d': {
      'de': 'Phone',
      'en': '',
    },
    '79iw0yb3': {
      'de': 'Phone',
      'en': '',
    },
    'gyiikshj': {
      'de': 'Password',
      'en': '',
    },
    'qvnk2ruz': {
      'de': 'Password',
      'en': '',
    },
    'qic8hq3l': {
      'de': 'Change Adress',
      'en': '',
    },
    'kn9f5n0p': {
      'de': 'Change IT-Skills',
      'en': '',
    },
    'gfb94uh4': {
      'de': 'Change Languages',
      'en': '',
    },
    'c9pjt2by': {
      'de': 'Save Changes',
      'en': '',
    },
    'bzme900o': {
      'de': 'Home',
      'en': '',
    },
  },
  // Adress-Settings
  {
    'jlnldmnh': {
      'de': 'Complete Adress',
      'en': '',
    },
    'st4qpz84': {
      'de': 'Your information',
      'en': '',
    },
    '2oqvc2lc': {
      'de': 'Street and Number',
      'en': '',
    },
    'qnq3d7xm': {
      'de': 'Street',
      'en': '',
    },
    'eotg8j1f': {
      'de': 'Town',
      'en': '',
    },
    '4x4h5un1': {
      'de': 'Town',
      'en': '',
    },
    'vzfhr9w9': {
      'de': 'Zip',
      'en': '',
    },
    'pexa8nuc': {
      'de': 'Zip',
      'en': '',
    },
    '1lm3p2x9': {
      'de': 'Country',
      'en': '',
    },
    'nlo21lck': {
      'de': 'Country',
      'en': '',
    },
    'nfrkcmwc': {
      'de': 'Save Changes',
      'en': '',
    },
    'ohvtate0': {
      'de': 'Home',
      'en': '',
    },
  },
  // IT-Skills-Settings
  {
    '4em8h9gl': {
      'de': 'Complete IT-Skills',
      'en': '',
    },
    'iqb97wxp': {
      'de': 'Your IT-Skills',
      'en': '',
    },
    'qjwf369n': {
      'de': 'Home',
      'en': '',
    },
  },
  // Language-Settings
  {
    'vbw4hfm6': {
      'de': 'Complete Language Settings',
      'en': '',
    },
    'skc9rwus': {
      'de': 'Your Languages',
      'en': '',
    },
    'osdekkxt': {
      'de': 'Home',
      'en': '',
    },
  },
  // Customer
  {
    'qyg5rts9': {
      'de': 'Title...',
      'en': '',
    },
    'migz0exf': {
      'de':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
      'en': '',
    },
    'eha3lwhp': {
      'de': 'Name',
      'en': '',
    },
    'wt64dvtx': {
      'de': 'Mail',
      'en': '',
    },
    'tgm21eu4': {
      'de': 'Adress',
      'en': '',
    },
    'axtj90b9': {
      'de': 'Themes',
      'en': '',
    },
    'g1yaqs68': {
      'de': 'Languages',
      'en': '',
    },
    '25ri13hc': {
      'de': 'Revenue',
      'en': '',
    },
    'krqhv353': {
      'de': 'Hours',
      'en': '',
    },
    'n13sf1jv': {
      'de': 'Tutor',
      'en': '',
    },
    '62ehxcsa': {
      'de': 'ID:',
      'en': '',
    },
    '8ygcmc94': {
      'de': 'Home',
      'en': '',
    },
  },
  // Customers
  {
    'hzxm9f18': {
      'de': 'bytes Coding',
      'en': '',
    },
    '5dcz22gg': {
      'de': 'Platform Navigation',
      'en': '',
    },
    'tml29jty': {
      'de': 'Dashboard',
      'en': '',
    },
    'hjkywpp1': {
      'de': '12',
      'en': '',
    },
    'zk0e1z2t': {
      'de': 'Chats',
      'en': '',
    },
    '2bvioldg': {
      'de': '12',
      'en': '',
    },
    'z2x5lboo': {
      'de': 'Create Project',
      'en': '',
    },
    'rk90e529': {
      'de': 'Settings',
      'en': '',
    },
    'ifen802c': {
      'de': 'Billing',
      'en': '',
    },
    'k8t3ovqk': {
      'de': 'Members',
      'en': '',
    },
    'xtpzsf2b': {
      'de': 'Light Mode',
      'en': '',
    },
    'jopjv8qi': {
      'de': 'Dark Mode',
      'en': '',
    },
    '2rw5cdyd': {
      'de': 'Projects Overview',
      'en': '',
    },
    'glvznqhy': {
      'de': 'Review the details below of all current projects.',
      'en': '',
    },
    '4h5sn5jf': {
      'de': 'Add',
      'en': '',
    },
    '1qivza4a': {
      'de': 'Filters',
      'en': '',
    },
    'uxxu1zq6': {
      'de': 'Filter here...',
      'en': '',
    },
    '54ojwsmq': {
      'de': 'Filter here...',
      'en': '',
    },
    'e8tdlwf3': {
      'de': 'All',
      'en': '',
    },
    'dfuin8ot': {
      'de': 'Own Projects',
      'en': '',
    },
    '4gqpjoml': {
      'de': 'Others',
      'en': '',
    },
    'prxpz9q7': {
      'de': 'Closed',
      'en': '',
    },
    'j8sei0b2': {
      'de': 'All',
      'en': '',
    },
    'zuywtys3': {
      'de': 'Filter here...',
      'en': '',
    },
    'ozcdxd3f': {
      'de': 'Filter here...',
      'en': '',
    },
    'f7e4mtfu': {
      'de': 'ID#: ',
      'en': '',
    },
    '1905b1ks': {
      'de': 'ID#: ',
      'en': '',
    },
    'yze6pz6w': {
      'de': 'Home',
      'en': '',
    },
  },
  // Employees
  {
    'xrg0fp1k': {
      'de': 'Search for patients...',
      'en': '',
    },
    'y9l5y0r2': {
      'de': 'Patients matching search',
      'en': '',
    },
    '5w45opxu': {
      'de': '24',
      'en': '',
    },
    'tpowc0we': {
      'de': 'Randy Rudolph',
      'en': '',
    },
    'ldmdm6fs': {
      'de': '(123) 456-7890',
      'en': '',
    },
    '84bntqor': {
      'de': 'name@domain.com',
      'en': '',
    },
    'ajqg2pgg': {
      'de': 'Randie Mcmullens',
      'en': '',
    },
    'vj1arhx9': {
      'de': '(123) 456-7890',
      'en': '',
    },
    '7y52a5qy': {
      'de': 'name@domain.com',
      'en': '',
    },
    'eskpjx6s': {
      'de': 'Raney Bold',
      'en': '',
    },
    'msbw5uhr': {
      'de': '(123) 456-7890',
      'en': '',
    },
    'yy5ibrrk': {
      'de': 'name@domain.com',
      'en': '',
    },
    '6ii0iuq5': {
      'de': 'Ragina Smith',
      'en': '',
    },
    'f0coqdj5': {
      'de': '(123) 456-7890',
      'en': '',
    },
    'jkaqrey3': {
      'de': 'name@domain.com',
      'en': '',
    },
    '2gvu0zx3': {
      'de': 'Ra Kuo',
      'en': '',
    },
    'f023736l': {
      'de': '(123) 456-7890',
      'en': '',
    },
    'mam14bp1': {
      'de': 'name@domain.com',
      'en': '',
    },
    '8watn2fr': {
      'de': 'Raku Davis',
      'en': '',
    },
    'qo4of08f': {
      'de': '(123) 456-7890',
      'en': '',
    },
    'a4ybosim': {
      'de': 'name@domain.com',
      'en': '',
    },
    'trveb2nf': {
      'de': 'Search patients',
      'en': '',
    },
    'hf9u76zz': {
      'de': 'Home',
      'en': '',
    },
  },
  // CreateCase
  {
    'iqrsdxs5': {
      'de': 'Title...',
      'en': '',
    },
    '9ke520cp': {
      'de': 'Title...',
      'en': '',
    },
    'vhquvd2c': {
      'de': 'Description...',
      'en': '',
    },
    'tx2fqnwx': {
      'de': 'Name',
      'en': '',
    },
    '089n8s8q': {
      'de': 'Hello World',
      'en': '',
    },
    'qj46dz59': {
      'de': 'Themes',
      'en': '',
    },
    'tjdtg14u': {
      'de': 'Tops',
      'en': '',
    },
    'f94dkstp': {
      'de': 'Bottoms',
      'en': '',
    },
    'x33w3gyx': {
      'de': 'Outerwear',
      'en': '',
    },
    'cej8m009': {
      'de': 'Jewelry',
      'en': '',
    },
    'ot8r8vne': {
      'de': 'Accessories',
      'en': '',
    },
    'ircrqxrt': {
      'de': 'Hats',
      'en': '',
    },
    'a6xv382d': {
      'de': 'Shoes',
      'en': '',
    },
    '1utnfn3e': {
      'de': 'Languages',
      'en': '',
    },
    'js6wh9sw': {
      'de': 'Tops',
      'en': '',
    },
    'ugu5kd9w': {
      'de': 'Bottoms',
      'en': '',
    },
    'pvujdu8w': {
      'de': 'Outerwear',
      'en': '',
    },
    '8k3yhasm': {
      'de': 'Jewelry',
      'en': '',
    },
    'curbqob2': {
      'de': 'Accessories',
      'en': '',
    },
    '2q8jgkqf': {
      'de': 'Hats',
      'en': '',
    },
    'qayclep4': {
      'de': 'Shoes',
      'en': '',
    },
    'q8qllymp': {
      'de': 'Revenue',
      'en': '',
    },
    'p5pr0j42': {
      'de': '\$50.00',
      'en': '',
    },
    '7x7wvbt2': {
      'de': 'Active',
      'en': '',
    },
    '95wxc4pw': {
      'de': 'Claim Customer',
      'en': '',
    },
    'hju0o2ac': {
      'de': 'Hours',
      'en': '',
    },
    '1hfol1ya': {
      'de': 'Tutor',
      'en': '',
    },
    '8k9rojnc': {
      'de': 'ID:',
      'en': '',
    },
    'wegkpkxz': {
      'de': 'ID:',
      'en': '',
    },
    '19mp5eus': {
      'de': 'Current Case',
      'en': '',
    },
    '083tfgc1': {
      'de': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'b7nmo9h5': {
      'de': '',
      'en': '',
    },
    'xmayfjdy': {
      'de': '',
      'en': '',
    },
    '4hucjyt3': {
      'de': '',
      'en': '',
    },
    'pe8bwhny': {
      'de': '',
      'en': '',
    },
    'ayl7ml95': {
      'de': '',
      'en': '',
    },
    'cj4pi052': {
      'de': '',
      'en': '',
    },
    'p3lm87a3': {
      'de': '',
      'en': '',
    },
    'hac7gowh': {
      'de': '',
      'en': '',
    },
    'hq7117qt': {
      'de': '',
      'en': '',
    },
    'iej24wiy': {
      'de': '',
      'en': '',
    },
    '4dk1neen': {
      'de': '',
      'en': '',
    },
    'oymp1cmr': {
      'de': '',
      'en': '',
    },
    'tezxva0s': {
      'de': '',
      'en': '',
    },
    '3fjb95pu': {
      'de': '',
      'en': '',
    },
    'ybkbd0h9': {
      'de': '',
      'en': '',
    },
    'tsufngwo': {
      'de': '',
      'en': '',
    },
    '0uulr27y': {
      'de': '',
      'en': '',
    },
    'lieon019': {
      'de': '',
      'en': '',
    },
    'waotbjhx': {
      'de': '',
      'en': '',
    },
    'pbn6f25j': {
      'de': '',
      'en': '',
    },
    '804gd7i9': {
      'de': '',
      'en': '',
    },
    'j4z3yl1s': {
      'de': '',
      'en': '',
    },
    '525aerw5': {
      'de': '',
      'en': '',
    },
    'xm7jo5yr': {
      'de': '',
      'en': '',
    },
    'guzgv3lj': {
      'de': '',
      'en': '',
    },
    'vodnos5o': {
      'de': '',
      'en': '',
    },
    'fwchmphj': {
      'de': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
