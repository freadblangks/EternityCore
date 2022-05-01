--[==[
    = How to add new locations =
    Example:
    The first line will be the main menu ID (Here [1], 
    increment this for each main menu option!),
    the main menu gossip title (Here "Horde Cities"),
    as well as which faction can use the said menu (Here 1 (Horde)). 
    0 = Alliance, 1 = Horde, 2 = Both
    The second line is the name of the main menu's sub menus, 
    separated by name (Here "Orgrimmar") and teleport coordinates
    using Map, X, Y, Z, O (Here 1, 1503, -4415.5, 22, 0)
    [1] = { "Horde Cities", 1,    --  This will be the main menu title, as well as which faction can use the said menu. 0 = Alliance, 1 = Horde, 2 = Both
        {"Orgrimmar", 1, 1503, -4415.5, 22, 0},
    },
    You can copy paste the above into the script and change the values as informed.
]==]

local ItemEntry = 90007

local T = {
    [1] = { "Villes de la Horde", 1,
        {"Orgrimmar", 1, 1481.086060, -4419.018555, 25.406805, 0.107603},
        {"Fossoyeuse", 0, 1831, 238.5, 61.6, 0},
        {"Pitons du Tonnerre", 1, -1278, 122, 132, 0},
        {"Lune d'Argent", 530, 9484, -7294, 15, 0},
		{"Sanctuaire des Deux-Lunes", 870, 1633.506958, 925.158386, 470.780487, 0.150800},
    },
    [2] = { "Villes de l'Alliance", 0,
        {"Hurlevent", 0, -8868.269531, 590.233887, 92.941093, 0.714248},
        {"Forgefer", 0, -4795, -1117, 499, 0},
        {"Darnassus", 1, 9952, 2280.5, 1342, 1.6},
        {"Exodar", 530, -3863, -11736, -106, 2},
		{"Sanctuaire des Sept-Étoiles", 870, 858.629578, 280.190521, 503.274841, 3.773453},
    },
    [3] = { "Zones Outreterre", 2,
        {"Les Tranchantes", 530, 1481, 6829, 107, 6},
        {"Péninsule des Flammes infernales", 530, -249, 947, 85, 2},
        {"Nagrand", 530, -1769, 7150, -9, 2},
        {"Raz de Néant", 530, 3043, 3645, 143, 2},
        {"Vallée d’Ombrelune", 530, -3034, 2937, 87, 5},
        {"Forêt de Terokkar", 530, -1942, 4689, -2, 5},
        {"Marécage de Zangar", 530, -217, 5488, 23, 2},
        {"Shattrath", 530, -1822, 5417, 1, 3},
    },
    [4] = { "Zones Norfendre", 2,
        {"Toundra Boréenne", 571, 3230, 5279, 47, 3},
        {"Forêt du Chant de cristal", 571, 5732, 1016, 175, 3.6},
        {"Désolation des dragons", 571, 3547, 274, 46, 1.6},
        {"Les Grisonnes", 571, 3759, -2672, 177, 3},
        {"Fjord Hurlant", 571, 772, -2905, 7, 5},
        {"La Couronne de glace", 571, 8517, 676, 559, 4.7},
        {"Bassin de Sholazar", 571, 5571, 5739, -75, 2},
        {"Les pics Foudroyés", 571, 6121, -1025, 409, 4.7},
        {"Joug d’Hiver", 571, 5135, 2840, 408, 3},
        {"Zul'Drak", 571, 5761, -3547, 387, 5},
        {"Dalaran", 571, 5826, 470, 659, 1.4},
    },
    [5] = { "Zones PvP", 2,
        {"Arène des Gurubashi", 0, -13229, 226, 33, 1},
        {"Hache tripes", 1, -3669, 1094, 160, 3},
        {"Arène de Nagrand", 530, -1983, 6562, 12, 2},
        {"Arène des Tranchantes", 530, 2910, 5976, 2, 4},
    },
}

-- CODE STUFFS! DO NOT EDIT BELOW
-- UNLESS YOU KNOW WHAT YOU'RE DOING!

local function OnGossipHello(event, player, item)
    -- Show main menu
    for i, v in ipairs(T) do
        if (v[2] == 2 or v[2] == player:GetTeam()) then
            player:GossipMenuAddItem(0, v[1], i, 0)
        end
    end
    player:GossipSendMenu(1, item)
end    

local function OnGossipSelect(event, player, item, sender, intid, code)
    if (sender == 0) then
        -- return to main menu
        OnGossipHello(event, player, item)
        return
    end

    if (intid == 0) then
        -- Show teleport menu
        for i, v in ipairs(T[sender]) do
            if (i > 2) then
                player:GossipMenuAddItem(0, v[1], sender, i)
            end
        end
        player:GossipMenuAddItem(0, "Retour", 0, 0)
        player:GossipSendMenu(1, item)
        return
    else
        -- teleport
        local name, map, x, y, z, o = table.unpack(T[sender][intid])
        player:Teleport(map, x, y, z, o)
    end
    
    player:GossipComplete()
end

RegisterItemGossipEvent(ItemEntry, 1, OnGossipHello)
RegisterItemGossipEvent(ItemEntry, 2, OnGossipSelect)