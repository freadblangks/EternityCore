local function onCast(event, player, spell, skipCheck)
  if (spell:GetEntry() == 142878) then
    player:CastSpell(player, 1449, true);
  end
end
RegisterPlayerEvent(5, onCast)
