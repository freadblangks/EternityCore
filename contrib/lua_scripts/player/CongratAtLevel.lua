local function OnLevelUp(event, player, oldLevel)

	if player:GetLevel() == 20 then
		player:SendNotification('Félicitation pour votre niveau 20 !\nN\'oubliez pas d\'apprendre votre compétence de monte!')
	elseif player:GetLevel() == 40 then
		player:SendNotification('Félicitation pour votre niveau 40 !\nN\'oubliez pas d\'apprendre votre compétence de monte!')
	elseif player:GetLevel() == 60 then
		player:SendNotification('Félicitation pour votre niveau 60 !\nDirection l\'Outre-Terre!')
	elseif player:GetLevel() == 80 then
		player:SendNotification('Félicitation pour votre niveau 80 !\nLe Nordfendre n\'as plus de secret pour vous!\nLe vol par temps froid vous attend!')
	elseif player:GetLevel() == 90 then
		player:SendNotification('Félicitation pour votre niveau 90 !\nLa Pandarie est une île mystérieuse!\nLe vol des Sagesse des Quatre vents vous attend!')
	end
end
RegisterPlayerEvent(13, OnLevelUp)