net.Receive( "sendToPlayer", function()
    local TOP_MESSAGE_TEXT = net.ReadString()
    local BOTTOM_MESSAGE_TEXT = net.ReadString()
    drawMessage( TOP_MESSAGE_TEXT, BOTTOM_MESSAGE_TEXT, TOP_MESSAGE_COLOR_VALUES, BOTTOM_MESSAGE_COLOR_VALUES )
end)

surface.CreateFont( "topMessageText", {
	font = "Colaborate-Regular",
	size = 40,
	weight = 500,
	antialias = true,
	shadow = true,
} )
surface.CreateFont( "bottomMessageText", {
	font = "Colaborate-Regular",
	size = 55,
	weight = 500,
	antialias = true,
	shadow = true,
} )

function drawMessage( TOP_MESSAGE_TEXT, BOTTOM_MESSAGE_TEXT, TOP_MESSAGE_COLOR_VALUES, BOTTOM_MESSAGE_COLOR_VALUES )

    local topMessageText = vgui.Create( "DLabel" )
    topMessageText:SetFont( "topMessageText" )
    topMessageText:SetText( TOP_MESSAGE_TEXT )
    topMessageText:SizeToContents()
    topMessageText:SetContentAlignment( 5 )
    local topMessageTextX, topMessageTextY = topMessageText:GetSize()
    topMessageText:SetPos( ( 0-topMessageTextX ), (ScrH()/4) )
    topMessageText:SetTextColor( Color( 255, 255, 255, 255 ) )
    topMessageText:MoveTo( (ScrW()/2)-(topMessageTextX/2), (ScrH()/4), 0.1, 15, 1 )
    topMessageText:AlphaTo( 0, 1, 20 )
    
    local bottomMessageText = vgui.Create( "DLabel" )
    bottomMessageText:SetFont( "bottomMessageText" )
    bottomMessageText:SetText( BOTTOM_MESSAGE_TEXT )
    bottomMessageText:SizeToContents()
    bottomMessageText:SetContentAlignment( 5 )
    local bottomMessageTextX, bottomMessageTextY = bottomMessageText:GetSize()
    bottomMessageText:SetPos( ScrW(), (ScrH()/4)+50 )
    bottomMessageText:SetTextColor( Color( 255, 255, 255, 255 ) )
    bottomMessageText:MoveTo( (ScrW()/2)-(bottomMessageTextX/2), (ScrH()/4)+30, 0.1, 15.3, 1 )
    bottomMessageText:AlphaTo( 0, 1, 20 )
end
