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
    'nwmcg0k4': {
      'de': 'Complete your Profile-Settings',
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
    '4ndy7tw1': {
      'de': 'Complete Adress',
      'en': '',
    },
    'e38kgxol': {
      'de': 'Complete your adress information',
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
    'je1wgwap': {
      'de': 'Complete your IT-Skills',
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
    'z0f4qgea': {
      'de': 'Complete Languages',
      'en': '',
    },
    'z16bbiuc': {
      'de': 'Complete your languages',
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
    '4hxa3yz1': {
      'de': 'Add meeting to user',
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
    'q3yd9c6w': {
      'de': 'Add Customer',
      'en': '',
    },
    'hhyl29jb': {
      'de': 'Add Case',
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
    'yr01hol0': {
      'de': 'Themes',
      'en': '',
    },
    'nj7jldg9': {
      'de': 'Option 1',
      'en': '',
    },
    '4p7p7c12': {
      'de': 'Topics',
      'en': '',
    },
    'h2xc900z': {
      'de': 'Search for an item...',
      'en': '',
    },
    'fpj6ym4v': {
      'de': 'Customer',
      'en': '',
    },
    'xf9ydg3j': {
      'de': 'Option 1',
      'en': '',
    },
    'z25h7e01': {
      'de': 'Customer Name',
      'en': '',
    },
    'h13kg7qr': {
      'de': 'Search for an item...',
      'en': '',
    },
    'hbxggzge': {
      'de': 'Revenue',
      'en': '',
    },
    '15uo150c': {
      'de': 'Price per hour',
      'en': '',
    },
    'l9wsq9un': {
      'de': '50',
      'en': '',
    },
    'n6dvlpwe': {
      'de': 'Add Case',
      'en': '',
    },
    'akuvxsis': {
      'de': 'Create Case',
      'en': '',
    },
    'q8cpu5z1': {
      'de': 'Create a new case with this form',
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
      'de': 'bytes Coding GmbH',
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
      'de': 'bytes Coding GmbH',
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
      'de': 'bytes Coding GmbH',
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
      'de': 'bytes Coding GmbH',
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
    'msd7orz7': {
      'de': 'Create a Ticket',
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
    'zjlnvley': {
      'de': 'Below is a summary of your activity.',
      'en': '',
    },
    '8i06a33i': {
      'de': '16',
      'en': '',
    },
    'q052w4ks': {
      'de': 'Total Customers',
      'en': '',
    },
    '09047uef': {
      'de': '16',
      'en': '',
    },
    'v8r4lbgu': {
      'de': 'Average Billing',
      'en': '',
    },
    'zqnhft9d': {
      'de': '16',
      'en': '',
    },
    'erv5taj4': {
      'de': 'Money Earned',
      'en': '',
    },
    '7r9fetyx': {
      'de': 'Current Route',
      'en': '',
    },
    '2a6qa21y': {
      'de': 'An overview of your route.',
      'en': '',
    },
    '7555kkz0': {
      'de': '15/26',
      'en': '',
    },
    'l7ujfjr3': {
      'de': 'Route progress',
      'en': '',
    },
    'zh2k5qza': {
      'de': '12',
      'en': '',
    },
    'b7abegxd': {
      'de': 'Tasks to be completed',
      'en': '',
    },
    '4lyb5w7t': {
      'de': 'Current Customer-Cases',
      'en': '',
    },
    'gcjeqtnc': {
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
    'tbl1a9zo': {
      'de': 'Recent Activity',
      'en': '',
    },
    'lt3eh3lg': {
      'de': 'Below is an overview of tasks & activity completed.',
      'en': '',
    },
    'o9pxfyek': {
      'de': 'Tasks',
      'en': '',
    },
    'k004vzd6': {
      'de': 'Completed',
      'en': '',
    },
    'qffzuink': {
      'de': 'Launches',
      'en': '',
    },
    'n5enl3o2': {
      'de': 'Last 30 Days',
      'en': '',
    },
    'wz1he5cw': {
      'de': 'Avg. Grade',
      'en': '',
    },
    '15s2dq8x': {
      'de': 'Dashboard',
      'en': '',
    },
    'yfmi94wv': {
      'de': 'Home',
      'en': '',
    },
  },
  // Calendar
  {
    'xu9q5cio': {
      'de': 'Month',
      'en': '',
    },
    'wxps8tuv': {
      'de': 'Coming Up',
      'en': '',
    },
    '5ccmynim': {
      'de': 'Doctors Check In',
      'en': '',
    },
    'sw4pw48g': {
      'de': '2:20pm',
      'en': '',
    },
    'wdev5dhi': {
      'de': 'Wed, 03/08/2022',
      'en': '',
    },
    'jgxhfbhe': {
      'de': 'Past Due',
      'en': '',
    },
    'jmtgnyoh': {
      'de': 'Check In',
      'en': '',
    },
    'vh23bftg': {
      'de': '2:20pm',
      'en': '',
    },
    '2577pbkf': {
      'de': 'Wed, 03/08/2022',
      'en': '',
    },
    'j2njabrk': {
      'de': 'Week',
      'en': '',
    },
    'ns7nx344': {
      'de': 'Coming Up',
      'en': '',
    },
    'yu7jdcag': {
      'de': 'Doctors Check In',
      'en': '',
    },
    'k35kg3t8': {
      'de': '2:20pm',
      'en': '',
    },
    'z02qprzb': {
      'de': 'Wed, 03/08/2022',
      'en': '',
    },
    '13kr3qsc': {
      'de': 'Past Due',
      'en': '',
    },
    '6xiv0o9j': {
      'de': 'Check In',
      'en': '',
    },
    '7egp6ak9': {
      'de': '2:20pm',
      'en': '',
    },
    '2gzae0et': {
      'de': 'Wed, 03/08/2022',
      'en': '',
    },
    '5zbykyxp': {
      'de': 'Your Calender',
      'en': '',
    },
    'dr5994wq': {
      'de': 'Home',
      'en': '',
    },
  },
  // chat_2_Details
  {
    '7txc8mi4': {
      'de': 'Group Chat',
      'en': '',
    },
    '5ej9zapx': {
      'de': 'Home',
      'en': '',
    },
  },
  // chat_2_main
  {
    'tpy6ziya': {
      'de': 'Below are your chats and group chats',
      'en': '',
    },
    '4wmr0r8x': {
      'de': 'Add Chat',
      'en': '',
    },
    'pk6vja86': {
      'de': 'Group Chat',
      'en': '',
    },
    'h9lmzpdm': {
      'de': 'My Chats',
      'en': '',
    },
    'ka2wrnvr': {
      'de': '__',
      'en': '',
    },
  },
  // chat_2_InviteUsers
  {
    '7mh427w4': {
      'de': 'Invite Friends',
      'en': '',
    },
    'rrcmh2eo': {
      'de': 'Selected',
      'en': '',
    },
    'v2t6kg15': {
      'de': 'Invite Friends',
      'en': '',
    },
    'hztshrjj': {
      'de': 'Select users from below to start a chat.',
      'en': '',
    },
    'pi0dfjv1': {
      'de': 'Home',
      'en': '',
    },
  },
  // image_Details
  {
    '365ngbkk': {
      'de': 'Home',
      'en': '',
    },
  },
  // createCustomer
  {
    '6nvy4qzi': {
      'de': 'Full name',
      'en': '',
    },
    'rij8io9s': {
      'de': 'Name',
      'en': '',
    },
    'o2sem55m': {
      'de': 'Phone number',
      'en': '',
    },
    's0aksne6': {
      'de': 'Phone Number',
      'en': '',
    },
    'cu1rz8hq': {
      'de': 'E-Mail',
      'en': '',
    },
    'vdzc35iz': {
      'de': 'E-Mail',
      'en': '',
    },
    'dz8s1veo': {
      'de': 'Street',
      'en': '',
    },
    '4kvp5cnu': {
      'de': 'Street',
      'en': '',
    },
    'vl5t2xru': {
      'de': 'City',
      'en': '',
    },
    '8m7j9wso': {
      'de': 'City',
      'en': '',
    },
    'as64pn2v': {
      'de': 'Zip',
      'en': '',
    },
    'sqb1k3ec': {
      'de': 'Zip',
      'en': '',
    },
    'naeu1u2u': {
      'de': 'Country',
      'en': '',
    },
    's6h1wnxo': {
      'de': 'Country',
      'en': '',
    },
    'plywg53q': {
      'de': 'Languages',
      'en': '',
    },
    'nh1r0238': {
      'de': 'Option 1',
      'en': '',
    },
    'xwrgxre7': {
      'de': 'Customer Languages',
      'en': '',
    },
    'v7plhg0s': {
      'de': 'Search for an item...',
      'en': '',
    },
    'offuqx3a': {
      'de': 'Add Customer',
      'en': '',
    },
    'cgezdoty': {
      'de': 'Please enter the patients full name.',
      'en': '',
    },
    '907lm1aq': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '9pssjjc2': {
      'de': 'Please enter an age for the patient.',
      'en': '',
    },
    'xe22w63f': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '64q2zitj': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1vh4b221': {
      'de': 'Please enter the date of birth of the patient.',
      'en': '',
    },
    'c52m76pd': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'uh9k52fb': {
      'de': 'Field is required',
      'en': '',
    },
    'xropqng0': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '6lhoujzg': {
      'de': 'Patient Intake form',
      'en': '',
    },
    'sxwzbsjz': {
      'de': 'Please fill out the form below to continue.',
      'en': '',
    },
    '1byh2jsg': {
      'de': 'Home',
      'en': '',
    },
  },
  // addMeetingToCustomer
  {
    '5c37n68o': {
      'de': 'ID:',
      'en': '',
    },
    'qxm3fyf5': {
      'de': 'Option 1',
      'en': '',
    },
    'vyadd7r7': {
      'de': 'Tutor',
      'en': '',
    },
    'w2j7a4li': {
      'de': 'Search for an item...',
      'en': '',
    },
    'hxdjmxda': {
      'de': 'duration',
      'en': '',
    },
    'ci5rmjhx': {
      'de': 'duration',
      'en': '',
    },
    'mhet6khp': {
      'de': '0.0',
      'en': '',
    },
    '9lx2f4td': {
      'de': 'Save',
      'en': '',
    },
    'kl29b1po': {
      'de': 'Please enter the patients full name.',
      'en': '',
    },
    'e72x15w9': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'al1466er': {
      'de': 'Please enter an age for the patient.',
      'en': '',
    },
    'xt4vzwm9': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'oxstlqhc': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'unc56v4p': {
      'de': 'Please enter the date of birth of the patient.',
      'en': '',
    },
    'xab350ih': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'stkp7ti5': {
      'de': 'Field is required',
      'en': '',
    },
    '83yl9kkc': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'h5slg9bs': {
      'de': 'Add Meeting',
      'en': '',
    },
    '5pa3up8y': {
      'de': 'Add a meeting to a special customer',
      'en': '',
    },
    'c6npx1ws': {
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
    'u7433v0d': {
      'de': 'Group Chat ID: ',
      'en': '',
    },
    'ssykg4s6': {
      'de': 'In this chat',
      'en': '',
    },
    'bsezz6gy': {
      'de': 'Close',
      'en': '',
    },
  },
  // chat_ThreadComponent
  {
    'skbrxgwm': {
      'de': 'Start typing here...',
      'en': '',
    },
    'g534y60a': {
      'de': 'You must enter a message...',
      'en': '',
    },
    'axxavshr': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // user_ListSmall_1
  {
    '2lghugn7': {
      'de': 'ME',
      'en': '',
    },
  },
  // deleteDialog
  {
    '13iobm9v': {
      'de': 'Options',
      'en': '',
    },
    't9z0aabu': {
      'de': 'Invite Users',
      'en': '',
    },
    'zwifs52e': {
      'de': 'Delete Chat',
      'en': '',
    },
    'bhuh3tfe': {
      'de': 'Confirm Delete',
      'en': '',
    },
    'orxp2pwr': {
      'de': 'You can\'t undo this action.',
      'en': '',
    },
    'asgxxrtn': {
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
