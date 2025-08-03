local resourceName = GetCurrentResourceName()
local currentVersion = GetResourceMetadata(resourceName, "version", 0)
local versionURL = "https://raw.githubusercontent.com/BehrTheDon/behr_elevator/main/fxmanifest.lua"

if Config.VersionCheckEnabled then
    Citizen.CreateThread(function()
        PerformHttpRequest(versionURL, function(code, data, headers)
            if code == 200 then
                local latestVersion = data:match("[\r\n]version%s+['\"](.-)['\"]")

                if latestVersion then
                    if latestVersion ~= currentVersion then
                        print("^6----------------------------------------------------------------")
                        print("^1[" .. resourceName .. "]^0 Update available!")
                        print("^1Current: ^0" .. currentVersion .. " | ^2Latest: ^0" .. latestVersion)
                        print("^5Get the latest version at: ^0https://github.com/BehrTheDon/behr_elevator")
                        print("^6----------------------------------------------------------------")
                    else
                        print("^2[" .. resourceName .. "]^0 is up to date! (v" .. currentVersion .. ") Thank you for using Behr Development Scripts!")
                    end
                else
                    print("^1[" .. resourceName .. "]^0 Couldn't parse latest version.")
                end
            else
                print("^1[" .. resourceName .. "]^0 Failed to fetch version info. HTTP Code: " .. code)
            end
        end, "GET", "", {})
    end)
end