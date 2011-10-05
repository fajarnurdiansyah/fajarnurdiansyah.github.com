require "rubygems"
require "stringex"

## -- Misc Configs -- ##

public_dir      = "public"    # compiled site directory
source_dir      = "."    # source file directory
blog_index_dir  = 'source'    # directory for your blog's index page (if you put your index in source/blog/index.html, set this to 'source/blog')
deploy_dir      = "_deploy"   # deploy directory (for Github pages deployment)
stash_dir       = "_stash"    # directory to stash posts for speedy generation
posts_dir       = "_posts"    # directory for blog files
themes_dir      = ".themes"   # directory for blog files
new_post_ext    = "md"  # default new post file extension when using the new_post task
new_page_ext    = "markdown"  # default new page file extension when using the new_page task
server_port     = "4000"      # port for preview server eg. localhost:4000

#######################
# Working with Jekyll #
#######################

desc "preview the site in a web browser"
task :preview do
  raise "### You haven't set anything up yet. First run `rake install` to set up an Octopress theme." unless File.directory?(source_dir)
  puts "Starting to watch source with Jekyll and Compass. Starting Rack on port #{server_port}"
  jekyllPid = Process.spawn("jekyll --auto")
  compassPid = Process.spawn("compass watch")
  rackupPid = Process.spawn("rackup --port #{server_port}")

  trap("INT") {
    [jekyllPid, compassPid, rackupPid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
    exit 0
  }

  [jekyllPid, compassPid, rackupPid].each { |pid| Process.wait(pid) }
end

# usage rake newpost[type,my-new-post] or rake new_post['my new post'] or rake new_post (defaults to "new-post")
desc "Begin a new post in #{source_dir}/#{posts_dir}"
task :newpost, [:type, :title] do |t, args|
  require './plugins/titlecase.rb'
  mkdir_p "#{source_dir}/#{posts_dir}"
  args.with_defaults(:type => 'post', :title => 'new-post')
  type = args.type
  title = args.title

  case type
  when "post"
    posts_dir = "_posts"
  when "link"
    posts_dir = "links/_posts"
  when "quote"
    posts_dir = "quotes/_posts"
  when "photo"
    posts_dir = "photos/_posts"
  end
	
  filename = "#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.#{new_post_ext}"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: #{type}"
    if type == "quote"
      post.puts "title: \"Quote of the Day: #{title.gsub(/&/,'&amp;').titlecase}\""
    else
      post.puts "title: \"#{title.gsub(/&/,'&amp;').titlecase}\""
    end
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    post.puts "comments: false"
    if type == "link"
      post.puts "link: "
    end
    post.puts "intro: "
    post.puts "---"
    if type == "photo"
      post.puts "![image](/images/58570010.jpg)"
      post.puts "{:title='Caption' .shadow900}"
      post.puts "Caption. #{Time.now.strftime('%B %Y')}"
      post.puts "{: .caption}"
    end
    if type == "quote"
      post.puts "# \"Quote here\""
      post.puts "### -- [#{title}][author]"
      post.puts ""
      post.puts "[author]: http://author.com/"
    end
  end
end

def ok_failed(condition)
  if (condition)
    puts "OK"
  else
    puts "FAILED"
  end
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end

def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end

desc "list tasks"
task :list do
  puts "Tasks: #{(Rake::Task.tasks - [Rake::Task[:list]]).join(', ')}"
  puts "(type rake -T for more detail)\n\n"
end
