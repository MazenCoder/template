import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../network/network_controller.dart';

///!  --------- Controllers ---------
NetworkController networkController = NetworkController.instance;
// final FirebaseMessaging firebaseMessaging = GetIt.I.get<FirebaseMessaging>();
// final FirebaseFirestore firebaseFirestore = GetIt.I.get<FirebaseFirestore>();
// final FirebaseStorage storage = GetIt.I.get<FirebaseStorage>();
// final FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();

///!  --------- Constants ---------
final Logger logger = Logger();
const int numLimit = 20;

///!  --------- Format ---------
final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
final DateFormat timeFormat = DateFormat('E, h:mm a');
