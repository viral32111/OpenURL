local addonVersion = "1.1.2"

if ( SERVER ) then
    print("\nLoading OpenURL...")
    print("  Author: viral32111")
    print("  Issues: https://github.com/viral32111/openurl/issues")
    print("  Steam: http://steamcommunity.com/id/viral32111")
    print("  Contact: viral32111@hotmail.com")
    print("  Wiki: https://github.com/viral32111/openurl/wiki")

    http.Fetch( "https://raw.githubusercontent.com/viral32111/openurl/master/VERSION.md",
        function( body, len, headers, code )
            local formattedBody = string.gsub( body, "\n", "")
            if ( formattedBody == addonVersion ) then
                print("You are running the most recent version of OpenURL (" .. formattedBody .. ")")
            else
                print("You are using outdated version of OpenURL!\n Latest version: " .. formattedBody .. "\n Your version: " .. addonVersion )
            end
        end,
        function( error )
            print("Failed to Fetch HTTP")
        end
    )

    include("autorun/client/cl_web_menu.lua")
    include("autorun/client/cl_select_menu.lua")
    include("autorun/server/sv_commands.lua")

    print("Finished loading OpenURL!\n")
end

if ( CLIENT ) then
    print("This server is using OpenURL (" .. addonVersion .. ") (Created by viral32111)")
end
