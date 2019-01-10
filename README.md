# LMGraphQL

## Example

In AppDelegate.swift, just import LMGraphQL framework and config LMGraphQLPrivate and LMGraphQLPublic.

```swift
import LMGraphQL

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

      LMGraphQLPrivate.config(apiURL: "url private api")
      LMGraphQLPublic.config(clientId: "", clientSecret: "", apiURL: "url public api")

      return true
    }
}
```

To create a new query, you must create a file with the extension .query and put its query or mutation structure, only the text, example login.query

```swift
mutation login($input: LoginInput!){
login(input: $input){
token {
accessToken
}
errors
}
}
```

In the request, LMGraphQL requests some mandatory parameters: the response, which should inherit from LMResponse, the queryType which is a string, and in it you must pass the exact name of your .query file, in this case it will be "login", and the client which will contain the clientId and clientSecret and the url, remembering that these client items are already configured in the appDelegate. There are two parameters that are optional, the attributes and the variables.

```swift
func login(){
    LMGraphQLExpect<ResponseLogin>.with(queryType: "login", client: LMGraphQLPublic(), variables: [:]) { response in


    }
}
```
To pass the token in bearer, just pass the returned string, as the example below and in the next requests it will be sent.

```swift
LMGraphQLTokenBearer.saveToken(token: "")
```

And delete

```swift
LMGraphQLTokenBearer.deleteToken()
```

## Requirements

## Installation

LMGraphQL is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LMGraphQL'
```

## Authors

Laryssa Castagnoli, Millena Galvão

