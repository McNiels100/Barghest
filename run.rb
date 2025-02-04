#!/usr/bin/env ruby
require_relative("data/barghest.rb")

barghest = Barghest.new

barghest.change_terminal_size("130", "70")
barghest.open_file("data/the_heist.mp3")

ascii_art_barghest = File.read("data/ascii-barghest.txt")
ascii_art_nicklas_jensen = File.read("data/ascii-nicklas-jensen.txt")
ansi_color_code = "\e[32m"

# Prints ASCII art line for line with a delay
ascii_art_barghest.lines.each do |line|
    puts ansi_color_code + line
    sleep(0.2)
end

barghest.change_wallpaper("data/58731e6f875d7424e29bc511e2b7c67532b9f1f2.png")

ascii_art_nicklas_jensen.lines.each do |line| # Maybe make into a Method
    puts line
    sleep(0.2)
end

barghest.open_file("data/barghest_logo.jpg", 20)

gets