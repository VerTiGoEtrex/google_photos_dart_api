// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: unnecessary_cast

library google_photos.photoslibrary.v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client photoslibrary/v1';

/// Manage photos, videos, and albums in Google Photos
class PhotoslibraryApi {
  /// View and manage your Google Photos library
  static const PhotoslibraryScope =
      "https://www.googleapis.com/auth/photoslibrary";

  /// Add to your Google Photos library
  static const PhotoslibraryAppendonlyScope =
      "https://www.googleapis.com/auth/photoslibrary.appendonly";

  /// View your Google Photos library
  static const PhotoslibraryReadonlyScope =
      "https://www.googleapis.com/auth/photoslibrary.readonly";

  /// Manage photos added by this app
  static const PhotoslibraryReadonlyAppcreateddataScope =
      "https://www.googleapis.com/auth/photoslibrary.readonly.appcreateddata";

  /// Manage and add to shared albums on your behalf
  static const PhotoslibrarySharingScope =
      "https://www.googleapis.com/auth/photoslibrary.sharing";

  final commons.ApiRequester _requester;

  AlbumsResourceApi get albums => new AlbumsResourceApi(_requester);
  MediaItemsResourceApi get mediaItems => new MediaItemsResourceApi(_requester);
  SharedAlbumsResourceApi get sharedAlbums =>
      new SharedAlbumsResourceApi(_requester);

  PhotoslibraryApi(http.Client client,
      {core.String rootUrl: "https://photoslibrary.googleapis.com/",
      core.String servicePath: ""})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class AlbumsResourceApi {
  final commons.ApiRequester _requester;

  AlbumsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Adds an enrichment at a specified position in a defined album.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [albumId] - Identifier of the album where the enrichment is to be added.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AddEnrichmentToAlbumResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AddEnrichmentToAlbumResponse> addEnrichment(
      AddEnrichmentToAlbumRequest request, core.String albumId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (albumId == null) {
      throw new core.ArgumentError("Parameter albumId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/albums/' +
        commons.Escaper.ecapeVariableReserved('$albumId') +
        ':addEnrichment';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new AddEnrichmentToAlbumResponse.fromJson(data));
  }

  /// Adds one or more media items in a user's Google Photos library to
  /// an album. The media items and albums must have been created by the
  /// developer via the API.
  ///
  /// Media items are added to the end of the album. If multiple media items are
  /// given, they are added in the order specified in this call.
  ///
  /// Each album can contain up to 20,000 media items.
  ///
  /// Only media items that are in the user's library can be added to an
  /// album. For albums that are shared, the album must either be owned by the
  /// user or the user must have joined the album as a collaborator.
  ///
  /// Partial success is not supported. The entire request will fail if an
  /// invalid media item or album is specified.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [albumId] - Identifier of the Album that the
  /// media items are added to.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [BatchAddMediaItemsToAlbumResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<BatchAddMediaItemsToAlbumResponse> batchAddMediaItems(
      BatchAddMediaItemsToAlbumRequest request, core.String albumId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (albumId == null) {
      throw new core.ArgumentError("Parameter albumId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/albums/' +
        commons.Escaper.ecapeVariableReserved('$albumId') +
        ':batchAddMediaItems';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new BatchAddMediaItemsToAlbumResponse.fromJson(data));
  }

  /// Removes one or more media items from a specified album. The media items
  /// and
  /// the album must have been created by the developer via the API.
  ///
  /// For albums that are shared, this action is only supported for media items
  /// that were added to the album by this user, or for all media items if the
  /// album was created by this user.
  ///
  /// Partial success is not supported. The entire request will fail and no
  /// action will be performed on the album if an invalid media item or album is
  /// specified.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [albumId] - Identifier of the Album that the media
  /// items are to be removed from.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [BatchRemoveMediaItemsFromAlbumResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<BatchRemoveMediaItemsFromAlbumResponse> batchRemoveMediaItems(
      BatchRemoveMediaItemsFromAlbumRequest request, core.String albumId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (albumId == null) {
      throw new core.ArgumentError("Parameter albumId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/albums/' +
        commons.Escaper.ecapeVariableReserved('$albumId') +
        ':batchRemoveMediaItems';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new BatchRemoveMediaItemsFromAlbumResponse.fromJson(data));
  }

  /// Creates an album in a user's Google Photos library.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Album].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Album> create(CreateAlbumRequest request,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/albums';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Album.fromJson(data));
  }

  /// Returns the album based on the specified `albumId`.
  /// The `albumId` must be the ID of an album owned by the user or a shared
  /// album that the user has joined.
  ///
  /// Request parameters:
  ///
  /// [albumId] - Identifier of the album to be requested.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Album].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Album> get(core.String albumId, {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (albumId == null) {
      throw new core.ArgumentError("Parameter albumId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/albums/' + commons.Escaper.ecapeVariableReserved('$albumId');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Album.fromJson(data));
  }

  /// Lists all albums shown to a user in the Albums tab of the Google
  /// Photos app.
  ///
  /// Request parameters:
  ///
  /// [pageToken] - A continuation token to get the next page of the results.
  /// Adding this to
  /// the request returns the rows after the `pageToken`. The `pageToken` should
  /// be the value returned in the `nextPageToken` parameter in the response to
  /// the `listAlbums` request.
  ///
  /// [pageSize] - Maximum number of albums to return in the response. The
  /// default number of
  /// albums to return at a time is 20. The maximum `pageSize` is 50.
  ///
  /// [excludeNonAppCreatedData] - If set, the results exclude media items that
  /// were not created by this app.
  /// Defaults to false (all albums are returned). This field is ignored if the
  /// photoslibrary.readonly.appcreateddata scope is used.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListAlbumsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListAlbumsResponse> list(
      {core.String pageToken,
      core.int pageSize,
      core.bool excludeNonAppCreatedData,
      core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if (excludeNonAppCreatedData != null) {
      _queryParams["excludeNonAppCreatedData"] = [
        "${excludeNonAppCreatedData}"
      ];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/albums';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ListAlbumsResponse.fromJson(data));
  }

  /// Marks an album as shared and accessible to other users. This action can
  /// only be performed on albums which were created by the developer via the
  /// API.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [albumId] - Identifier of the album to be shared. This `albumId` must
  /// belong to an
  /// album created by the developer.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ShareAlbumResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ShareAlbumResponse> share(
      ShareAlbumRequest request, core.String albumId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (albumId == null) {
      throw new core.ArgumentError("Parameter albumId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/albums/' +
        commons.Escaper.ecapeVariableReserved('$albumId') +
        ':share';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ShareAlbumResponse.fromJson(data));
  }

  /// Marks a previously shared album as private. This means that the album is
  /// no longer shared and all the non-owners will lose access to the album. All
  /// non-owner content will be removed from the album. If a non-owner has
  /// previously added the album to their library, they will retain all photos
  /// in
  /// their library. This action can only be performed on albums which were
  /// created by the developer via the API.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [albumId] - Identifier of the album to be unshared. This album id must
  /// belong to an
  /// album created by the developer.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [UnshareAlbumResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<UnshareAlbumResponse> unshare(
      UnshareAlbumRequest request, core.String albumId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (albumId == null) {
      throw new core.ArgumentError("Parameter albumId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/albums/' +
        commons.Escaper.ecapeVariableReserved('$albumId') +
        ':unshare';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new UnshareAlbumResponse.fromJson(data));
  }
}

class MediaItemsResourceApi {
  final commons.ApiRequester _requester;

  MediaItemsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Creates one or more media items in a user's Google Photos library.
  ///
  /// This is the second step for creating a media item. For details regarding
  /// Step 1, uploading the raw bytes to a Google Server, see
  /// <a href="/photos/library/guides/upload-media">Uploading media</a>.
  ///
  /// This call adds the media item to the library. If an album `id` is
  /// specified, the call adds the media item to the album too. Each album can
  /// contain up to 20,000 media items. By default, the media item will be added
  /// to the end of the library or album.
  ///
  /// If an album `id` and position are both defined, the media item is
  /// added to the album at the specified position.
  ///
  /// If the call contains multiple media items, they're added at the specified
  /// position.
  /// If you are creating a media item in a shared album where you are not the
  /// owner, you are not allowed to position the media item. Doing so will
  /// result
  /// in a `BAD REQUEST` error.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [BatchCreateMediaItemsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<BatchCreateMediaItemsResponse> batchCreate(
      BatchCreateMediaItemsRequest request,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/mediaItems:batchCreate';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new BatchCreateMediaItemsResponse.fromJson(data));
  }

  /// Returns the list of media items for the specified media item identifiers.
  /// Items are returned in the same order as the supplied identifiers.
  ///
  /// Request parameters:
  ///
  /// [mediaItemIds] - Identifiers of the media items to be requested.
  /// Must not contain repeated identifiers and cannot be empty. The maximum
  /// number of media items that can be retrieved in one call is 50.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [BatchGetMediaItemsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<BatchGetMediaItemsResponse> batchGet(
      {core.List<core.String> mediaItemIds, core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (mediaItemIds != null) {
      _queryParams["mediaItemIds"] = mediaItemIds;
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/mediaItems:batchGet';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new BatchGetMediaItemsResponse.fromJson(data));
  }

  /// Returns the media item for the specified media item identifier.
  ///
  /// Request parameters:
  ///
  /// [mediaItemId] - Identifier of the media item to be requested.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [MediaItem].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<MediaItem> get(core.String mediaItemId, {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (mediaItemId == null) {
      throw new core.ArgumentError("Parameter mediaItemId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/mediaItems/' +
        commons.Escaper.ecapeVariableReserved('$mediaItemId');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new MediaItem.fromJson(data));
  }

  /// List all media items from a user's Google Photos library.
  ///
  /// Request parameters:
  ///
  /// [pageToken] - A continuation token to get the next page of the results.
  /// Adding this to
  /// the request returns the rows after the `pageToken`. The `pageToken` should
  /// be the value returned in the `nextPageToken` parameter in the response to
  /// the `listMediaItems` request.
  ///
  /// [pageSize] - Maximum number of media items to return in the response. The
  /// default number
  /// of media items to return at a time is 25. The maximum `pageSize` is 100.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListMediaItemsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListMediaItemsResponse> list(
      {core.String pageToken, core.int pageSize, core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/mediaItems';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ListMediaItemsResponse.fromJson(data));
  }

  /// Searches for media items in a user's Google Photos library.
  /// If no filters are set, then all media items in the user's library are
  /// returned.
  /// If an album is set, all media items in the specified album are returned.
  /// If filters are specified, media items that match the filters from the
  /// user's library are listed. If you set both the album and the filters, the
  /// request results in an error.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [SearchMediaItemsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<SearchMediaItemsResponse> search(SearchMediaItemsRequest request,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/mediaItems:search';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new SearchMediaItemsResponse.fromJson(data));
  }
}

