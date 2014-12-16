desc "Initialize sensitive data"
task :init_secrets do
  print "Please enter your slack API token: "
  token = STDIN.gets.chomp

  File.open('source/javascripts/secrets.js', 'w') do |file|
    file.write("var Secrets = { 'slackToken':'#{token}'}")
  end
end
