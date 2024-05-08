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
    '61fgwpm7': {
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
    '2ocbfjlu': {
      'de': 'Title...',
      'en': '',
    },
    'aajxmq64': {
      'de':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
      'en': '',
    },
    'zoky65cv': {
      'de': 'Name',
      'en': '',
    },
    'e7pptfw3': {
      'de': 'Mail',
      'en': '',
    },
    'zuo79meh': {
      'de': 'Adress',
      'en': '',
    },
    'hm1mdep4': {
      'de': 'Themes',
      'en': '',
    },
    '5by36n0f': {
      'de': 'Languages',
      'en': '',
    },
    '1orw18k3': {
      'de': 'Revenue',
      'en': '',
    },
    '4t8xqign': {
      'de': 'Claim Case',
      'en': '',
    },
    'gy7e31nj': {
      'de': 'Remove From Case',
      'en': '',
    },
    '8okubqr7': {
      'de': 'Hours',
      'en': '',
    },
    't85p1c33': {
      'de': 'Tutor',
      'en': '',
    },
    'e1jwqeb7': {
      'de': 'ID:',
      'en': '',
    },
    'ld5qx0de': {
      'de': 'Home',
      'en': '',
    },
  },
  // Customers
  {
    'zqwo0dd7': {
      'de': 'bytes Coding',
      'en': '',
    },
    'esd39a7g': {
      'de': 'Platform Navigation',
      'en': '',
    },
    'psigi6xv': {
      'de': 'Dashboard',
      'en': '',
    },
    'r8d3kqyy': {
      'de': '12',
      'en': '',
    },
    'hxcz1jc2': {
      'de': 'Chats',
      'en': '',
    },
    'l0k9ix61': {
      'de': '12',
      'en': '',
    },
    'e8jrr9q8': {
      'de': 'Support Tickets',
      'en': '',
    },
    'lqrw1yo4': {
      'de': '12',
      'en': '',
    },
    'yqwk5rl1': {
      'de': 'Calendar',
      'en': '',
    },
    'sjcq2pi2': {
      'de': 'Settings',
      'en': '',
    },
    'c0ayt1nh': {
      'de': 'Billing',
      'en': '',
    },
    'k0goh3x6': {
      'de': 'Members',
      'en': '',
    },
    'gc74imeq': {
      'de': 'Light Mode',
      'en': '',
    },
    'xkgmf9zq': {
      'de': 'Dark Mode',
      'en': '',
    },
    'phwjo5xq': {
      'de': 'Projects Overview',
      'en': '',
    },
    'bgi47c1l': {
      'de': 'Review the details below of all current projects.',
      'en': '',
    },
    'q3yd9c6w': {
      'de': 'Add',
      'en': '',
    },
    'sphwk62r': {
      'de': 'Filters',
      'en': '',
    },
    'rhek6d4j': {
      'de': 'Filter here...',
      'en': '',
    },
    'a1zt5rvf': {
      'de': 'Filter here...',
      'en': '',
    },
    'apwtdsiq': {
      'de': 'All',
      'en': '',
    },
    '4x13kefg': {
      'de': 'Own Projects',
      'en': '',
    },
    'mb94ajo3': {
      'de': 'Others',
      'en': '',
    },
    'vt6ohljs': {
      'de': 'Closed',
      'en': '',
    },
    '30m9wopn': {
      'de': 'All',
      'en': '',
    },
    'xbcdougq': {
      'de': 'Filter here...',
      'en': '',
    },
    'dxw866zo': {
      'de': 'Filter here...',
      'en': '',
    },
    'h6it9ajd': {
      'de': 'ID#: ',
      'en': '',
    },
    'rk1pftl5': {
      'de': 'ID#: ',
      'en': '',
    },
    '7bggovi0': {
      'de': 'Home',
      'en': '',
    },
  },
  // Employees
  {
    'oitchqzi': {
      'de': 'Search for patients...',
      'en': '',
    },
    'jdtid1h4': {
      'de': 'Users matching search',
      'en': '',
    },
    'xi6lsjxk': {
      'de': '24',
      'en': '',
    },
    'a89yjpln': {
      'de': 'Our Team-Members',
      'en': '',
    },
    '5p3v0m4k': {
      'de': 'Home',
      'en': '',
    },
  },
  // CreateCase
  {
    'yum0goyu': {
      'de': 'Title...',
      'en': '',
    },
    '0futkmof': {
      'de': 'Title...',
      'en': '',
    },
    'sn5ieevs': {
      'de': 'Description...',
      'en': '',
    },
    'qxm3fyf5': {
      'de': 'Option 1',
      'en': '',
    },
    'szpwo165': {
      'de': 'Customer Name',
      'en': '',
    },
    'v7plhg0s': {
      'de': 'Search for an item...',
      'en': '',
    },
    'yr01hol0': {
      'de': 'Themes',
      'en': '',
    },
    'td2ccaoc': {
      'de': 'Tops',
      'en': '',
    },
    'lv5wv85i': {
      'de': 'Bottoms',
      'en': '',
    },
    'ic7843p4': {
      'de': 'Outerwear',
      'en': '',
    },
    'ubvxeoe2': {
      'de': 'Jewelry',
      'en': '',
    },
    'it126slb': {
      'de': 'Accessories',
      'en': '',
    },
    'f9icxw38': {
      'de': 'Hats',
      'en': '',
    },
    'bzarioym': {
      'de': 'Shoes',
      'en': '',
    },
    'fpj6ym4v': {
      'de': 'Languages',
      'en': '',
    },
    'lop6o23k': {
      'de': 'Tops',
      'en': '',
    },
    'kdcezire': {
      'de': 'Bottoms',
      'en': '',
    },
    '8qt1rbpe': {
      'de': 'Outerwear',
      'en': '',
    },
    'd3loqrqz': {
      'de': 'Jewelry',
      'en': '',
    },
    'bnsrwgth': {
      'de': 'Accessories',
      'en': '',
    },
    '7w584kej': {
      'de': 'Hats',
      'en': '',
    },
    'uprtdynr': {
      'de': 'Shoes',
      'en': '',
    },
    'hbxggzge': {
      'de': 'Revenue',
      'en': '',
    },
    '15uo150c': {
      'de': '\$50.00',
      'en': '',
    },
    'n6dvlpwe': {
      'de': 'Add Case',
      'en': '',
    },
    'itkl3s28': {
      'de': 'ID:',
      'en': '',
    },
    'l3cxbukz': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_Create
  {
    '6n418bnp': {
      'de': 'flow.io',
      'en': '',
    },
    '2yjwqo8g': {
      'de': 'Get Started',
      'en': '',
    },
    'ac6qy2gi': {
      'de': 'Create an account by using the form below.',
      'en': '',
    },
    '5k2pip8v': {
      'de': 'Email',
      'en': '',
    },
    '0j6aq2uv': {
      'de': 'Password',
      'en': '',
    },
    'r63zssnl': {
      'de': 'Create Account',
      'en': '',
    },
    'gnjjbz2r': {
      'de': 'Or sign up with',
      'en': '',
    },
    'q0hcm3f4': {
      'de': 'Continue with Google',
      'en': '',
    },
    'iruoh91b': {
      'de': 'Continue with Apple',
      'en': '',
    },
    'weopfjnz': {
      'de': 'Already have an account? ',
      'en': '',
    },
    'rb2zcnqj': {
      'de': 'Sign in here',
      'en': '',
    },
    'sauzmy7r': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_Login
  {
    'q0fsxzm0': {
      'de': 'flow.io',
      'en': '',
    },
    'uzd52rew': {
      'de': 'Welcome Back',
      'en': '',
    },
    'fhmtz06t': {
      'de': 'Fill out the information below in order to access your account.',
      'en': '',
    },
    '521io5z7': {
      'de': 'Email',
      'en': '',
    },
    'rvjwy9hf': {
      'de': 'Password',
      'en': '',
    },
    '7s7u7cio': {
      'de': 'Sign In',
      'en': '',
    },
    'eiuumfyd': {
      'de': 'Or sign in with',
      'en': '',
    },
    'krmr3dq1': {
      'de': 'Continue with Google',
      'en': '',
    },
    'phyy4jez': {
      'de': 'Continue with Apple',
      'en': '',
    },
    '13iifah5': {
      'de': 'Don\'t have an account?  ',
      'en': '',
    },
    'sli3162u': {
      'de': 'Create Account',
      'en': '',
    },
    'qnek1332': {
      'de': 'Forgot password?',
      'en': '',
    },
    'x5uzyw3v': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_ForgotPassword
  {
    'htxvbys4': {
      'de': 'flow.io',
      'en': '',
    },
    'xfhm9acx': {
      'de': 'Forgot Password',
      'en': '',
    },
    'c0vj5c7t': {
      'de':
          'Please fill out your email belo in order to recieve a reset password link.',
      'en': '',
    },
    'zrqe42ho': {
      'de': 'Email',
      'en': '',
    },
    'wb31fe17': {
      'de': 'Send Reset Link',
      'en': '',
    },
    'z9dcgfkq': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_createProfile
  {
    'hbab0oa4': {
      'de': 'flow.io',
      'en': '',
    },
    'jy4o2t2o': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_Profile
  {
    'fuly3wvy': {
      'de': 'Your Account',
      'en': '',
    },
    '7kmtotah': {
      'de': 'Edit Profile',
      'en': '',
    },
    '5l6voay2': {
      'de': 'Edit Adress',
      'en': '',
    },
    'douzf5oo': {
      'de': 'Edit Languages',
      'en': '',
    },
    'ugwcgkhb': {
      'de': 'Edit IT-Skills',
      'en': '',
    },
    'mp5x1zrt': {
      'de': 'App Settings',
      'en': '',
    },
    '327g1hyy': {
      'de': 'Support',
      'en': '',
    },
    'peqeskan': {
      'de': 'Terms of Service',
      'en': '',
    },
    '1igniz2j': {
      'de': 'Log Out',
      'en': '',
    },
    'itj2r1tk': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_EditProfile
  {
    'nh0ufuee': {
      'de': 'Home',
      'en': '',
    },
  },
  // support_TicketList
  {
    'y1cphusm': {
      'de': 'Below are a list of recent tickets created',
      'en': '',
    },
    'jn2h1hyf': {
      'de': 'Ticket #: ',
      'en': '',
    },
    'uc1usyqa': {
      'de': 'Support Tickets',
      'en': '',
    },
    '19b4l2eb': {
      'de': 'Home',
      'en': '',
    },
  },
  // support_SubmitTicket
  {
    'yhztxyu8': {
      'de': 'Create a Ticket',
      'en': '',
    },
    'vj2kin4a': {
      'de': 'Fill out the form below to submit a ticket.',
      'en': '',
    },
    '8a83o12g': {
      'de': 'Call Us',
      'en': '',
    },
    'txl8rzat': {
      'de': 'Email Us',
      'en': '',
    },
    'ricp38cm': {
      'de': 'What is going on?',
      'en': '',
    },
    '0l26gje2': {
      'de': 'Short Description of what is going on...',
      'en': '',
    },
    'eyq6jort': {
      'de': 'Choose a priority level',
      'en': '',
    },
    'nj4gxq7y': {
      'de': 'Emergency',
      'en': '',
    },
    'nxn0qt7g': {
      'de': 'High',
      'en': '',
    },
    '36ar5gt0': {
      'de': 'Medium',
      'en': '',
    },
    'xbub19mw': {
      'de': 'Low',
      'en': '',
    },
    'udk6s772': {
      'de': 'Low',
      'en': '',
    },
    'ngxigtui': {
      'de': 'Upload Screenshot',
      'en': '',
    },
    '9furp0rw': {
      'de': 'Assign User',
      'en': '',
    },
    'zdl3izxa': {
      'de': 'Add User',
      'en': '',
    },
    '0sjmvj9o': {
      'de': 'Submit Ticket',
      'en': '',
    },
    '9wh28y2u': {
      'de': 'Home',
      'en': '',
    },
  },
  // support_TicketDetails
  {
    'n7i4xuvy': {
      'de': 'Ticket Details',
      'en': '',
    },
    'aaa8gjph': {
      'de': 'Ticket #: ',
      'en': '',
    },
    'sgn8hh6c': {
      'de': 'Below are the details of this support ticket.',
      'en': '',
    },
    'vxgf4rp2': {
      'de': 'Description',
      'en': '',
    },
    '47dgq5a3': {
      'de': 'Submitted on',
      'en': '',
    },
    '9i7ujk20': {
      'de': 'Last Edited',
      'en': '',
    },
    'trxtjtsw': {
      'de': 'Status',
      'en': '',
    },
    '173cgq1c': {
      'de': 'Pending',
      'en': '',
    },
    '8ew7tviv': {
      'de': 'In Progress',
      'en': '',
    },
    'u06jy42q': {
      'de': 'Complete',
      'en': '',
    },
    'l0j8onis': {
      'de': 'Submitted',
      'en': '',
    },
    'v3ywnmpi': {
      'de': 'Please select...',
      'en': '',
    },
    '2wam3gac': {
      'de': 'Search for an item...',
      'en': '',
    },
    'ls2xotzx': {
      'de': 'Assigned to',
      'en': '',
    },
    '7522lg0r': {
      'de': 'Submitted By',
      'en': '',
    },
    '190ycife': {
      'de': 'Assign',
      'en': '',
    },
    '5o57gj4w': {
      'de': 'Update Ticket',
      'en': '',
    },
  },
  // Billing
  {
    'qg7r9z4t': {
      'de': 'Below is a summary of your activity.',
      'en': '',
    },
    '98trd057': {
      'de': '16',
      'en': '',
    },
    'jiq94s7n': {
      'de': 'Total Customers',
      'en': '',
    },
    '9ivafdyy': {
      'de': '16',
      'en': '',
    },
    '1mnn70y3': {
      'de': 'Average Billing',
      'en': '',
    },
    'n8paaju7': {
      'de': '16',
      'en': '',
    },
    'ua1sbi37': {
      'de': 'Money Earned',
      'en': '',
    },
    'md5xu1oi': {
      'de': 'Current Route',
      'en': '',
    },
    '6ru0pmlz': {
      'de': 'An overview of your route.',
      'en': '',
    },
    'p0nmmn3j': {
      'de': '15/26',
      'en': '',
    },
    's5x8veyc': {
      'de': 'Route progress',
      'en': '',
    },
    'lj3545ej': {
      'de': '12',
      'en': '',
    },
    '2q3c1uge': {
      'de': 'Tasks to be completed',
      'en': '',
    },
    'ggsyxcez': {
      'de': 'Current Customer-Cases',
      'en': '',
    },
    '27wzltln': {
      'de': 'A summary of your current customer-cases',
      'en': '',
    },
    '850spocz': {
      'de': 'ID#: ',
      'en': '',
    },
    '7e2oj4so': {
      'de': 'Own',
      'en': '',
    },
    '8cv8i4lg': {
      'de': 'Recent Activity',
      'en': '',
    },
    'xt5fq7mw': {
      'de': 'Below is an overview of tasks & activity completed.',
      'en': '',
    },
    '13eujvui': {
      'de': 'Tasks',
      'en': '',
    },
    'oakiikua': {
      'de': 'Completed',
      'en': '',
    },
    'j7k9m0ql': {
      'de': 'Launches',
      'en': '',
    },
    'yonunvvv': {
      'de': 'Last 30 Days',
      'en': '',
    },
    'oave3sqv': {
      'de': 'Avg. Grade',
      'en': '',
    },
    '88fk6sq3': {
      'de': 'Dashboard',
      'en': '',
    },
    '1byh2jsg': {
      'de': 'Home',
      'en': '',
    },
  },
  // Calendar
  {
    't2t7iuf2': {
      'de': 'Month',
      'en': '',
    },
    'atq81cto': {
      'de': 'Coming Up',
      'en': '',
    },
    'j9mxsc2w': {
      'de': 'Doctors Check In',
      'en': '',
    },
    'eauurlye': {
      'de': '2:20pm',
      'en': '',
    },
    'yrps7a6e': {
      'de': 'Wed, 03/08/2022',
      'en': '',
    },
    'a5zd8pl4': {
      'de': 'Past Due',
      'en': '',
    },
    '4kitvb1v': {
      'de': 'Check In',
      'en': '',
    },
    'l6fu6w2c': {
      'de': '2:20pm',
      'en': '',
    },
    'xhtouap1': {
      'de': 'Wed, 03/08/2022',
      'en': '',
    },
    'ycmg00wr': {
      'de': 'Week',
      'en': '',
    },
    'nqt7n1vb': {
      'de': 'Coming Up',
      'en': '',
    },
    '4e770o8r': {
      'de': 'Doctors Check In',
      'en': '',
    },
    '62ypd83p': {
      'de': '2:20pm',
      'en': '',
    },
    'j5667s2s': {
      'de': 'Wed, 03/08/2022',
      'en': '',
    },
    'uxyau7v6': {
      'de': 'Past Due',
      'en': '',
    },
    'gmrcf2gj': {
      'de': 'Check In',
      'en': '',
    },
    '2mxgm047': {
      'de': '2:20pm',
      'en': '',
    },
    's2wv07wh': {
      'de': 'Wed, 03/08/2022',
      'en': '',
    },
    '5zbykyxp': {
      'de': 'Your Calender',
      'en': '',
    },
    '6dtqlh1d': {
      'de': 'Home',
      'en': '',
    },
  },
  // chat_2_Details
  {
    'xp6rsyeo': {
      'de': 'Group Chat',
      'en': '',
    },
    'f56hjqgo': {
      'de': 'Home',
      'en': '',
    },
  },
  // chat_2_main
  {
    '4jhf6wsl': {
      'de': 'Below are your chats and group chats',
      'en': '',
    },
    '74g4kc50': {
      'de': 'Add Chat',
      'en': '',
    },
    'rhcw9ekk': {
      'de': 'Group Chat',
      'en': '',
    },
    'e7fx6lvc': {
      'de': 'My Chats',
      'en': '',
    },
    'qu8p3z23': {
      'de': '__',
      'en': '',
    },
  },
  // chat_2_InviteUsers
  {
    '8i8knm80': {
      'de': 'Invite Friends',
      'en': '',
    },
    'w0uljm33': {
      'de': 'Selected',
      'en': '',
    },
    '3la16lry': {
      'de': 'Invite Friends',
      'en': '',
    },
    'ghgaw8z2': {
      'de': 'Select users from below to start a chat.',
      'en': '',
    },
    '51wadp85': {
      'de': 'Home',
      'en': '',
    },
  },
  // image_Details
  {
    '333yw0i9': {
      'de': 'Home',
      'en': '',
    },
  },
  // editProfile_auth_2
  {
    'o0a4x7xt': {
      'de': 'Adjust the content below to update your profile.',
      'en': '',
    },
    'tama5wuy': {
      'de': 'Change Photo',
      'en': '',
    },
    'p1q6p9gx': {
      'de': 'Full Name',
      'en': '',
    },
    'z3y8xvd7': {
      'de': 'Your full name...',
      'en': '',
    },
    '6x72ltl3': {
      'de': 'Owner/Founder',
      'en': '',
    },
    'zlz2iu8t': {
      'de': 'Director',
      'en': '',
    },
    'aexke9an': {
      'de': 'Manager',
      'en': '',
    },
    '0s6428wk': {
      'de': 'Mid-Manager',
      'en': '',
    },
    '1x9s91rw': {
      'de': 'Employee',
      'en': '',
    },
    'imthgpev': {
      'de': 'Your Role',
      'en': '',
    },
    'jfcys0av': {
      'de': 'Search for an item...',
      'en': '',
    },
    'qd33kojz': {
      'de': 'Short Description',
      'en': '',
    },
    'mv5hcw0x': {
      'de': 'A little about you...',
      'en': '',
    },
  },
  // setPriority_Menu
  {
    '7gx4gxjo': {
      'de': 'Set Priority Level',
      'en': '',
    },
    'nrnuw7yh': {
      'de': 'Emergency',
      'en': '',
    },
    'houi4n5x': {
      'de': 'High',
      'en': '',
    },
    'nlrhd594': {
      'de': 'Medium',
      'en': '',
    },
    'kioearxv': {
      'de': 'Low',
      'en': '',
    },
  },
  // user_ListSmall
  {
    'fh4ei39y': {
      'de': 'ME',
      'en': '',
    },
  },
  // user_List
  {
    'mxdlcfad': {
      'de': 'Assign User',
      'en': '',
    },
    '530qmefy': {
      'de': 'Select a user from the list below to continue.',
      'en': '',
    },
    'o1uyt24f': {
      'de': 'Close',
      'en': '',
    },
  },
  // chat_DetailsOverlay
  {
    'wm58eznh': {
      'de': 'Group Chat ID: ',
      'en': '',
    },
    'a3ymb64w': {
      'de': 'In this chat',
      'en': '',
    },
    'hsmpjhl5': {
      'de': 'Close',
      'en': '',
    },
  },
  // chat_ThreadComponent
  {
    'ktn9eiyc': {
      'de': 'Start typing here...',
      'en': '',
    },
    'ch6pg2gx': {
      'de': 'You must enter a message...',
      'en': '',
    },
    'lj4iyozs': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // user_ListSmall_1
  {
    'l6ejmsde': {
      'de': 'ME',
      'en': '',
    },
  },
  // deleteDialog
  {
    '1l6xo6oa': {
      'de': 'Options',
      'en': '',
    },
    '36sm2ra1': {
      'de': 'Invite Users',
      'en': '',
    },
    'm20qoxrt': {
      'de': 'Delete Chat',
      'en': '',
    },
    'md3y1khs': {
      'de': 'Confirm Delete',
      'en': '',
    },
    'yy4ty6kq': {
      'de': 'You can\'t undo this action.',
      'en': '',
    },
    'd2yt76l7': {
      'de': 'Delete',
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
