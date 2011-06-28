Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_expiration'
  s.version     = '0.50.0'
  s.summary     = 'This gem provides a scope and method to access product expiration'
  s.description = 'A product is considered to be expired if the deleted_at for the product is greater than now'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Michael Guterl'
   s.homepage          = 'https://github.com/recruitmilitary/spree-product-expiration/blob/master/product_expiration_extension.rb'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.50.0')
end
