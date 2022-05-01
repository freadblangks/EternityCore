--------------------------------------------------------------------------------- ID NPC

local npcid = 182790

--------------------------------------------------------------------------------- ID NPC

--------------------------------------------------------------------------------- CONFIG DB
local Rebirth = {};
Rebirth.Config = {
	--LevelRequisPourLancerLeRebirth
	MinLvl = 90;
	--DBName
	DbName = 'eternity_eluna';
	--RebirthLevel
	Level = 0; 
};

--CréationDeTableDB
CharDBQuery('CREATE DATABASE IF NOT EXISTS `'..Rebirth.Config.DbName..'` CHARACTER SET utf8mb4;');
CharDBQuery('CREATE TABLE IF NOT EXISTS `'..Rebirth.Config.DbName..'`.`Rebirth_characters` ( `guid` INT(10) NOT NULL, `account_id` INT(10) NOT NULL, `RebirthLevel` INT(10) NOT NULL DEFAULT 0, PRIMARY KEY (`guid`, `account_id`) );');

Rebirth.Level={
	level
};

function Rebirth.GetRebirth(player)

    local pGuid = player:GetGUIDLow();

    local RebirthNiv = CharDBQuery('SELECT RebirthLevel FROM `'..Rebirth.Config.DbName..'`.`Rebirth_characters` WHERE guid = '..pGuid..';');
    
    if(RebirthNiv)then
        Rebirth.Level[pGuid] = {
            level = RebirthNiv:GetUInt32(0),
        }
    else
        local createAccount = CharDBQuery('INSERT INTO `'..Rebirth.Config.DbName..'`.`Rebirth_characters` (guid, account_id) VALUES ('..pGuid..', '..player:GetAccountId()..');');
        Rebirth.Level[pGuid] = {
            level = 0,
        }
    end
    return Rebirth.Level[pGuid].level;
end

--------------------------------------------------------------------------------- CONFIG DB

--------------------------------------------------------------------------------- GOSSIP HELLO

function Rebirth.onGossipHello(unit, player, creature) -- Gossip du pnj
	if (player:GetLevel() >= 90) then -- Condition si le joueur est level 90
			player:GossipClearMenu();
			player:GossipMenuAddItem(9, 'Je souhaite commencer mon rebirth.', 1, 100); -- 9 correspond a l'icone, 1 correspond au sender (NPC), 100 est l'intid qui renvoi vers un autre gossip
			player:GossipMenuAddItem(7, 'Je ne souhaite pas le faire tout de suite... Au revoir.', 1, 101); -- 7 correspond a l'icone, 1 correspond au sender (NPC), 101 est l'intid qui renvoi vers un autre gossip
			player:GossipSendMenu(1, creature)
	else
 	   player:SendNotification('|cffff0000Revenez au level 90 !|r'); -- Notification de condition si le joueur est level 90
	end
end

RegisterCreatureGossipEvent(182790, 1, Rebirth.onGossipHello)

--------------------------------------------------------------------------------- GOSSIP HELLO

--------------------------------------------------------------------------------- GOSSIP SELECT

