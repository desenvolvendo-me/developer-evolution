require 'octokit'

#Documation Gem: https://github.com/octokit/octokit.rb
class Apis::Github
  def initialize(args = {})
    @client = Octokit::Client.new(args)
  end

  def client
    @client
  end
end