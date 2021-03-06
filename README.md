# Google Photos Autogenerated API client

Google Photos does not yet have a first-party Dart SDK, so this is an unofficial API
client autogenerated from [Google Photo's API discovery doc](https://photoslibrary.googleapis.com/$discovery/rest?version=v1)

*Caveat lector:* Although this library is completely autogenerated using
[discoveryapis_generator](https://github.com/dart-lang/discoveryapis_generator),
it is also not tested. I'm using it in my own projects and have not run into any problems,
but please open an issue if you run into any problems.

## Getting Started

This API client is designed to be used with Dart's standard `HTTP` library. However, most of
the endpoints require authentication headers to function properly.

### Flutter

You can use
the `google_sign_in` package to get these headers, and extend the HTTP BaseClient to inject
the auth headers on behalf of the API client. See the `example` directory.

In future, perhaps the Dart or Flutter teams will provide better integration of HTTP clients
with the google_sign_in package.

### Everything else

Use the existing [googleapis_auth](https://pub.dev/packages/googleapis_auth) library to
get an authenticated HTTP client.

