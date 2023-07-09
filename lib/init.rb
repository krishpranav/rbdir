#!/usr/bin/ruby

# init

## Initalizer(color, default message, help prompt)

def init_message() 
    red = "\033[1;31m"
    green = "\033[1;32m"
    yellow = "\033[1;33m"
    cyan = "\033[1;36m"
    reset = "\033[0;0m"
    initial_msg = "
#{reset}[#{green}##{reset}] This is a free & open-source software
#{reset}[#{green}##{reset}] Not Built For Harming Others.
#{reset}[#{cyan}+#{reset}] Initializing The Program...

#{reset}[#{cyan}+#{reset}] Loading The Scripts
    "

    begin
        print initial_msg
        sleep 2
    rescue SignalException => e
        puts "\n#{reset}[#{red}!#{reset}] Cntrl-C detected, Quitting..."
        exit(0)
    end
end

def error_initial()
    red = "\033[1;31m="
    reset = "\033[0;0m"
    puts "#{reset}[#{red}!#{reset}] Missing files! Occured error while initializing the program"
    exit(0)
end

def current_message(url)
    red = "\033[1;31m"
    green = "\033[1;32m"
    yellow = "\033[1;33m"
    cyan = "\033[1;36m"
    reset = "\033[0;0m"
    puts "#{reset}[#{green}##{reset}] Bruteforcing #{url}"
end