class SharedAlbumsResourceApi {
  final commons.ApiRequester _requester;

  SharedAlbumsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Returns the album based on the specified `shareToken`.
  ///
  /// Request parameters:
  ///
  /// [shareToken] - Share token of the album to be requested.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Album].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Album> get(core.String shareToken, {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (shareToken == null) {
      throw new core.ArgumentError("Parameter shareToken is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/sharedAlbums/' +
        commons.Escaper.ecapeVariableReserved('$shareToken');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Album.fromJson(data));
  }

  /// Joins a shared album on behalf of the Google Photos user.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [JoinSharedAlbumResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<JoinSharedAlbumResponse> join(JoinSharedAlbumRequest request,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/sharedAlbums:join';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new JoinSharedAlbumResponse.fromJson(data));
  }

  /// Leaves a previously-joined shared album on behalf of the Google Photos
  /// user. The user must not own this album.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [LeaveSharedAlbumResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<LeaveSharedAlbumResponse> leave(LeaveSharedAlbumRequest request,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/sharedAlbums:leave';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new LeaveSharedAlbumResponse.fromJson(data));
  }

  /// Lists all shared albums available in the Sharing tab of the
  /// user's Google Photos app.
  ///
  /// Request parameters:
  ///
  /// [pageToken] - A continuation token to get the next page of the results.
  /// Adding this to
  /// the request returns the rows after the `pageToken`. The `pageToken` should
  /// be the value returned in the `nextPageToken` parameter in the response to
  /// the `listSharedAlbums` request.
  ///
  /// [pageSize] - Maximum number of albums to return in the response. The
  /// default number of
  /// albums to return at a time is 20. The maximum `pageSize` is 50.
  ///
  /// [excludeNonAppCreatedData] - If set, the results exclude media items that
  /// were not created by this app.
  /// Defaults to false (all albums are returned). This field is ignored if the
  /// photoslibrary.readonly.appcreateddata scope is used.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListSharedAlbumsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListSharedAlbumsResponse> list(
      {core.String pageToken,
      core.int pageSize,
      core.bool excludeNonAppCreatedData,
      core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if (excludeNonAppCreatedData != null) {
      _queryParams["excludeNonAppCreatedData"] = [
        "${excludeNonAppCreatedData}"
      ];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/sharedAlbums';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new ListSharedAlbumsResponse.fromJson(data));
  }
}

/// Request to add an enrichment to a specific album at a specific position.
class AddEnrichmentToAlbumRequest {
  /// The position in the album where the enrichment is to be inserted.
  AlbumPosition albumPosition;

  /// The enrichment to be added.
  NewEnrichmentItem newEnrichmentItem;

  AddEnrichmentToAlbumRequest();