function Rebirth.onGossipSelect(unit, player, creature, sender, intid, code, menu_id, spell)
	local pGuid = player:GetGUIDLow();
	
	-- Proposer un choix si il veut ou pas rebirth.
	
	if(intid == 100)then
		Rebirth.GetRebirth(player)
		local pGuid = player:GetGUIDLow();
		player:GossipMenuAddItem(4,'|cffff0000Nous allons proceder à votre rebirth, êtes vous prêt?|r', 1, 102); -- Box fenêtre si oui ou non le joueur est prêt à faire le Rebirth
		player:GossipSendMenu(1, creature)
	end
	
	if(intid == 101) then
		player:SendNotification('|cffff0000Revenez me voir quand vous serez prêt.|r'); -- Notification si le joueur sera prêt à faire le Rebirth
		player:GossipComplete();
	end

		if (intid == 102) then
		local pGuid = player:GetGUIDLow();
		if(Rebirth.Level[pGuid].level == 12) then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth maximum !|r'); -- Notification si le joueur à atteint le Rebirth maximum
			player:GossipComplete();
		else
			Rebirth.Level[pGuid].level = Rebirth.Level[pGuid].level + 1;
			if(Rebirth.Level[pGuid].level == 1)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 1 !|r'); -- Notification si le joueur à atteint le Rebirth 1
				player:AddItem(90004, 1);
				player:AddItem(900006, 25);
				player:AddItem(900008, 5);
		else
			if(Rebirth.Level[pGuid].level == 2)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 2 !|r'); -- Notification si le joueur à atteint le Rebirth 2
				player:AddItem(900006, 30);
				player:AddItem(900008, 10);
				player:AddItem(71665, 1);
		else
			if(Rebirth.Level[pGuid].level == 3)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 3 !|r'); -- Notification si le joueur à atteint le Rebirth 3
				player:AddItem(900006, 40);
				player:AddItem(900008, 20);
				player:AddItem(104253, 1);
		else
			if(Rebirth.Level[pGuid].level == 4)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 4 !|r'); -- Notification si le joueur à atteint le Rebirth 4
				player:AddItem(900006, 50);
				player:AddItem(900008, 30);
				player:AddItem(109013, 1);
		else
			if(Rebirth.Level[pGuid].level == 5)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 5 !|r'); -- Notification si le joueur à atteint le Rebirth 5
				player:AddItem(900006, 60);
				player:AddItem(900008, 40);
				player:AddItem(106246, 1);
		else
			if(Rebirth.Level[pGuid].level == 6)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 6 !|r'); -- Notification si le joueur à atteint le Rebirth 6
				player:AddItem(900006, 70);
				player:AddItem(900008, 50);
				player:AddItem(78924, 1);
		else
			if(Rebirth.Level[pGuid].level == 7)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 7 !|r'); -- Notification si le joueur à atteint le Rebirth 7
				player:AddItem(900006, 80);
				player:AddItem(900008, 60);
				player:AddItem(69846, 1);
		else
			if(Rebirth.Level[pGuid].level == 8)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 8 !|r'); -- Notification si le joueur à atteint le Rebirth 8
				player:AddItem(900006, 90);
				player:AddItem(900008, 70);
				player:AddItem(69224, 1);
		else
			if(Rebirth.Level[pGuid].level == 9)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 9 !|r'); -- Notification si le joueur à atteint le Rebirth 9
				player:AddItem(900006, 100);
				player:AddItem(900008, 80);
				player:AddItem(63042, 1);
		else
			if(Rebirth.Level[pGuid].level == 10)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 10 !|r'); -- Notification si le joueur à atteint le Rebirth 10
				player:AddItem(900006, 110);
				player:AddItem(900008, 90);
				player:AddItem(93671, 1);
		else
			if(Rebirth.Level[pGuid].level == 11)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 11 !|r'); -- Notification si le joueur à atteint le Rebirth 11
				player:AddItem(900006, 120);
				player:AddItem(900008, 100);
				player:AddItem(104269, 1);
		else
			if(Rebirth.Level[pGuid].level == 12)then
			player:SendNotification('|CFF00A2FFFélicitation ! Vous avez atteint le Rebirth 12 !|r'); -- Notification si le joueur à atteint le Rebirth 12
				player:AddItem(900006, 130);
				player:AddItem(900008, 110);
				player:AddItem(87777, 1);
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
			-- Si le joueur accepte, Incrémentation de son rebirth et met son personnage level 1
			CharDBQuery('UPDATE `'..Rebirth.Config.DbName..'`.`Rebirth_characters` SET `RebirthLevel` = '..Rebirth.Level[pGuid].level..' WHERE guid = '..pGuid..';'); -- Incrémentation RebirthLevel dans la DB

			player:SetLevel(1) -- Rétablissement du niveau 1 du joueur
			player:SendNotification('|cffff0000Nous procédons à votre rebirth, bonne chance à vous !|r'); -- Notification de la procédure du Rebirth
			player:GossipComplete();
			end
		end
	end
	
RegisterCreatureGossipEvent(182790, 2, Rebirth.onGossipSelect)

--------------------------------------------------------------------------------- GOSSIP SELECT