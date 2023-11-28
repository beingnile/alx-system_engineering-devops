# Regular Expressions.

The aim of this project is to learn the basics of Regex
and to dabble with the concept a bit.  
Each file is a ruby script which takes a string as a command line argument and attempts to match the string to the regex pattern in the file.  
The script then prints out the match to stdout if found and nothing unless otherwise.  

## Getting started.

> This project is NOT a software system, rather, a few files and tools that helped me understand regular expressions better.

### Requirements.

You can have the source code files locally so that you can play a bit with regex concepts.
Each file on this directory basically works the same way and follows the same structure:

```rb

puts ARGV[0].scan(/127.0.0.[0-9]/).join

```

You'll however notice a difference in characters between `/` and `/` in each file. This is because each file is meant to use a different regex pattern to match specific characters.

This project was written and tested on Ubuntu 22.10 LTS.
However, any system supporting [ruby](https://www.ruby-lang.org/en/) might probably work.  

* Clone the repo locally

```sh

git clone https://github.com/beingnile/alx-system_engineering-devops

```

* Navigate to this directory

```sh

cd alx-system_engineering-devops/0x06-regular_expressions

```

### Using the files.
