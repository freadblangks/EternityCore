DELETE FROM `creature` WHERE `id` = 68084;
DELETE FROM `creature` WHERE `id` = 68259;
DELETE FROM `creature` WHERE `id` = 68085;
DELETE FROM `creature` WHERE `id` = 68086;
DELETE FROM creature WHERE id = 68430;

INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `movement_type`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`, `ScriptName`, `walk_mode`) VALUES (962686, 68085, 530, 0, 0, 1, 1, 0, 0, 9850.26, -7534.29, -8.07316, 1.48205, 300, 0, 0, 0, 78788200, 0, 0, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `movement_type`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`, `ScriptName`, `walk_mode`) VALUES (962685, 68086, 530, 0, 0, 1, 1, 0, 0, 9840.77, -7529.93, -8.07309, 1.00608, 300, 0, 0, 0, 196970496, 0, 0, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `movement_type`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`, `ScriptName`, `walk_mode`) VALUES (962700, 68430, 530, 0, 0, 1, 1, 0, 0, 9850.6, -7522.96, -9.15769, 1.46162, 300, 0, 0, 0, 3939410, 0, 0, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `movement_type`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`, `ScriptName`, `walk_mode`) VALUES (962687, 68259, 530, 0, 0, 1, 1, 0, 0, 9861.5, -7530.99, -8.07395, 2.29624, 300, 0, 0, 0, 5909115, 0, 0, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `movement_type`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`, `ScriptName`, `walk_mode`) VALUES (962688, 68084, 530, 0, 0, 1, 1, 0, 0, 9851.21, -7502.44, 19.6894, 1.59094, 300, 0, 0, 0, 472729216, 0, 0, 0, 0, 0, 0, 0, '', 0);

UPDATE creature_template SET faction_A = 35, faction_H = 35, npcflag = 1 WHERE entry = 68430;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 1 WHERE `entry` = 68086;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 1 WHERE `entry` = 68085;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 1 WHERE `entry` = 68259;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 68084;

UPDATE `quest_objective` SET `type` = 3 WHERE `questId` = 32330 AND `id` = 269678 AND `index` = 1;
UPDATE `quest_objective` SET `type` = 3 WHERE `questId` = 32330 AND `id` = 269718 AND `index` = 2;
UPDATE `quest_objective` SET `type` = 3 WHERE `questId` = 32330 AND `id` = 269719 AND `index` = 0;
UPDATE `quest_objective` SET `type` = 3 WHERE `questId` = 32330 AND `id` = 269840 AND `index` = 3;