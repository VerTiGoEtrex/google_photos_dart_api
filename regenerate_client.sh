#!/bin/bash

curl "https://photoslibrary.googleapis.com/\$discovery/rest?version=v1" > discovery_docs/photos.json
flutter pub pub run discoveryapis_generator:generate files -i discovery_docs -o lib/api_client/