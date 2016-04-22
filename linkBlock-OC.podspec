Pod::Spec.new do |s|
  s.name         = "linkBlock-OC"
  s.version      = "0.1.0"
  s.summary      = "OC 链式语法"

  s.description  = <<-DESC
                   OC 链式语法.
                   DESC

  s.homepage     = "https://github.com/levyleo/linkBlock-OC"
  s.license          = 'MIT'
  s.author             = { "levy" => "lqcqc@sina.com" }
  s.social_media_url   = "https://github.com/levyleo/linkBlock-OC"

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/levyleo/linkBlock-OC.git", :tag => s.version }
  
  s.requires_arc = true
  s.source_files = 'linkBlock-OC/Sources/**/*'

end
