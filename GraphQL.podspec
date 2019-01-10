#
# Be sure to run `pod lib lint swiftUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LMGraphQL'
  s.version          = '0.0.1'
  s.summary          = 'LMGraphQL will help with your requests'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'With LMGraphQL making requests will be easier, it helps in the creation of queries and mutations made in GraphiQL.'

  s.homepage         = 'https://github.com/LaryssaCastagnoli/LMGraphQL'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors            = { 'Laryssa Castagnoli' => 'lcfragoso4@gmail.com', 'Millena Galvão Matos" => millena.gmatos@gmail.com' }
  s.source           = { :git => "https://github.com/LaryssaCastagnoli/LMGraphQL.git", :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'GraphQL/Classes/**/*'
  

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency "Alamofire", "~> 4.7.3"
  s.dependency "SwiftyJSON", "~> 4.2.0"

end
