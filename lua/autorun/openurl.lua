local addonVersion = "1.1.4"

local function addFile( File, Type )
    if ( Type == "server" ) then
        print("[OpenURL] Include: " .. File )
        include("autorun/" .. Type .. "/" .. File )
    else
        print("[OpenURL] Added: " .. File )
        AddCSLuaFile("autorun/" .. Type .. "/" .. File )
        print("[OpenURL] Include: " .. File )
        include("autorun/" .. Type .. "/" .. File )
    end
end

if ( SERVER ) then
    print("[OpenURL] Loading OpenURL...")
    print("[OpenURL] Author: viral32111")
    print("[OpenURL] Version: " .. addonVersion )

	util.AddNetworkString("OpenURLRequest")

    addFile("sv_commands.lua", "server")
    addFile("sv_request.lua", "server")
    addFile("cl_webmenu.lua", "client")
    addFile("cl_requestmenu.lua", "client")
    addFile("cl_selectmenu.lua", "client")

    print("[OpenURL] Finished loading OpenURL!")
end

if ( CLIENT ) then
    print("[OpenURL] This server is using OpenURL! (Version: " .. addonVersion .. ") (Created by viral32111)")
end

hook.Add("PostGamemodeLoaded", "OpenURLLoad", function()
	http.Fetch( "https://raw.githubusercontent.com/viral32111/openurl/master/VERSION.md",
	    function( body, len, headers, code )
	        local formattedBody = string.gsub( body, "\n", "")
	        if ( formattedBody == addonVersion ) then
	            print("[OpenURL] You are running the most recent version of OpenURL!")
            elseif ( formattedBody == "404: Not Found" ) then
                Error("[OpenURL] Error: Version page does not exist\n")
	        else
	            print("[OpenURL] You are using outdated version of OpenURL! (Latest: " .. formattedBody .. ", Yours: " .. addonVersion .. ")" )
	        end
	    end,
	    function( error )
	        Error("[OpenURL] Error: Failed to get addon version\n")
	    end
	    )
end )