  AddEnrichmentToAlbumRequest.fromJson(core.Map _json) {
    if (_json.containsKey("albumPosition")) {
      albumPosition = new AlbumPosition.fromJson(_json["albumPosition"]);
    }
    if (_json.containsKey("newEnrichmentItem")) {
      newEnrichmentItem =
          new NewEnrichmentItem.fromJson(_json["newEnrichmentItem"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (albumPosition != null) {
      _json["albumPosition"] = (albumPosition).toJson();
    }
    if (newEnrichmentItem != null) {
      _json["newEnrichmentItem"] = (newEnrichmentItem).toJson();
    }
    return _json;
  }
}

/// The enrichment item that's created.
class AddEnrichmentToAlbumResponse {
  /// Output only. Enrichment which was added.
  EnrichmentItem enrichmentItem;

  AddEnrichmentToAlbumResponse();

  AddEnrichmentToAlbumResponse.fromJson(core.Map _json) {
    if (_json.containsKey("enrichmentItem")) {
      enrichmentItem = new EnrichmentItem.fromJson(_json["enrichmentItem"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (enrichmentItem != null) {
      _json["enrichmentItem"] = (enrichmentItem).toJson();
    }
    return _json;
  }
}

/// Representation of an album in Google Photos.
/// Albums are containers for media items. If an album has been shared by the
/// application, it contains an extra `shareInfo` property.
class Album {
  /// [Output only] A URL to the cover photo's bytes. This shouldn't be used as
  /// is. Parameters should be appended to this URL before use. See the
  /// [developer
  /// documentation](https://developers.google.com/photos/library/guides/access-media-items#base-urls)
  /// for a complete list of supported parameters. For example,
  /// `'=w2048-h1024'` sets the dimensions of the cover photo to have a width of
  /// 2048 px and height of 1024 px.
  core.String coverPhotoBaseUrl;

  /// [Output only] Identifier for the media item associated with the cover
  /// photo.
  core.String coverPhotoMediaItemId;

  /// [Ouput only] Identifier for the album. This is a persistent identifier
  /// that
  /// can be used between sessions to identify this album.
  core.String id;

  /// [Output only] True if you can create media items in this album.
  /// This field is based on the scopes granted and permissions of the album. If
  /// the scopes are changed or permissions of the album are changed, this field
  /// is updated.
  core.bool isWriteable;

  /// [Output only] The number of media items in the album.
  core.String mediaItemsCount;

  /// [Output only] Google Photos URL for the album. The user needs to be signed
  /// in to their Google Photos account to access this link.
  core.String productUrl;

  /// [Output only] Information related to shared albums.
  /// This field is only populated if the album is a shared album, the
  /// developer created the album and the user has granted the
  /// `photoslibrary.sharing` scope.
  ShareInfo shareInfo;

  /// Name of the album displayed to the user in their Google Photos account.
  /// This string shouldn't be more than 500 characters.
  core.String title;

  Album();

  Album.fromJson(core.Map _json) {
    if (_json.containsKey("coverPhotoBaseUrl")) {
      coverPhotoBaseUrl = _json["coverPhotoBaseUrl"];
    }
    if (_json.containsKey("coverPhotoMediaItemId")) {
      coverPhotoMediaItemId = _json["coverPhotoMediaItemId"];
    }
    if (_json.containsKey("id")) {
      id = _json["id"];
    }
    if (_json.containsKey("isWriteable")) {
      isWriteable = _json["isWriteable"];
    }
    if (_json.containsKey("mediaItemsCount")) {
      mediaItemsCount = _json["mediaItemsCount"];
    }
    if (_json.containsKey("productUrl")) {
      productUrl = _json["productUrl"];
    }
    if (_json.containsKey("shareInfo")) {
      shareInfo = new ShareInfo.fromJson(_json["shareInfo"]);
    }
    if (_json.containsKey("title")) {
      title = _json["title"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (coverPhotoBaseUrl != null) {
      _json["coverPhotoBaseUrl"] = coverPhotoBaseUrl;
    }
    if (coverPhotoMediaItemId != null) {
      _json["coverPhotoMediaItemId"] = coverPhotoMediaItemId;
    }
    if (id != null) {
      _json["id"] = id;
    }
    if (isWriteable != null) {
      _json["isWriteable"] = isWriteable;
    }
    if (mediaItemsCount != null) {
      _json["mediaItemsCount"] = mediaItemsCount;
    }
    if (productUrl != null) {
      _json["productUrl"] = productUrl;
    }
    if (shareInfo != null) {
      _json["shareInfo"] = (shareInfo).toJson();
    }
    if (title != null) {
      _json["title"] = title;
    }
    return _json;
  }
}

/// Specifies a position in an album.
class AlbumPosition {
  /// Type of position, for a media or enrichment item.
  /// Possible string values are:
  /// - "POSITION_TYPE_UNSPECIFIED" : Default value if this enum isn't set.
  /// - "FIRST_IN_ALBUM" : At the beginning of the album.
  /// - "LAST_IN_ALBUM" : At the end of the album.
  /// - "AFTER_MEDIA_ITEM" : After a media item.
  /// - "AFTER_ENRICHMENT_ITEM" : After an enrichment item.
  core.String position;

  /// The enrichment item to which the position is relative to.
  /// Only used when position type is AFTER_ENRICHMENT_ITEM.
  core.String relativeEnrichmentItemId;

  /// The media item to which the position is relative to.
  /// Only used when position type is AFTER_MEDIA_ITEM.
  core.String relativeMediaItemId;

  AlbumPosition();

  AlbumPosition.fromJson(core.Map _json) {
    if (_json.containsKey("position")) {
      position = _json["position"];
    }
    if (_json.containsKey("relativeEnrichmentItemId")) {
      relativeEnrichmentItemId = _json["relativeEnrichmentItemId"];
    }
    if (_json.containsKey("relativeMediaItemId")) {
      relativeMediaItemId = _json["relativeMediaItemId"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (position != null) {
      _json["position"] = position;
    }
    if (relativeEnrichmentItemId != null) {
      _json["relativeEnrichmentItemId"] = relativeEnrichmentItemId;
    }
    if (relativeMediaItemId != null) {
      _json["relativeMediaItemId"] = relativeMediaItemId;
    }
    return _json;
  }
}

/// Request to add media items to an album.
class BatchAddMediaItemsToAlbumRequest {
  /// Identifiers of the MediaItems to be
  /// added.
  /// The maximum number of media items that can be added in one call is 50.
  core.List<core.String> mediaItemIds;

  BatchAddMediaItemsToAlbumRequest();

  BatchAddMediaItemsToAlbumRequest.fromJson(core.Map _json) {
    if (_json.containsKey("mediaItemIds")) {
      mediaItemIds = (_json["mediaItemIds"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (mediaItemIds != null) {
      _json["mediaItemIds"] = mediaItemIds;
    }
    return _json;
  }
}

/// Response for adding media items to an album.
class BatchAddMediaItemsToAlbumResponse {
  BatchAddMediaItemsToAlbumResponse();

  BatchAddMediaItemsToAlbumResponse.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// Request to create one or more media items in a user's Google Photos library.
/// If an `albumid` is specified, the media items are also added to that album.
/// `albumPosition` is optional and can only be specified if an `albumId` is
/// set.
class BatchCreateMediaItemsRequest {
  /// Identifier of the album where the media items are added. The media items
  /// are also added to the user's library. This is an optional field.
  core.String albumId;

  /// Position in the album where the media items are added. If not
  /// specified, the media items are added to the end of the album (as per
  /// the default value, that is, `LAST_IN_ALBUM`). The request fails if this
  /// field is set and the `albumId` is not specified. The request will also
  /// fail
  /// if you set the field and are not the owner of the shared album.
  AlbumPosition albumPosition;

  /// List of media items to be created.
  core.List<NewMediaItem> newMediaItems;

  BatchCreateMediaItemsRequest();

  BatchCreateMediaItemsRequest.fromJson(core.Map _json) {
    if (_json.containsKey("albumId")) {
      albumId = _json["albumId"];
    }
    if (_json.containsKey("albumPosition")) {
      albumPosition = new AlbumPosition.fromJson(_json["albumPosition"]);
    }
    if (_json.containsKey("newMediaItems")) {
      newMediaItems = (_json["newMediaItems"] as core.List)
          .map<NewMediaItem>((value) => new NewMediaItem.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (albumId != null) {
      _json["albumId"] = albumId;
    }
    if (albumPosition != null) {
      _json["albumPosition"] = (albumPosition).toJson();
    }
    if (newMediaItems != null) {
      _json["newMediaItems"] =
          newMediaItems.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// List of media items created.
class BatchCreateMediaItemsResponse {
  /// Output only. List of media items created.
  core.List<NewMediaItemResult> newMediaItemResults;

  BatchCreateMediaItemsResponse();

  BatchCreateMediaItemsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("newMediaItemResults")) {
      newMediaItemResults = (_json["newMediaItemResults"] as core.List)
          .map<NewMediaItemResult>(
              (value) => new NewMediaItemResult.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (newMediaItemResults != null) {
      _json["newMediaItemResults"] =
          newMediaItemResults.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Response to retrieve a list of media items.
class BatchGetMediaItemsResponse {
  /// Output only. List of media items retrieved.
  /// Note that even if the call to BatchGetMediaItems succeeds, there may have
  /// been failures for some media items in the batch. These failures are
  /// indicated in each
  /// MediaItemResult.status.
  core.List<MediaItemResult> mediaItemResults;

  BatchGetMediaItemsResponse();

  BatchGetMediaItemsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("mediaItemResults")) {
      mediaItemResults = (_json["mediaItemResults"] as core.List)
          .map<MediaItemResult>((value) => new MediaItemResult.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (mediaItemResults != null) {
      _json["mediaItemResults"] =
          mediaItemResults.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Request to remove a list of media items from an album.
class BatchRemoveMediaItemsFromAlbumRequest {
  /// Identifiers of the MediaItems to be
  /// removed.
  ///
  /// Must not contain repeated identifiers and cannot be empty. The maximum
  /// number of media items that can be removed in one call is 50.
  core.List<core.String> mediaItemIds;

  BatchRemoveMediaItemsFromAlbumRequest();

  BatchRemoveMediaItemsFromAlbumRequest.fromJson(core.Map _json) {
    if (_json.containsKey("mediaItemIds")) {
      mediaItemIds = (_json["mediaItemIds"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (mediaItemIds != null) {
      _json["mediaItemIds"] = mediaItemIds;
    }
    return _json;
  }
}

/// Response for successfully removing all specified media items from the album.
class BatchRemoveMediaItemsFromAlbumResponse {
  BatchRemoveMediaItemsFromAlbumResponse();

  BatchRemoveMediaItemsFromAlbumResponse.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// This filter allows you to return media items based on the content type.
///
/// It's possible to specify a list of categories to include, and/or a list of
/// categories to exclude. Within each list, the categories are combined with an
/// OR. <p>
/// The content filter `includedContentCategories`: [c1, c2, c3] would get media
/// items that contain (c1 OR c2 OR c3). <p>
/// The content filter `excludedContentCategories`: [c1, c2, c3] would NOT get
/// media items that contain (c1 OR c2 OR c3). <p>
/// You can also include some categories while excluding others, as in this
/// example: `includedContentCategories`: [c1, c2], `excludedContentCategories`:
/// [c3, c4] <p>
/// The previous example would get media items that contain (c1 OR c2) AND NOT
/// (c3 OR c4). A category that appears in `includedContentategories` must not
/// appear in `excludedContentCategories`.
class ContentFilter {
  /// The set of categories which are not to be included in the media item
  /// search
  /// results. The items in the set are ORed. There's a maximum of 10
  /// `excludedContentCategories` per request.
  core.List<core.String> excludedContentCategories;

  /// The set of categories to be included in the media item search results.
  /// The items in the set are ORed. There's a maximum of 10
  /// `includedContentCategories` per request.
  core.List<core.String> includedContentCategories;

  ContentFilter();

  ContentFilter.fromJson(core.Map _json) {
    if (_json.containsKey("excludedContentCategories")) {
      excludedContentCategories =
          (_json["excludedContentCategories"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("includedContentCategories")) {
      includedContentCategories =
          (_json["includedContentCategories"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (excludedContentCategories != null) {
      _json["excludedContentCategories"] = excludedContentCategories;
    }
    if (includedContentCategories != null) {
      _json["includedContentCategories"] = includedContentCategories;
    }
    return _json;
  }
}

/// Information about the user who added the media item. Note that this
/// information is included only if the media item is within a shared album
/// created by your app and you have the sharing scope.
class ContributorInfo {
  /// Display name of the contributor.
  core.String displayName;

  /// URL to the profile picture of the contributor.
  core.String profilePictureBaseUrl;

  ContributorInfo();

  ContributorInfo.fromJson(core.Map _json) {
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("profilePictureBaseUrl")) {
      profilePictureBaseUrl = _json["profilePictureBaseUrl"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (profilePictureBaseUrl != null) {
      _json["profilePictureBaseUrl"] = profilePictureBaseUrl;
    }
    return _json;
  }
}

/// Request to create an album in Google Photos.
class CreateAlbumRequest {
  /// The album to be created.
  Album album;

  CreateAlbumRequest();

  CreateAlbumRequest.fromJson(core.Map _json) {
    if (_json.containsKey("album")) {
      album = new Album.fromJson(_json["album"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (album != null) {
      _json["album"] = (album).toJson();
    }
    return _json;
  }
}

/// Represents a whole calendar date. The day may be 0 to represent a year and
/// month where the day isn't significant, such as a whole calendar month. The
/// month may be 0 to represent a a day and a year where the month isn't
/// signficant, like when you want to specify the same day in every month of a
/// year or a specific year. The year may be 0 to represent a month and day
/// independent of year, like an anniversary date.
class Date {
  /// Day of month. Must be from 1 to 31 and valid for the year and month, or 0
  /// if specifying a year/month where the day isn't significant.
  core.int day;

  /// Month of year. Must be from 1 to 12, or 0 if specifying a year without a
  /// month and day.
  core.int month;

  /// Year of date. Must be from 1 to 9999, or 0 if specifying a date without
  /// a year.
  core.int year;

  Date();

  Date.fromJson(core.Map _json) {
    if (_json.containsKey("day")) {
      day = _json["day"];
    }
    if (_json.containsKey("month")) {
      month = _json["month"];
    }
    if (_json.containsKey("year")) {
      year = _json["year"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (day != null) {
      _json["day"] = day;
    }
    if (month != null) {
      _json["month"] = month;
    }
    if (year != null) {
      _json["year"] = year;
    }
    return _json;
  }
}

/// This filter defines the allowed dates or date ranges for the media returned.
/// It's possible to pick a set of specific dates and a set of date ranges.
class DateFilter {
  /// List of dates that match the media items' creation date. A maximum of
  /// 5 dates can be included per request.
  core.List<Date> dates;

  /// List of dates ranges that match the media items' creation date. A
  /// maximum of 5 dates ranges can be included per request.
  core.List<DateRange> ranges;

  DateFilter();

  DateFilter.fromJson(core.Map _json) {
    if (_json.containsKey("dates")) {
      dates = (_json["dates"] as core.List)
          .map<Date>((value) => new Date.fromJson(value))
          .toList();
    }
    if (_json.containsKey("ranges")) {
      ranges = (_json["ranges"] as core.List)
          .map<DateRange>((value) => new DateRange.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (dates != null) {
      _json["dates"] = dates.map((value) => (value).toJson()).toList();
    }
    if (ranges != null) {
      _json["ranges"] = ranges.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Defines a range of dates. Both dates must be of the same format. For more
/// information, see <a href="#Date">Date</a>
class DateRange {
  /// The end date (included as part of the range). It must be specified in the
  /// same format as the start date.
  Date endDate;

  /// The start date (included as part of the range) in one of the formats
  /// described.
  Date startDate;

  DateRange();

  DateRange.fromJson(core.Map _json) {
    if (_json.containsKey("endDate")) {
      endDate = new Date.fromJson(_json["endDate"]);
    }
    if (_json.containsKey("startDate")) {
      startDate = new Date.fromJson(_json["startDate"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (endDate != null) {
      _json["endDate"] = (endDate).toJson();
    }
    if (startDate != null) {
      _json["startDate"] = (startDate).toJson();
    }
    return _json;
  }
}

/// An enrichment item.
class EnrichmentItem {
  /// Identifier of the enrichment item.
  core.String id;

  EnrichmentItem();

  EnrichmentItem.fromJson(core.Map _json) {
    if (_json.containsKey("id")) {
      id = _json["id"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (id != null) {
      _json["id"] = id;
    }
    return _json;
  }
}

/// This filter defines the features that the media items should have.
class FeatureFilter {
  /// The set of features to be included in the media item search results.
  /// The items in the set are ORed and may match any of the specified features.
  core.List<core.String> includedFeatures;

  FeatureFilter();

  FeatureFilter.fromJson(core.Map _json) {
    if (_json.containsKey("includedFeatures")) {
      includedFeatures =
          (_json["includedFeatures"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (includedFeatures != null) {
      _json["includedFeatures"] = includedFeatures;
    }
    return _json;
  }
}

/// Filters that can be applied to a media item search.
/// If multiple filter options are specified, they're treated as AND with each
/// other.
class Filters {
  /// Filters the media items based on their content.
  ContentFilter contentFilter;

  /// Filters the media items based on their creation date.
  DateFilter dateFilter;

  /// If set, the results exclude media items that were not created by this app.
  /// Defaults to false (all media items are returned). This field is ignored if
  /// the photoslibrary.readonly.appcreateddata scope is used.
  core.bool excludeNonAppCreatedData;

  /// Filters the media items based on their features.
  FeatureFilter featureFilter;

  /// If set, the results include media items that the user has archived.
  /// Defaults to false (archived media items aren't included).
  core.bool includeArchivedMedia;

  /// Filters the media items based on the type of media.
  MediaTypeFilter mediaTypeFilter;

  Filters();

  Filters.fromJson(core.Map _json) {
    if (_json.containsKey("contentFilter")) {
      contentFilter = new ContentFilter.fromJson(_json["contentFilter"]);
    }
    if (_json.containsKey("dateFilter")) {
      dateFilter = new DateFilter.fromJson(_json["dateFilter"]);
    }
    if (_json.containsKey("excludeNonAppCreatedData")) {
      excludeNonAppCreatedData = _json["excludeNonAppCreatedData"];
    }
    if (_json.containsKey("featureFilter")) {
      featureFilter = new FeatureFilter.fromJson(_json["featureFilter"]);
    }
    if (_json.containsKey("includeArchivedMedia")) {
      includeArchivedMedia = _json["includeArchivedMedia"];
    }
    if (_json.containsKey("mediaTypeFilter")) {
      mediaTypeFilter = new MediaTypeFilter.fromJson(_json["mediaTypeFilter"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (contentFilter != null) {
      _json["contentFilter"] = (contentFilter).toJson();
    }
    if (dateFilter != null) {
      _json["dateFilter"] = (dateFilter).toJson();
    }
    if (excludeNonAppCreatedData != null) {
      _json["excludeNonAppCreatedData"] = excludeNonAppCreatedData;
    }
    if (featureFilter != null) {
      _json["featureFilter"] = (featureFilter).toJson();
    }
    if (includeArchivedMedia != null) {
      _json["includeArchivedMedia"] = includeArchivedMedia;
    }
    if (mediaTypeFilter != null) {
      _json["mediaTypeFilter"] = (mediaTypeFilter).toJson();
    }
    return _json;
  }
}

/// Request to join a shared album on behalf of the user. This uses a shareToken
/// which can be acquired via the shareAlbum or listSharedAlbums calls.
class JoinSharedAlbumRequest {
  /// Token to join the shared album on behalf of the user.
  core.String shareToken;

  JoinSharedAlbumRequest();

  JoinSharedAlbumRequest.fromJson(core.Map _json) {
    if (_json.containsKey("shareToken")) {
      shareToken = _json["shareToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (shareToken != null) {
      _json["shareToken"] = shareToken;
    }
    return _json;
  }
}

/// Response to successfully joining the shared album on behalf of the user.
class JoinSharedAlbumResponse {
  /// Shared album that the user has joined.
  Album album;

  JoinSharedAlbumResponse();

  JoinSharedAlbumResponse.fromJson(core.Map _json) {
    if (_json.containsKey("album")) {
      album = new Album.fromJson(_json["album"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (album != null) {
      _json["album"] = (album).toJson();
    }
    return _json;
  }
}

/// An object representing a latitude/longitude pair. This is expressed as a
/// pair
/// of doubles representing degrees latitude and degrees longitude. Unless
/// specified otherwise, this must conform to the
/// <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
/// standard</a>. Values must be within normalized ranges.
class LatLng {
  /// The latitude in degrees. It must be in the range [-90.0, +90.0].
  core.double latitude;

  /// The longitude in degrees. It must be in the range [-180.0, +180.0].
  core.double longitude;

  LatLng();

  LatLng.fromJson(core.Map _json) {
    if (_json.containsKey("latitude")) {
      latitude = _json["latitude"].toDouble();
    }
    if (_json.containsKey("longitude")) {
      longitude = _json["longitude"].toDouble();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (latitude != null) {
      _json["latitude"] = latitude;
    }
    if (longitude != null) {
      _json["longitude"] = longitude;
    }
    return _json;
  }
}

/// Request to leave a shared album on behalf of the user. This uses a
/// shareToken
/// which can be acquired via the or listSharedAlbums or getAlbum calls.
class LeaveSharedAlbumRequest {
  /// Token to leave the shared album on behalf of the user.
  core.String shareToken;

  LeaveSharedAlbumRequest();

  LeaveSharedAlbumRequest.fromJson(core.Map _json) {
    if (_json.containsKey("shareToken")) {
      shareToken = _json["shareToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (shareToken != null) {
      _json["shareToken"] = shareToken;
    }
    return _json;
  }
}

/// Response to successfully leaving the shared album on behalf of the user.
class LeaveSharedAlbumResponse {
  LeaveSharedAlbumResponse();

  LeaveSharedAlbumResponse.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// List of albums requested.
class ListAlbumsResponse {
  /// Output only. List of albums shown in the Albums tab of the user's Google
  /// Photos app.
  core.List<Album> albums;

  /// Output only. Token to use to get the next set of albums. Populated if
  /// there are more albums to retrieve for this request.
  core.String nextPageToken;

  ListAlbumsResponse();

  ListAlbumsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("albums")) {
      albums = (_json["albums"] as core.List)
          .map<Album>((value) => new Album.fromJson(value))
          .toList();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (albums != null) {
      _json["albums"] = albums.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// List of all media items from the user's Google Photos library.
class ListMediaItemsResponse {
  /// Output only. List of media items in the user's library.
  core.List<MediaItem> mediaItems;

  /// Output only. Token to use to get the next set of media items. Its presence
  /// is the only reliable indicator of more media items being available in the
  /// next request.
  core.String nextPageToken;

  ListMediaItemsResponse();

  ListMediaItemsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("mediaItems")) {
      mediaItems = (_json["mediaItems"] as core.List)
          .map<MediaItem>((value) => new MediaItem.fromJson(value))
          .toList();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (mediaItems != null) {
      _json["mediaItems"] =
          mediaItems.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// List of shared albums requested.
class ListSharedAlbumsResponse {
  /// Output only. Token to use to get the next set of shared albums. Populated
  /// if there are more shared albums to retrieve for this request.
  core.String nextPageToken;

  /// Output only. List of shared albums.
  core.List<Album> sharedAlbums;

  ListSharedAlbumsResponse();

  ListSharedAlbumsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("sharedAlbums")) {
      sharedAlbums = (_json["sharedAlbums"] as core.List)
          .map<Album>((value) => new Album.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    if (sharedAlbums != null) {
      _json["sharedAlbums"] =
          sharedAlbums.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Represents a physical location.
class Location {
  /// Position of the location on the map.
  LatLng latlng;

  /// Name of the location to be displayed.
  core.String locationName;

  Location();

  Location.fromJson(core.Map _json) {
    if (_json.containsKey("latlng")) {
      latlng = new LatLng.fromJson(_json["latlng"]);
    }
    if (_json.containsKey("locationName")) {
      locationName = _json["locationName"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (latlng != null) {
      _json["latlng"] = (latlng).toJson();
    }
    if (locationName != null) {
      _json["locationName"] = locationName;
    }
    return _json;
  }
}

/// An enrichment containing a single location.
class LocationEnrichment {
  /// Location for this enrichment item.
  Location location;

  LocationEnrichment();

  LocationEnrichment.fromJson(core.Map _json) {
    if (_json.containsKey("location")) {
      location = new Location.fromJson(_json["location"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (location != null) {
      _json["location"] = (location).toJson();
    }
    return _json;
  }
}

/// An enrichment containing a map, showing origin and destination locations.
class MapEnrichment {
  /// Destination location for this enrichemt item.
  Location destination;

  /// Origin location for this enrichment item.
  Location origin;

  MapEnrichment();

  MapEnrichment.fromJson(core.Map _json) {
    if (_json.containsKey("destination")) {
      destination = new Location.fromJson(_json["destination"]);
    }
    if (_json.containsKey("origin")) {
      origin = new Location.fromJson(_json["origin"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (destination != null) {
      _json["destination"] = (destination).toJson();
    }
    if (origin != null) {
      _json["origin"] = (origin).toJson();
    }
    return _json;
  }
}

/// Representation of a media item (such as a photo or video) in Google Photos.
class MediaItem {
  /// A URL to the media item's bytes. This shouldn't be used as is. Parameters
  /// should be appended to this URL before use. See the [developer
  /// documentation](https://developers.google.com/photos/library/guides/access-media-items#base-urls)
  /// for a complete list of supported parameters. For example, `'=w2048-h1024'`
  /// will set the dimensions of a media item of type photo to have a width of
  /// 2048 px and height of 1024 px.
  core.String baseUrl;

  /// Information about the user who created this media item.
  ContributorInfo contributorInfo;

  /// Description of the media item. This is shown to the user in the item's
  /// info section in the Google Photos app.
  core.String description;

  /// Filename of the media item. This is shown to the user in the item's info
  /// section in the Google Photos app.
  core.String filename;

  /// Identifier for the media item. This is a persistent identifier that can be
  /// used between sessions to identify this media item.
  core.String id;

  /// Metadata related to the media item, such as, height, width, or
  /// creation time.
  MediaMetadata mediaMetadata;

  /// MIME type of the media item. For example, `image/jpeg`.
  core.String mimeType;

  /// Google Photos URL for the media item. This link is available to
  /// the user only if they're signed in.
  core.String productUrl;

  MediaItem();

  MediaItem.fromJson(core.Map _json) {
    if (_json.containsKey("baseUrl")) {
      baseUrl = _json["baseUrl"];
    }
    if (_json.containsKey("contributorInfo")) {
      contributorInfo = new ContributorInfo.fromJson(_json["contributorInfo"]);
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("filename")) {
      filename = _json["filename"];
    }
    if (_json.containsKey("id")) {
      id = _json["id"];
    }
    if (_json.containsKey("mediaMetadata")) {
      mediaMetadata = new MediaMetadata.fromJson(_json["mediaMetadata"]);
    }
    if (_json.containsKey("mimeType")) {
      mimeType = _json["mimeType"];
    }
    if (_json.containsKey("productUrl")) {
      productUrl = _json["productUrl"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (baseUrl != null) {
      _json["baseUrl"] = baseUrl;
    }
    if (contributorInfo != null) {
      _json["contributorInfo"] = (contributorInfo).toJson();
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (filename != null) {
      _json["filename"] = filename;
    }
    if (id != null) {
      _json["id"] = id;
    }
    if (mediaMetadata != null) {
      _json["mediaMetadata"] = (mediaMetadata).toJson();
    }
    if (mimeType != null) {
      _json["mimeType"] = mimeType;
    }
    if (productUrl != null) {
      _json["productUrl"] = productUrl;
    }
    return _json;
  }
}

/// Result of retrieving a media item.
class MediaItemResult {
  /// Media item retrieved from the user's library. It's populated if no errors
  /// occurred and the media item was fetched successfully.
  MediaItem mediaItem;

  /// If an error occurred while accessing this media item, this field
  /// is populated with information related to the error. For details regarding
  /// this field, see Status.
  Status status;

  MediaItemResult();

  MediaItemResult.fromJson(core.Map _json) {
    if (_json.containsKey("mediaItem")) {
      mediaItem = new MediaItem.fromJson(_json["mediaItem"]);
    }
    if (_json.containsKey("status")) {
      status = new Status.fromJson(_json["status"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (mediaItem != null) {
      _json["mediaItem"] = (mediaItem).toJson();
    }
    if (status != null) {
      _json["status"] = (status).toJson();
    }
    return _json;
  }
}

/// Metadata for a media item.
class MediaMetadata {
  /// Time when the media item was first created (not when it was uploaded to
  /// Google Photos).
  core.String creationTime;

  /// Original height (in pixels) of the media item.
  core.String height;

  /// Metadata for a photo media type.
  Photo photo;

  /// Metadata for a video media type.
  Video video;

  /// Original width (in pixels) of the media item.
  core.String width;

  MediaMetadata();

  MediaMetadata.fromJson(core.Map _json) {
    if (_json.containsKey("creationTime")) {
      creationTime = _json["creationTime"];
    }
    if (_json.containsKey("height")) {
      height = _json["height"];
    }
    if (_json.containsKey("photo")) {
      photo = new Photo.fromJson(_json["photo"]);
    }
    if (_json.containsKey("video")) {
      video = new Video.fromJson(_json["video"]);
    }
    if (_json.containsKey("width")) {
      width = _json["width"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (creationTime != null) {
      _json["creationTime"] = creationTime;
    }
    if (height != null) {
      _json["height"] = height;
    }
    if (photo != null) {
      _json["photo"] = (photo).toJson();
    }
    if (video != null) {
      _json["video"] = (video).toJson();
    }
    if (width != null) {
      _json["width"] = width;
    }
    return _json;
  }
}

/// This filter defines the type of media items to be returned, for example,
/// videos or photos. All the specified media types are treated as an OR when
/// used together.
class MediaTypeFilter {
  /// The types of media items to be included. This field should be populated
  /// with only one media type. If you specify multiple media types, it results
  /// in an error.
  core.List<core.String> mediaTypes;

  MediaTypeFilter();

  MediaTypeFilter.fromJson(core.Map _json) {
    if (_json.containsKey("mediaTypes")) {
      mediaTypes = (_json["mediaTypes"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (mediaTypes != null) {
      _json["mediaTypes"] = mediaTypes;
    }
    return _json;
  }
}

/// A new enrichment item to be added to an album, used by the
/// `albums.addEnrichment` call.
class NewEnrichmentItem {
  /// Location to be added to the album.
  LocationEnrichment locationEnrichment;

  /// Map to be added to the album.
  MapEnrichment mapEnrichment;

  /// Text to be added to the album.
  TextEnrichment textEnrichment;

  NewEnrichmentItem();

  NewEnrichmentItem.fromJson(core.Map _json) {
    if (_json.containsKey("locationEnrichment")) {
      locationEnrichment =
          new LocationEnrichment.fromJson(_json["locationEnrichment"]);
    }
    if (_json.containsKey("mapEnrichment")) {
      mapEnrichment = new MapEnrichment.fromJson(_json["mapEnrichment"]);
    }
    if (_json.containsKey("textEnrichment")) {
      textEnrichment = new TextEnrichment.fromJson(_json["textEnrichment"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (locationEnrichment != null) {
      _json["locationEnrichment"] = (locationEnrichment).toJson();
    }
    if (mapEnrichment != null) {
      _json["mapEnrichment"] = (mapEnrichment).toJson();
    }
    if (textEnrichment != null) {
      _json["textEnrichment"] = (textEnrichment).toJson();
    }
    return _json;
  }
}

/// New media item that's created in a user's Google Photos account.
class NewMediaItem {
  /// Description of the media item. This will be shown to the user in the
  /// item's
  /// info section in the Google Photos app.
  /// This string shouldn't be more than 1000 characters.
  core.String description;

  /// A new media item that has been uploaded via the included `uploadToken`.
  SimpleMediaItem simpleMediaItem;

  NewMediaItem();

  NewMediaItem.fromJson(core.Map _json) {
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("simpleMediaItem")) {
      simpleMediaItem = new SimpleMediaItem.fromJson(_json["simpleMediaItem"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (description != null) {
      _json["description"] = description;
    }
    if (simpleMediaItem != null) {
      _json["simpleMediaItem"] = (simpleMediaItem).toJson();
    }
    return _json;
  }
}

/// Result of creating a new media item.
class NewMediaItemResult {
  /// Media item created with the upload token. It's populated if no errors
  /// occurred and the media item was created successfully.
  MediaItem mediaItem;

  /// If an error occurred during the creation of this media item, this field
  /// is  populated with information related to the error. For details regarding
  /// this field, see <a href="#Status">Status</a>.
  Status status;

  /// The upload token used to create this new media item.
  core.String uploadToken;

  NewMediaItemResult();

  NewMediaItemResult.fromJson(core.Map _json) {
    if (_json.containsKey("mediaItem")) {
      mediaItem = new MediaItem.fromJson(_json["mediaItem"]);
    }
    if (_json.containsKey("status")) {
      status = new Status.fromJson(_json["status"]);
    }
    if (_json.containsKey("uploadToken")) {
      uploadToken = _json["uploadToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (mediaItem != null) {
      _json["mediaItem"] = (mediaItem).toJson();
    }
    if (status != null) {
      _json["status"] = (status).toJson();
    }
    if (uploadToken != null) {
      _json["uploadToken"] = uploadToken;
    }
    return _json;
  }
}

/// Metadata that is specific to a photo, such as, ISO, focal length and
/// exposure time. Some of these fields may be null or not included.
class Photo {
  /// Aperture f number of the camera lens with which the photo was taken.
  core.double apertureFNumber;

  /// Brand of the camera with which the photo was taken.
  core.String cameraMake;

  /// Model of the camera with which the photo was taken.
  core.String cameraModel;

  /// Exposure time of the camera aperture when the photo was taken.
  core.String exposureTime;

  /// Focal length of the camera lens with which the photo was taken.
  core.double focalLength;

  /// ISO of the camera with which the photo was taken.
  core.int isoEquivalent;

  Photo();

  Photo.fromJson(core.Map _json) {
    if (_json.containsKey("apertureFNumber")) {
      apertureFNumber = _json["apertureFNumber"].toDouble();
    }
    if (_json.containsKey("cameraMake")) {
      cameraMake = _json["cameraMake"];
    }
    if (_json.containsKey("cameraModel")) {
      cameraModel = _json["cameraModel"];
    }
    if (_json.containsKey("exposureTime")) {
      exposureTime = _json["exposureTime"];
    }
    if (_json.containsKey("focalLength")) {
      focalLength = _json["focalLength"].toDouble();
    }
    if (_json.containsKey("isoEquivalent")) {
      isoEquivalent = _json["isoEquivalent"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (apertureFNumber != null) {
      _json["apertureFNumber"] = apertureFNumber;
    }
    if (cameraMake != null) {
      _json["cameraMake"] = cameraMake;
    }
    if (cameraModel != null) {
      _json["cameraModel"] = cameraModel;
    }
    if (exposureTime != null) {
      _json["exposureTime"] = exposureTime;
    }
    if (focalLength != null) {
      _json["focalLength"] = focalLength;
    }
    if (isoEquivalent != null) {
      _json["isoEquivalent"] = isoEquivalent;
    }
    return _json;
  }
}

/// Request to search for media items in a user's library.
///
/// If the album id is specified, this call will return the list of media items
/// in the album. If neither filters nor album id are
/// specified, this call will return all media items in a user's Google Photos
/// library.
///
/// If filters are specified, this call will return all media items in
/// the user's library that fulfill the filter criteria.
///
/// Filters and album id must not both be set, as this will result in an
/// invalid request.
class SearchMediaItemsRequest {
  /// Identifier of an album. If populated, lists all media items in
  /// specified album. Can't set in conjunction with any filters.
  core.String albumId;

  /// Filters to apply to the request. Can't be set in conjunction with an
  /// `albumId`.
  Filters filters;

  /// Maximum number of media items to return in the response. The default
  /// number
  /// of media items to return at a time is 25. The maximum
  /// `pageSize` is 100.
  core.int pageSize;

  /// A continuation token to get the next page of the results. Adding this to
  /// the request returns the rows after the `pageToken`. The `pageToken` should
  /// be the value returned in the `nextPageToken` parameter in the response to
  /// the `searchMediaItems` request.
  core.String pageToken;

  SearchMediaItemsRequest();

  SearchMediaItemsRequest.fromJson(core.Map _json) {
    if (_json.containsKey("albumId")) {
      albumId = _json["albumId"];
    }
    if (_json.containsKey("filters")) {
      filters = new Filters.fromJson(_json["filters"]);
    }
    if (_json.containsKey("pageSize")) {
      pageSize = _json["pageSize"];
    }
    if (_json.containsKey("pageToken")) {
      pageToken = _json["pageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (albumId != null) {
      _json["albumId"] = albumId;
    }
    if (filters != null) {
      _json["filters"] = (filters).toJson();
    }
    if (pageSize != null) {
      _json["pageSize"] = pageSize;
    }
    if (pageToken != null) {
      _json["pageToken"] = pageToken;
    }
    return _json;
  }
}

/// List of media items that match the search parameters.
class SearchMediaItemsResponse {
  /// Output only. List of media items that match the search parameters.
  core.List<MediaItem> mediaItems;

  /// Output only. Use this token to get the next set of media items. Its
  /// presence is the only reliable indicator of more media items being
  /// available
  /// in the next request.
  core.String nextPageToken;

  SearchMediaItemsResponse();

  SearchMediaItemsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("mediaItems")) {
      mediaItems = (_json["mediaItems"] as core.List)
          .map<MediaItem>((value) => new MediaItem.fromJson(value))
          .toList();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (mediaItems != null) {
      _json["mediaItems"] =
          mediaItems.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// Request to make an album shared in Google Photos.
class ShareAlbumRequest {
  /// Options to be set when converting the album to a shared album.
  SharedAlbumOptions sharedAlbumOptions;

  ShareAlbumRequest();

  ShareAlbumRequest.fromJson(core.Map _json) {
    if (_json.containsKey("sharedAlbumOptions")) {
      sharedAlbumOptions =
          new SharedAlbumOptions.fromJson(_json["sharedAlbumOptions"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (sharedAlbumOptions != null) {
      _json["sharedAlbumOptions"] = (sharedAlbumOptions).toJson();
    }
    return _json;
  }
}

/// Response to successfully sharing an album.
class ShareAlbumResponse {
  /// Output only. Information about the shared album.
  ShareInfo shareInfo;

  ShareAlbumResponse();

  ShareAlbumResponse.fromJson(core.Map _json) {
    if (_json.containsKey("shareInfo")) {
      shareInfo = new ShareInfo.fromJson(_json["shareInfo"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (shareInfo != null) {
      _json["shareInfo"] = (shareInfo).toJson();
    }
    return _json;
  }
}

/// Information about albums that are shared. This information is only included
/// if you created the album, it is shared and you have the sharing scope.
class ShareInfo {
  /// True if the user has joined the album. This is always true for the owner
  /// of the shared album.
  core.bool isJoined;

  /// A token that can be used by other users to join this shared album via the
  /// API.
  core.String shareToken;

  /// A link to the album that's now shared on the Google Photos website and
  /// app.
  /// Anyone with the link can access this shared album and see all of the items
  /// present in the album.
  core.String shareableUrl;

  /// Options that control the sharing of an album.
  SharedAlbumOptions sharedAlbumOptions;

  ShareInfo();

  ShareInfo.fromJson(core.Map _json) {
    if (_json.containsKey("isJoined")) {
      isJoined = _json["isJoined"];
    }
    if (_json.containsKey("shareToken")) {
      shareToken = _json["shareToken"];
    }
    if (_json.containsKey("shareableUrl")) {
      shareableUrl = _json["shareableUrl"];
    }
    if (_json.containsKey("sharedAlbumOptions")) {
      sharedAlbumOptions =
          new SharedAlbumOptions.fromJson(_json["sharedAlbumOptions"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (isJoined != null) {
      _json["isJoined"] = isJoined;
    }
    if (shareToken != null) {
      _json["shareToken"] = shareToken;
    }
    if (shareableUrl != null) {
      _json["shareableUrl"] = shareableUrl;
    }
    if (sharedAlbumOptions != null) {
      _json["sharedAlbumOptions"] = (sharedAlbumOptions).toJson();
    }
    return _json;
  }
}

/// Options that control the sharing of an album.
class SharedAlbumOptions {
  /// True if the shared album allows collaborators (users who have joined
  /// the album) to add media items to it. Defaults to false.
  core.bool isCollaborative;

  /// True if the shared album allows the owner and the collaborators (users
  /// who have joined the album) to add comments to the album. Defaults to
  /// false.
  core.bool isCommentable;

  SharedAlbumOptions();

  SharedAlbumOptions.fromJson(core.Map _json) {
    if (_json.containsKey("isCollaborative")) {
      isCollaborative = _json["isCollaborative"];
    }
    if (_json.containsKey("isCommentable")) {
      isCommentable = _json["isCommentable"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (isCollaborative != null) {
      _json["isCollaborative"] = isCollaborative;
    }
    if (isCommentable != null) {
      _json["isCommentable"] = isCommentable;
    }
    return _json;
  }
}

/// A simple media item to be created in Google Photos via an upload token.
class SimpleMediaItem {
  /// Token identifying the media bytes that have been uploaded to Google.
  core.String uploadToken;

  SimpleMediaItem();

  SimpleMediaItem.fromJson(core.Map _json) {
    if (_json.containsKey("uploadToken")) {
      uploadToken = _json["uploadToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (uploadToken != null) {
      _json["uploadToken"] = uploadToken;
    }
    return _json;
  }
}

/// The `Status` type defines a logical error model that is suitable for
/// different programming environments, including REST APIs and RPC APIs. It is
/// used by [gRPC](https://github.com/grpc). Each `Status` message contains
/// three pieces of data: error code, error message, and error details.
///
/// You can find out more about this error model and how to work with it in the
/// [API Design Guide](https://cloud.google.com/apis/design/errors).
class Status {
  /// The status code, which should be an enum value of google.rpc.Code.
  core.int code;

  /// A list of messages that carry the error details.  There is a common set of
  /// message types for APIs to use.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.List<core.Map<core.String, core.Object>> details;

  /// A developer-facing error message, which should be in English. Any
  /// user-facing error message should be localized and sent in the
  /// google.rpc.Status.details field, or localized by the client.
  core.String message;

  Status();

  Status.fromJson(core.Map _json) {
    if (_json.containsKey("code")) {
      code = _json["code"];
    }
    if (_json.containsKey("details")) {
      details = (_json["details"] as core.List)
          .map<core.Map<core.String, core.Object>>(
              (value) => (value as core.Map).cast<core.String, core.Object>())
          .toList();
    }
    if (_json.containsKey("message")) {
      message = _json["message"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (code != null) {
      _json["code"] = code;
    }
    if (details != null) {
      _json["details"] = details;
    }
    if (message != null) {
      _json["message"] = message;
    }
    return _json;
  }
}

/// An enrichment containing text.
class TextEnrichment {
  /// Text for this enrichment item.
  core.String text;

  TextEnrichment();

  TextEnrichment.fromJson(core.Map _json) {
    if (_json.containsKey("text")) {
      text = _json["text"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (text != null) {
      _json["text"] = text;
    }
    return _json;
  }
}

/// Request to unshare a shared album in Google Photos.
class UnshareAlbumRequest {
  UnshareAlbumRequest();

  UnshareAlbumRequest.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// Response of a successful unshare of a shared album.
class UnshareAlbumResponse {
  UnshareAlbumResponse();

  UnshareAlbumResponse.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// Metadata that is specific to a video, for example, fps and processing
/// status.
/// Some of these fields may be null or not included.
class Video {
  /// Brand of the camera with which the video was taken.
  core.String cameraMake;

  /// Model of the camera with which the video was taken.
  core.String cameraModel;

  /// Frame rate of the video.
  core.double fps;

  /// Processing status of the video.
  /// Possible string values are:
  /// - "UNSPECIFIED" : Video processing status is unknown.
  /// - "PROCESSING" : Video is being processed. The user sees an icon for this
  /// video in the Google Photos app; however, it isn't playable yet.
  /// - "READY" : Video processing is complete and it is now ready for viewing.
  /// - "FAILED" : Something has gone wrong and the video has failed to process.
  core.String status;

  Video();

  Video.fromJson(core.Map _json) {
    if (_json.containsKey("cameraMake")) {
      cameraMake = _json["cameraMake"];
    }
    if (_json.containsKey("cameraModel")) {
      cameraModel = _json["cameraModel"];
    }
    if (_json.containsKey("fps")) {
      fps = _json["fps"].toDouble();
    }
    if (_json.containsKey("status")) {
      status = _json["status"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (cameraMake != null) {
      _json["cameraMake"] = cameraMake;
    }
    if (cameraModel != null) {
      _json["cameraModel"] = cameraModel;
    }
    if (fps != null) {
      _json["fps"] = fps;
    }
    if (status != null) {
      _json["status"] = status;
    }
    return _json;
  }
}
