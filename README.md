# Algent

[![CI Status](http://img.shields.io/travis/miup/Algent.svg?style=flat)](https://travis-ci.org/miup/Algent)
[![Version](https://img.shields.io/cocoapods/v/Algent.svg?style=flat)](http://cocoapods.org/pods/Algent)
[![License](https://img.shields.io/cocoapods/l/Algent.svg?style=flat)](http://cocoapods.org/pods/Algent)
[![Platform](https://img.shields.io/cocoapods/p/Algent.svg?style=flat)](http://cocoapods.org/pods/Algent)

Algent is a type safe [algolia](https://algolia.com) wrapper library.

You can use algolia with Swift decodable type as a search result.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
Open `AppDelegate.swift` and set your AlgoliaSearch AppID and APIKey.

```Swift
Algent.initialize(appID: "YOUR_APP_ID", apiKey: "YOUR_API_KEY")
```

## custom search

Add search result model with implementing decodable

```Swift
class Diary: Decodable {
    let title: String
    let text: String
    // Algolia hash tag info
    _tags: [String]
}
```

Add search request class with implementing `AlgoliaRequestProtocol`

```Swift
struct SarchDiaryRequest: AlgoliaRequestProtocol {
    // set search result type
    typealias HitType = Diary

    let page: Int
    let per: Int
    let text: String?
    let hashtags: [String]?

    var indexName: String {
        return "diaries"
    }

    var query: AlgentQuery {
        let query = AlgentQuery(query: text)
        query.page = UInt(page)
        query.hitsPerPage = UInt(per)
        if let hashtags = hashtags {
            query.tagFilters = hashtags
        }
        return query
    }

    init(page: Int, per: Int, text: String? = nil, hashtags: [String]? = nil) {
        self.page = page
        self.per = per
        self.text = text
        self.hashtags = hashtags
    }
}
```

Call Algent search method using your request.

```Swift
let request = SarchDiaryRequest(page: 0, per: 20, text: "hello world", hashtags: ["trip"])
Algent.shared.search(request: request) { result in
    switch result {
    case .success(let response):
        // response is AlgoliaResponse<Request.HitType>
        print(response.hits) // see hit object
    case .failure( let error):
        print(error) // get error
    }
}
```

## Requirements

## Installation

Algent is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Algent'
```

## Author

miup, contact@miup.blue

## License

Algent is available under the MIT license. See the LICENSE file for more info.
