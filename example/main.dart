import 'package:google_photos/google_photos.dart';
import 'package:http/http.dart';
import 'package:google_sign_in/google_sign_in.dart';

main() async {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>[
    'profile',
    'https://www.googleapis.com/auth/photoslibrary',
    'https://www.googleapis.com/auth/photoslibrary.sharing'
  ]);
  final user = await googleSignIn.signInSilently();
  final client = AuthenticatedClient(
    Client(),
    () => user.authHeaders,
    user.clearAuthCache,
  );
  final api = PhotoslibraryApi(client);
  // ... use API
}

class AuthenticatedClient extends BaseClient {
  final Client baseClient;
  final Future<Map<String, String>> Function() getAuthHeaders;
  final Future<void> Function() invalidHeadersCallback;

  AuthenticatedClient(
    this.baseClient,
    this.getAuthHeaders,
    this.invalidHeadersCallback,
  );

  Future<StreamedResponse> send(final BaseRequest request) async {
    var authHeaders = await getAuthHeaders();
    request.headers.addAll(authHeaders);
    var response = await baseClient.send(request);
    if (response.statusCode == 401) {
      // Headers are expired, or perhaps user has been logged out.
      // GoogleSignIn expects clients to inform it of invalid cached headers.
      await invalidHeadersCallback();
    }
    return response;
  }

  @override
  void close() {
    super.close();
    baseClient.close();
  }
}
