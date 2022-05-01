-----------------------------------------------------------------------------------------------------------------------------------------------------

local ItemId = 90004;
local MenuId = 900004;
local Rebirth = {};
-----------------------------------------------------------------------------------------------------------------------------------------------------

Rebirth.Level={
	level
};
-----------------------------------------------------------------------------------------------------------------------------------------------------


Rebirth.Config = {
	--LevelRequisPourLancerLeRebirth
	MinLvl = 90;
	--DBName
	DbName = 'eternity_eluna';
	--RebirthLevel
	Level = 0; 
};
-----------------------------------------------------------------------------------------------------------------------------------------------------

CharDBQuery('CREATE DATABASE IF NOT EXISTS `'..Rebirth.Config.DbName..'` CHARACTER SET utf8mb4;');
CharDBQuery('CREATE TABLE IF NOT EXISTS `'..Rebirth.Config.DbName..'`.`Rebirth_characters` ( `guid` INT(10) NOT NULL, `account_id` INT(10) NOT NULL, `RebirthLevel` INT(10) NOT NULL DEFAULT 0, PRIMARY KEY (`guid`, `account_id`) );');
-----------------------------------------------------------------------------------------------------------------------------------------------------

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

function Item_Trigger(item, event, player)
    Item_menu(item, player);
end
-----------------------------------------------------------------------------------------------------------------------------------------------------

function Item_menu(event, player, object)
	if(player:IsInCombat())then
		player:SendNotification("|CFF00A2FFRetentez une fois votre combat fini!|r");
	else
    	player:GossipClearMenu() -- required for player gossip

    	Rebirth.GetRebirth(player);
		local pGuid = player:GetGUIDLow();

    	if(Rebirth.Level[pGuid].level >= 1) then
   			player:GossipMenuAddItem(3, "Amélioration d'état", 1, 1);
   			player:GossipMenuAddItem(8, "Restaurer la santé", 1, 2);
		end
		
		if(Rebirth.Level[pGuid].level >= 5) then
			player:GossipMenuAddItem(2, "Retirer le mal de résurrection", 1, 3);
		end
			
		if(Rebirth.Level[pGuid].level >= 8) then
			player:GossipMenuAddItem(3, "Réinitialiser le temps des sorts", 1, 4);
		end
		
		if(Rebirth.Level[pGuid].level >= 7) then
			player:GossipMenuAddItem(2, "Retirer le déserteur", 1, 5);
		end
	
		player:GossipMenuAddItem(7, "Fermer", 1, 6);
   		player:GossipSendMenu(1, object, MenuId);
   	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------


function OnSelect(event, player, id, sender, intid, code)
	if (intid == 1) then -- Buffs
		local pGuid = player:GetGUIDLow();
		if(Rebirth.Level[pGuid].level >= 1)then -- Rebirth 1
			player:CastSpell(player, 23768, true);
			player:CastSpell(player, 23769, true);
			player:CastSpell(player, 23737, true);
			player:CastSpell(player, 23766, true);
			player:CastSpell(player, 23735, true);
			player:CastSpell(player, 23736, true);
			player:CastSpell(player, 23738, true);
			player:CastSpell(player, 23767, true);
			player:CastSpell(player, 13165, true);
			player:CastSpell(player, 57330, true);
			player:CastSpell(player, 20217, true);
			player:CastSpell(player, 21562, true);
			if(Rebirth.Level[pGuid].level >= 2)then -- Rebirth 2
				player:CastSpell(player, 73413, true);
				player:CastSpell(player, 127250, true);
				if(Rebirth.Level[pGuid].level >= 3)then -- Rebirth 3
					player:CastSpell(player, 324, true);
					player:CastSpell(player, 546, true);
					if(Rebirth.Level[pGuid].level >= 4)then -- Rebirth 4
						player:CastSpell(player, 7481, true);
						player:CastSpell(player, 8258, true);
						if(Rebirth.Level[pGuid].level >= 5)then -- Rebirth 5
							player:CastSpell(player, 104287, true);
							player:CastSpell(player, 82061, true);
							if(Rebirth.Level[pGuid].level >= 6)then -- Rebirth 6
								player:CastSpell(player, 6673, true);
								player:CastSpell(player, 5697, true);
								player:CastSpell(player, 61316, true);
								player:CastSpell(player, 113742, true);
								if(Rebirth.Level[pGuid].level >= 7)then -- Rebirth 7
									player:CastSpell(player, 5915, true);
									player:CastSpell(player, 8599, true);
									if(Rebirth.Level[pGuid].level >= 8)then -- Rebirth 8
										player:CastSpell(player, 3136, true);
										player:CastSpell(player, 3149, true);
										if(Rebirth.Level[pGuid].level >= 9)then -- Rebirth 9
											player:CastSpell(player, 3424, true);
											player:CastSpell(player, 8990, true);
											if(Rebirth.Level[pGuid].level >= 10)then -- Rebirth 10
												player:CastSpell(player, 8263, true);
												player:CastSpell(player, 117667, true);
													if(Rebirth.Level[pGuid].level >= 11)then -- Rebirth 11
													player:CastSpell(player, 6942, true);
														if(Rebirth.Level[pGuid].level >= 12)then -- Rebirth 12
															player:CastSpell(player, 8269, true);
															player:CastSpell(player, 1459, true);
															player:CastSpell(player, 0, true);
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
			player:SendNotification("|CFF00A2FFVous bénéficiez de toutes les améliorations d'état possible !|r");
			player:GossipComplete();
		end
	end
	if (intid == 2) then -- Soigner
		player:SetHealth(player:GetMaxHealth());
		player:CastSpell(player, 31726, true);
		player:SendNotification("|CFF00A2FFVous revoila en bonne santé !|r");
        player:GossipComplete();
	end
	if (intid == 3) then -- Retirez le mal de résurrection
		player:RemoveAura(15007);
		player:CastSpell(player, 31726, true);
		player:SendNotification("|CFF00A2FFVous revoila prêt aux combats !|r");
        player:GossipComplete();
	end
	
	if (intid == 4) then -- Réinitialiser le temps des sorts
        player:ResetAllCooldowns()
		player:CastSpell(player, 31726, true);
		player:SendNotification("|CFF00A2FFVos temps de recharge de vos sorts ont été réinitialisés");
        player:GossipComplete()
    end
	
	if (intid == 5) then -- Retirez le déserteur
		player:RemoveAura(26013);
		player:CastSpell(player, 31726, true);
		player:SendNotification("|CFF00A2FFVous revoila prêt pour un nouveau champs de bataille !|r");
        player:GossipComplete();
	end

	if (intid == 6) then -- Ferme le GossipMenu
       	player:GossipComplete();
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------

RegisterItemGossipEvent(ItemId, 1, Item_menu);
RegisterItemGossipEvent(ItemId, 2, OnSelect);
-----------------------------------------------------------------------------------------------------------------------------------------------------