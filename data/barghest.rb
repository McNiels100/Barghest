class Barghest

    def detect_os
        case RUBY_PLATFORM

        when /linux/
            "Linux"
        when /darwin/
            "macOS"
        when /mswin|mingw|cyqwin/
            "Windows"
        else
            "Unknown OS"
        end
    end

    def change_wallpaper image_path
        path_to_relative = File.expand_path(image_path) # Changes a relative path to an abselute to make sure it finds the file

        if (detect_os == "Linux") 
            system("gsettings set org.gnome.desktop.background picture-uri file://#{path_to_relative}")
            system("gsettings set org.gnome.desktop.background picture-uri-dark file://#{path_to_relative}") 
        elsif detect_os == "Windows"
            # Run Windows change wallpaper code here
            wallpaper_style = 2 # 0 for tile, 1 for center, 2 for stretch

            system("reg add \"HKCU\\Control Panel\\Desktop\" /v Wallpaper /t REG_SZ /d \"#{path_to_relative}\" /f")
            system("reg add \"HKCU\\Control Panel\\Desktop\" /v WallpaperStyle /t REG_SZ /d #{wallpaper_style} /f")
            system("RUNDLL32.EXE USER32.DLL, UpdatePerUserSystemParameters 1, True")
            system("shutdown /r /c \"Barghest is taking over in 60 sec.\" /t 60")
            
        elsif detect_os == "macOS"
            # Run macOS wallpaper code
            script = <<~SCRIPT
                tell application "System Events"
                set picture of every desktop to "#{image_path}"
             end tell
            SCRIPT
            system("osascript -e '#{script}'")
        end
    end

    def change_terminal_size (cols, lines)
        print "\e[8;#{lines};#{cols}t"

        puts "Barghest is taking over."
        puts "Terminal resized to #{cols}x#{lines}."
    end

    def open_file (path, number_of_times = 1)
        path_to_relative = File.expand_path(path)
        sleeper_open_image = sleep(0.2)
    
        if (detect_os == "Linux")

            number_of_times.times do
                system("xdg-open #{path_to_relative}")
                sleeper_open_image
            end
        elsif detect_os == "macOS"

            number_of_times.times do 
                system("open #{path_to_relative}")
                sleeper_open_image
            end
        elsif detect_os == "Windows"

            number_of_times.times do 
                system("start #{path_to_relative}")
                sleeper_open_image
            end
        end
    end
    
end