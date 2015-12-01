Pod::Spec.new do |s|
  s.name         = "AutoLayoutPlus"
  s.version      = "0.0.1"
  s.summary      = "A bit of steroids for AutoLayout, powered by Swift."
  s.homepage     = "https://github.com/ruipfcosta/AutoLayoutPlus"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Rui Costa" => "rui.pfcosta@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => 'https://github.com/ruipfcosta/AutoLayoutPlus.git', :tag => s.version }
  s.source_files = "AutoLayoutPlus/*.swift"
  s.requires_arc = true
end
