#!/usr/bin/ruby

# request

## sends up the request to the website for dir bruteforcing.

require 'uri'
require 'net/http'

def request(website, wd)
    url = (website + wd) # wd => common.txt
    res = Net::HTTP.get_response(URI(url)) # converts the coming response to url.
    code = res.code.to_i # response code
    return code # retuning the code.
end