import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Logo_squared.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'ProfileSettings': ParameterData.none(),
  'Adress-Settings': ParameterData.none(),
  'IT-Skills-Settings': ParameterData.none(),
  'Language-Settings': ParameterData.none(),
  'Customer': (data) async => ParameterData(
        allParams: {
          'customercase': getParameter<DocumentReference>(data, 'customercase'),
        },
      ),
  'Main': ParameterData.none(),
  'Users': ParameterData.none(),
  'CreateCase': ParameterData.none(),
  'auth_2_Create': ParameterData.none(),
  'auth_2_Login': ParameterData.none(),
  'auth_2_ForgotPassword': ParameterData.none(),
  'auth_2_createProfile': ParameterData.none(),
  'auth_2_Profile': ParameterData.none(),
  'auth_2_EditProfile': ParameterData.none(),
  'support_TicketList': ParameterData.none(),
  'support_SubmitTicket': ParameterData.none(),
  'support_TicketDetails': (data) async => ParameterData(
        allParams: {
          'ticketRef': await getDocumentParameter<SupportTicketsRecord>(
              data, 'ticketRef', SupportTicketsRecord.fromSnapshot),
        },
      ),
  'EmployeeBilling': ParameterData.none(),
  'chat_2_Details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chat_2_main': ParameterData.none(),
  'chat_2_InviteUsers': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'CreateCustomer': ParameterData.none(),
  'AddMeetingToCustomer': (data) async => ParameterData(
        allParams: {
          'customercase': getParameter<DocumentReference>(data, 'customercase'),
        },
      ),
  'SideNav': ParameterData.none(),
  'CustomerBilling': ParameterData.none(),
  'ProfileEmployee': (data) async => ParameterData(
        allParams: {
          'employee': getParameter<DocumentReference>(data, 'employee'),
        },
      ),
  'ProfileUser': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
        },
      ),
  'CustomerMatching': ParameterData.none(),
  'ChangeEmployeePercentage': ParameterData.none(),
  'AllCustomers': ParameterData.none(),
  'RoleManagement': ParameterData.none(),
  'EditCase': (data) async => ParameterData(
        allParams: {
          'customercase': getParameter<DocumentReference>(data, 'customercase'),
        },
      ),
  'EditCustomer': (data) async => ParameterData(
        allParams: {
          'customer': getParameter<DocumentReference>(data, 'customer'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
