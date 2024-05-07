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
      'de': 'Patients matching search',
      'en': '',
    },
    'xi6lsjxk': {
      'de': '24',
      'en': '',
    },
    'a928yqj7': {
      'de': 'Randy Rudolph',
      'en': '',
    },
    '0ws9ixo3': {
      'de': '(123) 456-7890',
      'en': '',
    },
    'mmtfwxqt': {
      'de': 'name@domain.com',
      'en': '',
    },
    'x8zjvcu8': {
      'de': 'Randie Mcmullens',
      'en': '',
    },
    'jiaqr3co': {
      'de': '(123) 456-7890',
      'en': '',
    },
    '2xihw8x2': {
      'de': 'name@domain.com',
      'en': '',
    },
    '8ndafcnt': {
      'de': 'Raney Bold',
      'en': '',
    },
    '8p391s9o': {
      'de': '(123) 456-7890',
      'en': '',
    },
    'n5ndrk9e': {
      'de': 'name@domain.com',
      'en': '',
    },
    'v2gsrfq1': {
      'de': 'Ragina Smith',
      'en': '',
    },
    '9e3bvech': {
      'de': '(123) 456-7890',
      'en': '',
    },
    '34lsg6hz': {
      'de': 'name@domain.com',
      'en': '',
    },
    '1uc50j53': {
      'de': 'Ra Kuo',
      'en': '',
    },
    '47x7m173': {
      'de': '(123) 456-7890',
      'en': '',
    },
    'jlx2jbz5': {
      'de': 'name@domain.com',
      'en': '',
    },
    'uu3be3mp': {
      'de': 'Raku Davis',
      'en': '',
    },
    'b9dxuh6x': {
      'de': '(123) 456-7890',
      'en': '',
    },
    '52tthw4b': {
      'de': 'name@domain.com',
      'en': '',
    },
    'a89yjpln': {
      'de': 'Search patients',
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
    'ps6f6xgl': {
      'de': 'Name',
      'en': '',
    },
    '5b0e56vs': {
      'de': 'Hello World',
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
    '1qkfg3ms': {
      'de': 'Active',
      'en': '',
    },
    'n6dvlpwe': {
      'de': 'Claim Customer',
      'en': '',
    },
    'z8iu5aur': {
      'de': 'Hours',
      'en': '',
    },
    'msv6ljoz': {
      'de': 'Tutor',
      'en': '',
    },
    'itkl3s28': {
      'de': 'ID:',
      'en': '',
    },
    'nm85wl6m': {
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
    'v1yq5rin': {
      'de': 'flow.io',
      'en': '',
    },
    'sl8p0kt1': {
      'de': 'Get Started',
      'en': '',
    },
    'l91wcety': {
      'de': 'Create an account by using the form below.',
      'en': '',
    },
    '3nug8tpv': {
      'de': 'Email',
      'en': '',
    },
    'ekp4kiig': {
      'de': 'Password',
      'en': '',
    },
    'iq9hzrcl': {
      'de': 'Create Account',
      'en': '',
    },
    'vlfty2br': {
      'de': 'Or sign up with',
      'en': '',
    },
    'wigq2u7g': {
      'de': 'Continue with Google',
      'en': '',
    },
    '4atgil5m': {
      'de': 'Continue with Apple',
      'en': '',
    },
    'egmf3i7n': {
      'de': 'Already have an account? ',
      'en': '',
    },
    'zcm9f1ou': {
      'de': 'Sign in here',
      'en': '',
    },
    '1byh2jsg': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_Login
  {
    'tunmqm6z': {
      'de': 'flow.io',
      'en': '',
    },
    '2xpne95q': {
      'de': 'Welcome Back',
      'en': '',
    },
    '3v8lwvfi': {
      'de': 'Fill out the information below in order to access your account.',
      'en': '',
    },
    '6rxnvn6s': {
      'de': 'Email',
      'en': '',
    },
    '4vwkcx2o': {
      'de': 'Password',
      'en': '',
    },
    '4dxvqkfl': {
      'de': 'Sign In',
      'en': '',
    },
    'nfqasnkr': {
      'de': 'Or sign in with',
      'en': '',
    },
    'uyjfjuk9': {
      'de': 'Continue with Google',
      'en': '',
    },
    '8m4s57q1': {
      'de': 'Continue with Apple',
      'en': '',
    },
    'st99cvx3': {
      'de': 'Don\'t have an account?  ',
      'en': '',
    },
    'agur70lw': {
      'de': 'Create Account',
      'en': '',
    },
    'rzvjqjea': {
      'de': 'Forgot password?',
      'en': '',
    },
    '6dtqlh1d': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_ForgotPassword
  {
    'sl49pfh9': {
      'de': 'flow.io',
      'en': '',
    },
    'v2ytta2j': {
      'de': 'Forgot Password',
      'en': '',
    },
    '6yt0e05d': {
      'de':
          'Please fill out your email belo in order to recieve a reset password link.',
      'en': '',
    },
    '3is8gh11': {
      'de': 'Email',
      'en': '',
    },
    '1c01a9sr': {
      'de': 'Send Reset Link',
      'en': '',
    },
    'f56hjqgo': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_createProfile
  {
    'z7hcijd6': {
      'de': 'flow.io',
      'en': '',
    },
    '51wadp85': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_Profile
  {
    '67eg41cr': {
      'de': 'Your Account',
      'en': '',
    },
    'h9okw7xu': {
      'de': 'Edit Profile',
      'en': '',
    },
    '51otaa4t': {
      'de': 'Edit Adress',
      'en': '',
    },
    '8flv38yc': {
      'de': 'Edit Languages',
      'en': '',
    },
    'jiygqzfl': {
      'de': 'Edit IT-Skills',
      'en': '',
    },
    '81s7l6n7': {
      'de': 'App Settings',
      'en': '',
    },
    'wl4orsum': {
      'de': 'Support',
      'en': '',
    },
    '1xc2obhy': {
      'de': 'Terms of Service',
      'en': '',
    },
    '1yf59ecs': {
      'de': 'Log Out',
      'en': '',
    },
    '333yw0i9': {
      'de': 'Home',
      'en': '',
    },
  },
  // auth_2_EditProfile
  {
    '1n2sqbo5': {
      'de': 'Home',
      'en': '',
    },
  },
  // support_TicketList
  {
    'ch7c14oh': {
      'de': 'Below are a list of recent tickets created',
      'en': '',
    },
    '0hb5jtal': {
      'de': 'Ticket #: ',
      'en': '',
    },
    'ps6htu39': {
      'de': 'Support Tickets',
      'en': '',
    },
    'dwhps0eg': {
      'de': 'Home',
      'en': '',
    },
  },
  // support_SubmitTicket
  {
    'smp1ka36': {
      'de': 'Create a Ticket',
      'en': '',
    },
    'c8w2gylx': {
      'de': 'Fill out the form below to submit a ticket.',
      'en': '',
    },
    '1ty41etm': {
      'de': 'Call Us',
      'en': '',
    },
    'rmyp0ht9': {
      'de': 'Email Us',
      'en': '',
    },
    'a3kzhhme': {
      'de': 'What is going on?',
      'en': '',
    },
    '42e2lqwe': {
      'de': 'Short Description of what is going on...',
      'en': '',
    },
    'sfbkp7rz': {
      'de': 'Choose a priority level',
      'en': '',
    },
    '69k71avu': {
      'de': 'Emergency',
      'en': '',
    },
    'jrqh0v78': {
      'de': 'High',
      'en': '',
    },
    'ylosck7b': {
      'de': 'Medium',
      'en': '',
    },
    'r1u5a8wf': {
      'de': 'Low',
      'en': '',
    },
    'c43g8i01': {
      'de': 'Low',
      'en': '',
    },
    'twkfvpnd': {
      'de': 'Upload Screenshot',
      'en': '',
    },
    'aq9mxt9y': {
      'de': 'Assign User',
      'en': '',
    },
    'i9o991kg': {
      'de': 'Add User',
      'en': '',
    },
    'lwt2obdb': {
      'de': 'Submit Ticket',
      'en': '',
    },
    'sneswqpc': {
      'de': 'Home',
      'en': '',
    },
  },
  // support_TicketDetails
  {
    'ovoy1m3o': {
      'de': 'Ticket Details',
      'en': '',
    },
    'b8a9z9un': {
      'de': 'Ticket #: ',
      'en': '',
    },
    'r7wydz5j': {
      'de': 'Below are the details of this support ticket.',
      'en': '',
    },
    'qwayzhto': {
      'de': 'Description',
      'en': '',
    },
    'iyt1617b': {
      'de': 'Submitted on',
      'en': '',
    },
    'vq5g5tku': {
      'de': 'Last Edited',
      'en': '',
    },
    '18aawzy7': {
      'de': 'Status',
      'en': '',
    },
    '8w1ckree': {
      'de': 'Pending',
      'en': '',
    },
    'qlw2fquk': {
      'de': 'In Progress',
      'en': '',
    },
    'tag7b1ei': {
      'de': 'Complete',
      'en': '',
    },
    'g98azts8': {
      'de': 'Submitted',
      'en': '',
    },
    'p1u4kwv6': {
      'de': 'Please select...',
      'en': '',
    },
    'w2j7a4li': {
      'de': 'Search for an item...',
      'en': '',
    },
    '9on18hk2': {
      'de': 'Assigned to',
      'en': '',
    },
    'eg6oxhun': {
      'de': 'Submitted By',
      'en': '',
    },
    '6xgh7974': {
      'de': 'Developer Note (delete this)',
      'en': '',
    },
    '13qm4jk2': {
      'de':
          'You will have to change the reference above to link to your \"users\" collection if you don\'t already have it, you can utilize the collection added with this flow.',
      'en': '',
    },
    'zc6vonnm': {
      'de': 'Assign',
      'en': '',
    },
    'cvpjy9ag': {
      'de': 'Update Ticket',
      'en': '',
    },
  },
  // editProfile_auth_2
  {
    'kc4k6xn5': {
      'de': 'Adjust the content below to update your profile.',
      'en': '',
    },
    'yqqhk5lm': {
      'de': 'Change Photo',
      'en': '',
    },
    '5ysb493n': {
      'de': 'Full Name',
      'en': '',
    },
    'lmwhn9dg': {
      'de': 'Your full name...',
      'en': '',
    },
    'ufyrtear': {
      'de': 'Owner/Founder',
      'en': '',
    },
    'w9c3r79b': {
      'de': 'Director',
      'en': '',
    },
    '4heerxr3': {
      'de': 'Manager',
      'en': '',
    },
    'ct11apau': {
      'de': 'Mid-Manager',
      'en': '',
    },
    'tqcn3iqb': {
      'de': 'Employee',
      'en': '',
    },
    'czubqpfu': {
      'de': 'Your Role',
      'en': '',
    },
    'v7plhg0s': {
      'de': 'Search for an item...',
      'en': '',
    },
    'jjx4hkkb': {
      'de': 'Short Description',
      'en': '',
    },
    '6w5edafv': {
      'de': 'A little about you...',
      'en': '',
    },
  },
  // setPriority_Menu
  {
    'qwkr80t0': {
      'de': 'Set Priority Level',
      'en': '',
    },
    'n2j0vqot': {
      'de': 'Emergency',
      'en': '',
    },
    'xzgn22im': {
      'de': 'High',
      'en': '',
    },
    '1mnnhyuk': {
      'de': 'Medium',
      'en': '',
    },
    '6jk7s8xb': {
      'de': 'Low',
      'en': '',
    },
  },
  // user_ListSmall
  {
    'l6ejmsde': {
      'de': 'ME',
      'en': '',
    },
  },
  // user_List
  {
    'uhwbn3ks': {
      'de': 'Assign User',
      'en': '',
    },
    'whilbxvn': {
      'de': 'Select a user from the list below to continue.',
      'en': '',
    },
    'ufrre5ch': {
      'de': 'Close',
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
