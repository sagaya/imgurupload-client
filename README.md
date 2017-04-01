# imgurupload-client

[![CI Status](http://img.shields.io/travis/cosmo1234/imgurupload-client.svg?style=flat)](https://travis-ci.org/cosmo1234/imgurupload-client)
[![Version](https://img.shields.io/cocoapods/v/imgurupload-client.svg?style=flat)](http://cocoapods.org/pods/imgurupload-client)
[![License](https://img.shields.io/cocoapods/l/imgurupload-client.svg?style=flat)](http://cocoapods.org/pods/imgurupload-client)
[![Platform](https://img.shields.io/cocoapods/p/imgurupload-client.svg?style=flat)](http://cocoapods.org/pods/imgurupload-client)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Basic Usage

```swift
import imgurupload_client


ImgurUpload.upload(imageData: imageData!, apiKey: "<IMGUR_API_KEY>", completionHandler: { (response) in
    print(response)
})
```


## Installation

imgurupload-client is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "imgurupload-client"
```

## Author

cosmo1234, harpheezsagaya@gmail.com

## License

imgurupload-client is available under the MIT license. See the LICENSE file for more info.
