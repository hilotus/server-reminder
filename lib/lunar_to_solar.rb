require 'rjb'

Rjb::load( File.join(Rails.root, 'lib','lunarToSolar.jar') , ['-Xmx1024m'])
$lunartosolar = Rjb::import("lunartosolar")