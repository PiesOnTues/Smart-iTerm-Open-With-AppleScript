on run {input, parameters}
	# Grab folder path first, before anything changes focus
	try
		tell application "Finder"
			set finderWindow to front window
			set currentFolder to (target of finderWindow) as alias
			set folderPath to POSIX path of currentFolder
		end tell
	on error
		set folderPath to (POSIX path of (path to home folder))
	end try
	
	tell application "System Events"
		set iTermActive to (exists process "iTerm2")
	end tell
	
	tell application "iTerm"
		activate
		if iTermActive then
			set newWindow to (create window with default profile)
		else
			delay 0.5
			set newWindow to current window
		end if
		
		tell newWindow
			tell current session
				write text "cd " & quoted form of folderPath
				write text "clear"
			end tell
		end tell
	end tell
	
	return input
end run
