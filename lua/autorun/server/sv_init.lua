//Configuration Options:

ADDON_NAME = "[SGN] Welcome Message : "

//Is the add-on enabled?
//	true / false
local PLUGIN_ENABLED = true

//Do you want the message to also appear in the players chat box?
//	true / false
local PRINT_IN_CHAT = true

//Do you want others to get a notification telling them a player has connected?
//	true / false
//local TELL_ALL = true

//What message to do you want to display to the connecting user?
//  Change [server_name] to your servers name, or re-arrange the string to suit your needs! If you need help, just let me know!
//  $playername = players garry's mod nickname / display name
//  $playersteamid = players steam ID
local TOP_MESSAGE_TEXT = "Welcome, $playername, to"
local BOTTOM_MESSAGE_TEXT = "[insert server name here]"

//DO NOT TOUCH ANYTHING PAST THIS LINE//

resource.AddFile( "resource/fonts/ColabReg.ttf" )

if PLUGIN_ENABLED == true then
    print( ADDON_NAME .. "Player Login Message has started and is enabled." )
else
    print( ADDON_NAME .. "Player Login Message has started and is disabled." )
end
util.AddNetworkString( "sendToPlayer" )
util.AddNetworkString( "PlayerFullyLoaded" )

net.Receive( "PlayerFullyLoaded", function( _, ply )
	if not ply.IsFullyLoaded then
		ply.IsFullyLoaded = true
		hook.Call( "PlayerFullyLoaded", GAMEMODE, ply )
	end
end )

hook.Add( "PlayerFullyLoaded", "fbfs bfls", function( ply )
    if PLUGIN_ENABLED == true then
		local playerNick = ply:Nick()
        local playerSteamID = ply:SteamID()
        local TOP_MESSAGE_TEXT = string.gsub( TOP_MESSAGE_TEXT, "$playername", playerNick )
        local TOP_MESSAGE_TEXT = string.gsub( TOP_MESSAGE_TEXT, "$playersteamid", playerSteamID )
        local BOTTOM_MESSAGE_TEXT = string.gsub( BOTTOM_MESSAGE_TEXT, "$playername", playerNick )
        local BOTTOM_MESSAGE_TEXT = string.gsub( BOTTOM_MESSAGE_TEXT, "$playersteamid", playerSteamID )
		net.Start( "sendToPlayer" )
			net.WriteString( TOP_MESSAGE_TEXT )
            net.WriteString( BOTTOM_MESSAGE_TEXT )
		net.Send( ply )
		if PRINT_IN_CHAT == true then
			ply:ChatPrint( TOP_MESSAGE_TEXT .. " " .. BOTTOM_MESSAGE_TEXT )
		end
	end
end )
