local IdItem = 900006;

local function onReceiveExp(event, player, amount)
    player:GiveXP(1500);
    return amount;
end


local function onUseParcho(event, player, item)
  local iEntry = item:GetEntry();
  local pLevel = player:GetLevel();

    if (pLevel <= 89) then
        onReceiveExp(event, player, amount, victim);
        player:RemoveItem( IdItem, 1);
    else
        player:SendNotification('Vous êtes déjà au niveau maximum ! Félicitation !');
    end
end

RegisterItemEvent(IdItem, 2, onUseParcho);
