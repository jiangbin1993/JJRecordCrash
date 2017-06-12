Pod::Spec.new do |s|
s.name         = 'JJRecordCrash'
s.version      = ‘1.0.1’
s.summary      = 'A tool to record APP crash for iOS.'
s.homepage     = 'https://github.com/jiangbin1993/JJRecordCrash'
s.license      = 'MIT'
s.authors      = {'斌' => '848429811@qq.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/jiangbin1993/JJRecordCrash.git', :tag => s.version}
s.source_files = 'JJRecordCrash/**/*.{h,m}'
s.framework  = "UIKit"
s.requires_arc = true
end
