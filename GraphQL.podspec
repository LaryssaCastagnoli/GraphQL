Pod::Spec.new do |s|
  s.name             = 'LMGraphQL'
  s.version          = '0.0.1'
  s.summary          = 'LMGraphQL will help with your requests'
  s.description      = 'With LMGraphQL making requests will be easier, it helps in the creation of queries and mutations made in LMGraphQL.'
  s.homepage         = 'https://github.com/LaryssaCastagnoli/LMGraphQL'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors            = { 'Laryssa Castagnoli' => 'lcfragoso4@gmail.com', 'Millena Galvão Matos' => 'millena.gmatos@gmail.com' }
  s.source           = { :git => 'https://github.com/LaryssaCastagnoli/LMGraphQL.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'GraphQL/Classes/**/*'
  s.frameworks = 'UIKit'
  s.dependency "Alamofire", "~> 4.7.3"
  s.dependency "SwiftyJSON", "~> 4.2.0"
end
