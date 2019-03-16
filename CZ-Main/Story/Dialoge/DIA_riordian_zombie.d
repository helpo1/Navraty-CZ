
instance DIA_RIORDIAN_ZOMBIE_EXIT(C_Info)
{
	npc = riordian_zombie;
	nr = 999;
	condition = dia_riordian_zombie_exit_condition;
	information = dia_riordian_zombie_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_riordian_zombie_exit_condition()
{
	return TRUE;
};

func void dia_riordian_zombie_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RIORDIAN_ZOMBIE_HALLO(C_Info)
{
	npc = riordian_zombie;
	nr = 1;
	condition = dia_riordian_zombie_hallo_condition;
	information = dia_riordian_zombie_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_riordian_zombie_hallo_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_riordian_zombie_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_00");	//(mrtvý hlas) Aarggg, tak tady jsi, osobo... Čekal jsem na tebe!
	AI_Output(other,self,"DIA_Riordian_Zombie_HALLO_01_01");	//Riordiane?!
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_02");	//Mýlíš se, smrtelníku... Tohle není Riordian! Přesněji, už není vůbec.
	AI_Output(other,self,"DIA_Riordian_Zombie_HALLO_01_03");	//Tak kdo jsi?
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_04");	//Popřemýšlej o tom...
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_05");	//Přibliž se k tomuhle kusu rozpadajícího se masa, zacítíš ten nesnesitelný zápach.
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_06");	//Lépe se koukni na jeho mrtvé oči více zblízka a uvidíš momentálního nepřítele, elitu!
	AI_Output(other,self,"DIA_Riordian_Zombie_HALLO_01_07");	//To nemůže být pravda! Strážci?!
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_08");	//(zlověstný smích) Myslel sis, že někdo jiní?
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_09");	//Naposledy sem tě trochu podcenil. Ale teď, už se stejná chyba opakovat nebude!
	AI_Output(other,self,"DIA_Riordian_Zombie_HALLO_01_12");	//Kde je prastarý artefakt, který Stavitelé používali pro rituál?
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_13");	//Je ve mně... Ale nikdy ho nebudeš mít! To samé platí o záchraně světa.
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_14");	//Brzo tahle zem pozná náš hněv a nikdo nás nebude moci zastavit.
	B_LogEntry(TOPIC_GUARDIANS,"V jednom z chrámů prastarých jsem se zase potkal se Strážci. Oni se neuklidní dokud mě nezabijí!");
	Log_AddEntry(TOPIC_RESTOREHRAM,"Našel jsem Riordiana, ale vypadá špatně! Pobláznení, bezcitní Strážci se ho už zmocnili a přeměnili ho na bezcitné zombii. Nyní už jen musím ukončit jeho bolest navěky a vzít si od něj prastarý artefakt který Saturas tak naléhavě potřebuje.");
	Info_ClearChoices(dia_riordian_zombie_hallo);
	Info_AddChoice(dia_riordian_zombie_hallo,"Tak se na to podíváme!",dia_riordian_zombie_hallo_end);
};

func void dia_riordian_zombie_hallo_end()
{
	AI_Output(other,self,"DIA_Riordian_Zombie_Hallo_End_01_00");	//Tak se na to podíváme!
	AI_Output(self,other,"DIA_Riordian_Zombie_Hallo_End_01_01");	//(zlověstný křik) Zemři, smrtelníku!
	self.aivar[AIV_EnemyOverride] = FALSE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

