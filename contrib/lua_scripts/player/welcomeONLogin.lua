function New_Char(event, player)
	SendWorldMessage("Nous vous souhaitons tous la bienvenue au nouveau joueur "..player:GetName().." sur Dream Eternity", 2)
	player:SendBroadcastMessage("Bonjour "..player:GetName()..", tout le monde vous souhaite la bienvenue sur Dream Eternity !")
end

RegisterPlayerEvent(30, New_Char)
