# Install Ruby and Gems
rbenv_ruby "2.0.0-p247" do
  ruby_version "2.0.0-p247"
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.0.0-p247"
end

rbenv_gem "rails" do
  ruby_version "2.0.0-p247"
end

package "nodejs"
package "libsqlite3-dev"