
func void b_removeorc()
{
	B_RemoveNpc(orc_8563_urgrom);
	B_RemoveNpc(orc_8564_vanhan);
	B_RemoveNpc(orcwarrior_sh_01);
	B_RemoveNpc(orcwarrior_sh_02);
	B_RemoveNpc(orcwarrior_sh_03);
	B_RemoveNpc(orcwarrior_sh_04);
	B_RemoveNpc(orcwarrior_sh_05);
	B_RemoveNpc(orcwarrior_sh_06);
	B_RemoveNpc(orcwarrior_sh_07);
	B_RemoveNpc(orcwarrior_sh_08);
	B_RemoveNpc(orcwarrior_sh_09);
	B_RemoveNpc(orcwarrior_sh_10);
	B_RemoveNpc(orcwarrior_sh_11);
	B_RemoveNpc(orcwarrior_sh_12);
	B_RemoveNpc(orcwarrior_sh_13);
	B_RemoveNpc(orcwarrior_sh_14);
	B_RemoveNpc(orcwarrior_sh_15);
	B_RemoveNpc(orcwarrior_sh_16);
	B_RemoveNpc(orcelite_sh_01);
	B_RemoveNpc(orcelite_sh_02);
	B_RemoveNpc(orcelite_sh_03);
	B_RemoveNpc(orcelite_sh_04);
	B_RemoveNpc(orcelite_sh_05);
	B_RemoveNpc(orcelite_sh_06);
	B_RemoveNpc(orcelite_sh_07);
	B_RemoveNpc(orcelite_sh_08);
	B_RemoveNpc(orcelite_sh_09);
	B_RemoveNpc(orcelite_sh_10);
	B_RemoveNpc(orcelite_sh_11);
	B_RemoveNpc(orcelite_sh_12);
	B_RemoveNpc(orcwarrior_sh_sit_01);
	B_RemoveNpc(orcwarrior_sh_sit_02);
	B_RemoveNpc(orcwarrior_sh_sit_03);
	B_RemoveNpc(orcwarrior_sh_sit_04);
	B_RemoveNpc(orcwarrior_sh_sit_05);
	B_RemoveNpc(orcwarrior_sh_sit_06);
	B_RemoveNpc(orcwarrior_sh_sit_07);
	B_RemoveNpc(orcelite_sh_sit_01);
	B_RemoveNpc(orcelite_sh_sit_02);
	B_RemoveNpc(orcelite_sh_sit_03);
	B_RemoveNpc(orcelite_sh_sit_04);
	B_RemoveNpc(orcshaman_sh_01);
	B_RemoveNpc(orcshaman_sh_02);
	B_RemoveNpc(orcshaman_sh_03);
	B_RemoveNpc(orcshaman_sh_04);
	B_RemoveNpc(orcshaman_sh_05);
	B_RemoveNpc(orcshaman_sh_06);
};

func void b_placeorc()
{
	Wld_InsertNpc(orcshaman_van_xan,"FP_ROAM_ORCSHAMAN_01");
	Wld_InsertNpc(orcwarrior4,"FP_ROAM_MONSTER_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_MONSTER_23");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_22B");
	Wld_InsertNpc(orcwarrior3,"FP_ROAM_SHORC_22C");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_23");
	Wld_InsertNpc(orcwarrior4,"FP_ROAM_SHORC_21");
	Wld_InsertNpc(orcwarrior3,"FP_ROAM_SHORC_16");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_17");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_18");
	Wld_InsertNpc(orcwarrior4,"FP_ROAM_SHORC_14");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_11");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_12");
	Wld_InsertNpc(orcwarrior3,"FP_ROAM_SHORC_07");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_02");
	Wld_InsertNpc(orcwarrior4,"FP_ROAM_SHORC_03");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_MONSTER_28");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_19");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_20");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_22A");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_13");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_15");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_08");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_09");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_10");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_04");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_05");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_06");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SHORC_14");
	Wld_InsertNpc(orcwarrior1s,"FP_CAMPFIRE_SHORC_16");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SHORC_08");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SHORC_09");
	Wld_InsertNpc(orcwarrior1s,"FP_CAMPFIRE_SHORC_10");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SHORC_04");
	Wld_InsertNpc(orcwarrior4,"FP_CAMPFIRE_SHORC_05");
	Wld_InsertNpc(orkelite_addon3s,"FP_CAMPFIRE_SHORC_18");
	Wld_InsertNpc(orkelite_addon3s,"FP_CAMPFIRE_SHORC_13");
	Wld_InsertNpc(orkelite_addon3s,"FP_CAMPFIRE_SHORC_11");
	Wld_InsertNpc(orkelite_addon3s,"FP_CAMPFIRE_SHORC_02");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_17");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_12");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_06");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_07");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_03");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_01");
};


