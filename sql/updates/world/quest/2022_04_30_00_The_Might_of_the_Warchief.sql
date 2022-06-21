-- creature_template 

UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 67927;
UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 67926;

-- quest_objective

UPDATE `quest_objective` SET `type` = 3 WHERE `questId` = 32250 AND `id` = 269621 AND `index` = 1;
UPDATE `quest_objective` SET `type` = 3 WHERE `questId` = 32250 AND `id` = 269622 AND `index` = 2;

-- quest_template

UPDATE `quest_template` SET `Method` = 2 WHERE `Id` = 32250;