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
  // HomePage
  {
    'm514q8so': {
      'de': 'Page Title',
      'en': '',
    },
    '0v62fwsh': {
      'de': 'Home',
      'en': '',
    },
  },
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
      'de': 'Continue with Apple',
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
    '37c905vg': {
      'de': 'Country',
      'en': '',
    },
    '44os3vxa': {
      'de': 'Notification Settings',
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
      'de': 'Support',
      'en': '',
    },
    'kwyg0nyc': {
      'de': 'Terms of Service',
      'en': '',
    },
    'qz690jdk': {
      'de': 'Invite Collegues',
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
    'eotg8j1f': {
      'de': 'Town',
      'en': '',
    },
    '4x4h5un1': {
      'de': 'Email',
      'en': '',
    },
    'vzfhr9w9': {
      'de': 'Zip',
      'en': '',
    },
    'pexa8nuc': {
      'de': 'Phone',
      'en': '',
    },
    '1lm3p2x9': {
      'de': 'Country',
      'en': '',
    },
    'nlo21lck': {
      'de': 'Phone',
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
    '0juprkks': {
      'de': 'Save Changes',
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
    '5nfihc9y': {
      'de': 'Save Changes',
      'en': '',
    },
    'osdekkxt': {
      'de': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
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
