require 'rjb'

Rjb::load(File.join(Rails.root, 'lib','lunarToSolar.jar'))
$lunartosolar = Rjb::import("lunartosolar")