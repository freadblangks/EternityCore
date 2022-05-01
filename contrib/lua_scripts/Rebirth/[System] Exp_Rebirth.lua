local Rebirth = {};

Rebirth.Level={
	level
};

Rebirth.Config = {
	--LevelRequisPourLancerLeRebirth
	MinLvl = 90;
	--DBName
	DbName = 'eternity_eluna';
	--RebirthLevel
	Level = 0; 
};

function Rebirth.GetRebirth(player)
    local pGuid = player:GetGUIDLow();
    local RebirthNiv = CharDBQuery('SELECT RebirthLevel FROM `'..Rebirth.Config.DbName..'`.`Rebirth_characters` WHERE guid = '..pGuid..';');
    
    if(RebirthNiv)then
        Rebirth.Level[pGuid] = {
            level = RebirthNiv:GetUInt32(0),
        }
    end
    return Rebirth.Level[pGuid].level;
end

function Rebirth.OnReceiveExp(event, player, amount)
    local pGuid = player:GetGUIDLow();
    local ModExp = 0;

    Rebirth.GetRebirth(player);

    if(Rebirth.Level[pGuid].level >= 1)then
    	ModExp = amount * 0.1;
    	if(Rebirth.Level[pGuid].level >= 2)then
    		ModExp = amount * 0.2;
    		if(Rebirth.Level[pGuid].level >= 3)then
    			ModExp = amount * 0.3;
    			if(Rebirth.Level[pGuid].level >= 4)then
    				ModExp = amount * 0.4;
    				if(Rebirth.Level[pGuid].level >= 5)then
    					ModExp = amount * 0.5;
    					if(Rebirth.Level[pGuid].level >= 6)then
    						ModExp = amount * 0.6;
    						if(Rebirth.Level[pGuid].level >= 7)then
    							ModExp = amount * 0.65;
    							if(Rebirth.Level[pGuid].level >= 8)then
    								ModExp = amount * 0.7;
    								if(Rebirth.Level[pGuid].level >= 9)then
    									ModExp = amount * 0.75;    								
    									if(Rebirth.Level[pGuid].level >= 10)then
    										ModExp = amount * 0.85;
											if(Rebirth.Level[pGuid].level >= 11)then
												ModExp = amount * 0.85;
												if(Rebirth.Level[pGuid].level >= 12)then
													ModExp = amount * 0.85;
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
   	return amount - ModExp;
end
RegisterPlayerEvent(12, Rebirth.OnReceiveExp);