instance DIA_ORC_8565_URGROM_EXIT(C_Info)
{
	npc = orc_8565_urgrom;
	nr = 999;
	condition = dia_orc_8565_urgrom_exit_condition;
	information = dia_orc_8565_urgrom_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_orc_8565_urgrom_exit_condition()
{
	return TRUE;
};

func void dia_orc_8565_urgrom_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8565_URGROM_AZGOLOR_DEAD(C_Info)
{
	npc = orc_8565_urgrom;
	condition = dia_orc_8565_urgrom_azgolor_dead_condition;
	information = dia_orc_8565_urgrom_azgolor_dead_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_orc_8565_urgrom_azgolor_dead_condition()
{
	if((BLKDRAGNISDEAD == TRUE) && (CURSEISEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8565_urgrom_azgolor_dead_info()
{
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_01");	//Демон мертв!!! Человек убить демон!!!
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_02");	//Чувствовать, чувствовать - проклятье исчезать....дух Ур-Грома снова принадлежать ему...
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_03");	//Ур-Гром больше не призрак. Ур-Гром живой! И братья тоже! Злой демон не будет больше колдовать и убивать братьев...
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_04");	//Теперь эта долина свободна от темных чар зла, как и все вы.
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_05");	//Ур-Гром говорить человек большой спасибо! Ур-Гром уважать человек и считать его другом!
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_06");	//Кажется дружба с орками входит у меня в привычку...(смеюсь)
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_07");	//Ладно, мне пора. Я прередам Ур-Траллу ту новость, что Долина больше не является источником зла.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_08");	//И естественно, что его брат жив!
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_09");	//Добрый путь человек! Ур-Гром будет всегда помнить великий герой!
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_10");	//Ур-Гром идти домой. Человек всегда найти Ур-Гром в лагере.
	CURSEISEND = TRUE;
	AI_StopProcessInfos(self);
	b_removeorc();
	b_placeorc();
	Npc_ExchangeRoutine(self,"urgromhome");
};

instance DIA_ORC_8565_URGROM_AZGOLOR_HUMAN(C_Info)
{
	npc = orc_8565_urgrom;
	condition = dia_orc_8565_urgrom_azgolor_human_condition;
	information = dia_orc_8565_urgrom_azgolor_human_info;
	important = FALSE;
	permanent = TRUE;
	description = "Еще одно дело...";
};

func int dia_orc_8565_urgrom_azgolor_human_condition()
{
	if((SAVEHUMAN == FALSE) && (CURSEISENDHUMAN == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8565_urgrom_azgolor_human_info()
{
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_01");	//Еще одно дело, Ур-Гром.
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_02");	//Ур-Гром слушать человек. Что человек хотеть?
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_03");	//Кроме вас, в этой долине остался небольшой лагерь людей - их там совсем немного.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_04");	//Я бы хотел, взять с тебя слово, Ур-Гром, что орки не будут нападать на них.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_05");	//Ты можешь мне дать такое обещание?
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_06");	//Человек друг Ур-Грома, человек великий воин - Ур-Гром уважать человек и быть должен ему жизнь!
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_07");	//Ур-Гром может дать такое слово человек, если люди не станут убивать братьев.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_08");	//Ну до этого навряд ли дойдет. Они, также как и вы, устали от постоянных кровопролитных сражений.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_09");	//Они хотят просто мирно тут сосуществовать.
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_10");	//Ур-Гром верить человек и дать слово, что братья не будут убивать другие люди.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_11");	//Отлично Ур-Гром! Я знал, что не ошибся в тебе.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_12");	//Теперь, все мои дела тут откончены. Еще свидимся может быть!
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_13");	//Ур-Гром говорить человек пока и желать удача.
	B_LogEntry(TOPIC_HUMANINVALLEY,"Я поговорил с Ур-Громом. Он согласился не убивать людей в Долине Теней! Теперь мне нужно сообщить об этом Эльваису");
	SAVEHUMAN = TRUE;
};