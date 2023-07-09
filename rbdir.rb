#!/usr/bin/ruby

## LETS ADD IT INTO THE MAIN CODE, THE ARGS IS NOT REQUIRED

require_relative "lib/request"
require_relative "lib/init"

arg_one = ARGV[0]
parse_one = ARGV[1]
arg_two = ARGV[2]
parse_two = ARGV[3]

if(arg_one == "--help" || arg_one == "h")
    puts "Usage:  #{$0} [-h || --help] to show the help menu
        #{$0} [-u || --url] attack the target url.
        #{$0} [-w || --wordlist] custom wordlist
    "
    exit(0)
end

if not arg_one
    puts "Invalid Argument"
    puts "Usage:  #{$0} [-h || --help] to show the help menu
        #{$0} [-u || --url] attack the target url.
        #{$0} [-w || --wordlist] custom wordlist
    "
    exit(0)
end

if(arg_one)
    red = "\033[1;31m"
    green = "\033[1;32m"
    yellow = "\033[1;33m"
    cyan = "\033[1;36m"
    reset = "\033[0;0m"

    init_message()
    begin
        require_relative "lib/request"
    rescue LoadError
        error_initial()

    url = arg_one
    line = File.readlines('wordlist/common.txt')

    # forgotted to add the http and https method.

    for i in line
        if not url.end_with? '/' and not url.include? 'https:'
            new_url='https://'+url+'/'
            begin
                current_message(new_url)
                if(request(new_url, i.strip()) == 200)
                    puts(new_url + "#{green}" + i.strip()+"#{reset}")
                else
                end
            rescue Errno::ECONNREFUSED => e
                request(new_url,i.strip())
            end
        end

        if url.include? 'https:' and not url.end_with? '/'
            new_url = url+'/'
            begin
                current_message(new_url)
                if(request(new_url, i.strip()) == 200)
                    puts(new_url+"#{green}" + i.strip()+"#{reset}")
                else
                end
            rescue Errno::ECONNREFUSED => e
                request(new_url, i.strip())
            end
        end

        if not url.include? '/' and not url.include? 'https:'
            new_url = 'https://' + url
            begin
                current_message(new_url)
                if(request(new_url, i.strip())==200)
                    puts(new_url+"#{green}"+i.strip() + "#{reset}")
                else
                end
            rescue Errno::ECONNREFUSED => e 
                request(new_url, i_strip())
            end
        end

        begin
            request(url, i.strip())
            if (request(url, i.strip()) == 200)
                puts(url + "#{green}" + i.strip() + "#{reset}")
            end
        rescue SignalException => e
            puts "\n#{reset}[#{red}!#{reset}] Cntrl-C Detected!\n Qutting!!"
            exit(0)
        rescue => e
            request(url, i.strip())
        end
    end

    end

 
end