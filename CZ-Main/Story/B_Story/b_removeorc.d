
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
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_01");	//Démon je mrtvý. Člověk zabil démona!
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_02");	//Prokletí je pryč. Mám zpět duši!
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_03");	//Ur-Grom již není fantom. Ur-Grom žije! A bratři také! Zlý démon už nebude nikdy škodit našim bratrům...
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_04");	//Údolí je konečně bez temné magie. A my také.
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_05");	//Člověk má respek u Ur-Groma! A nyní ho můžu nazývat přítelem.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_06");	//Přátelstvý se skřetem pro mne není nic nového. (hrdě)
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_07");	//Dobře! Nyní nastal čas aby se Ur-Thrall dozvědel novinky o našem osudu.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_08");	//Musí se dozvědet že jsem to opět já a živý!
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_09");	//Budu si navždy pamatovat tebe jako velkého hrdinu!
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Dead_01_10");	//Ur-Grom jít domů. Člověk vždy najde Ur-Groma v táboře.
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
	description = "Ještě tu je jedna záležitost...";
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
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_01");	//Ještě tu je jedna záležitost...
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_02");	//Ur-Grom poslouchá. O co člověku jde?
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_03");	//Kromně vás má v údolí tábor také kupinka lidí. Velmi malá.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_04");	//Rád bych měl tvé slovo že je nebudete napadat.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_05");	//Můžeš mi dát takový slib.
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_06");	//Člověk je velký hrdina a přítel Ur-Groma.
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_07");	//Ur-Grom může slíbit takovou věc. Dokud lidé sami nezačnou zabíjet bratry první!
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_08");	//Věřím že se to nestane. Sami už mají dost krvavých bitev.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_09");	//Přejí si mír.
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_10");	//Ur-Grom věří člověku. Bratři nebudou útočit na lidi.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_11");	//Díky Ur-Grome. Vědel jsem že mne nezklameš.
	AI_Output(other,self,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_12");	//To je vše. Nyní zde má práce skončila.
	AI_Output(self,other,"DIA_Orc_8565_UrGrom_Azgolor_Human_01_13");	//Ur-Grom je rád že mohl také pomoci člověk!
	B_LogEntry(TOPIC_HUMANINVALLEY,"Mluvil jsem s Ur-Gromem. Souhlasil, že nebude zabíjet lidi v Údolí stínů! Teď musím o tom informovat Elvaise.");
	SAVEHUMAN = TRUE;
};