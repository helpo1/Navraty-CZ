
instance DIA_Fellan_EXIT(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 999;
	condition = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Fellan_PICKPOCKET(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 998;
	condition = DIA_Fellan_PICKPOCKET_Condition;
	information = DIA_Fellan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Fellan_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_Fellan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,Dialog_Back,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

instance DIA_Fellan_News(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = DIA_Fellan_News_Condition;
	information = DIA_Fellan_News_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Fellan_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE) && (MIS_BELIARHELPME == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fellan_News_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//Dobrá, tak jsi mě dostal. To byl ale hrdinský kousek!

		if((MIS_AttackFellan == LOG_Running) && (FellanGeschlagen == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Tak přestaneš už do toho bušit, nebo ti mám znovu nandat?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//Ne, už mi neubližuj. Přestanu. Ale jestli to tady kolem všechno spadne, tak je to jen tvoje chyba!
			FellanGeschlagen = TRUE;
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
		};
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//Co se děje? Chceš další ránu pěstí?
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//Co jseš to za blázna? Bojuj, nebojuj, řekni - co vlastně chceš?
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};


instance DIA_Fellan_HALLO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 2;
	condition = DIA_Fellan_HALLO_Condition;
	information = DIA_Fellan_HALLO_Info;
	permanent = FALSE;
	description = "Proč tady do toho mlátíš?";
};


func int DIA_Fellan_HALLO_Condition()
{
	if((FellanGeschlagen == FALSE) && (MIS_BELIARHELPME == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fellan_HALLO_Info()
{
	AI_Output(other,self,"DIA_Fellan_HALLO_15_00");	//Proč tady do toho mlátíš?
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//Několik posledních dní se zoufale snažím zamezit tomu, aby mi zatékalo do domu.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//Krov se mi drobí pokaždé, když přijde pořádný liják. Takže se mi všechno rozsejpá pod rukama!
	AI_StopProcessInfos(self);
};


instance DIA_Fellan_Stop(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 3;
	condition = DIA_Fellan_Stop_Condition;
	information = DIA_Fellan_Stop_Info;
	permanent = FALSE;
	description = "Můžeš přestat s tím boucháním?";
};


func int DIA_Fellan_Stop_Condition()
{
	if(MIS_AttackFellan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fellan_Stop_Info()
{
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//Můžeš přestat s tím boucháním?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//Ne, musím to dodělat.
	Info_ClearChoices(DIA_Fellan_Stop);
	Info_AddChoice(DIA_Fellan_Stop,"Přestaň s tím, nebo ti zpřerážim všechny kosti v těle.",DIA_Fellan_Stop_Bones);
	Info_AddChoice(DIA_Fellan_Stop,"Dám ti 10 zlatých, když s tím rámusem přestaneš.",DIA_Fellan_Stop_Gold);
	Info_AddChoice(DIA_Fellan_Stop,"Prostě přestaň bušit, fajn?",DIA_Fellan_Stop_Just);
};

func void DIA_Fellan_Stop_Bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//Přestaň s tím, nebo ti zpřerážim všechny kosti v těle.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Zapomeň na to, nebo ti do tvý palice svym kladivem vtluču alespoň trochu rozumu.
	AI_StopProcessInfos(self);
};

func void DIA_Fellan_Stop_Gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//Dám ti 10 zlatých, když s tím rámusem přestaneš.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//Hej... To je od tebe opravdu milé. Ale jako s tim zlatem, můžeš...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//... fajn, ty víš, co se s tim dá dělat.
};

func void DIA_Fellan_Stop_Just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Prostě přestaň bušit, fajn?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Prostě mě zkus neposlouchat, fajn?
};


instance DIA_Fellan_klar(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 5;
	condition = DIA_Fellan_klar_Condition;
	information = DIA_Fellan_klar_Info;
	permanent = TRUE;
	description = "Halóóó - je ti dobře?";
};


func int DIA_Fellan_klar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fellan_HALLO) && (MIS_BELIARHELPME == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fellan_klar_Info()
{
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Halóóó - je ti dobře?

	if(FellanGeschlagen == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Fajn, jestli se mi podaří tohle všechno včas opravit.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//Ta střecha je čím dál tím horší. Až příště zaprší, bude mi voda téct rovnou na hlavu. A za to všechno můžeš ty!
	};

	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_INSANE(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_insane_condition;
	information = dia_fellan_insane_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int dia_fellan_insane_condition()
{
	if(MIS_BELIARHELPME == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_fellan_insane_info()
{
	AI_Output(other,self,"DIA_Fellan_Insane_01_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Fellan_Insane_01_01");	//Nevyrušuj mě!... Jestli nevidíš, musím opravit tu chatrč.
	AI_Output(self,other,"DIA_Fellan_Insane_01_03");	//Rozhodl jsem se žít zde v ní. Khorinis mě ďábelsky trápí a tady je to takové klidné...
	AI_Output(other,self,"DIA_Fellan_Insane_01_04");	//A ty nemáš strach, že budeš žrádlo pro vlky?!
	AI_Output(self,other,"DIA_Fellan_Insane_01_07");	//Jo, to se ti zdá dobře... (rozzlobeně) Takže raději vysmahni!
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_INSANETWO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_insanetwo_condition;
	information = dia_fellan_insanetwo_info;
	permanent = FALSE;
	description = "Opravdu chceš zůstat zde?";
};


func int dia_fellan_insanetwo_condition()
{
	if(Npc_KnowsInfo(other,dia_fellan_insane) && (MIS_BELIARHELPME == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_fellan_insanetwo_info()
{
	AI_Output(other,self,"DIA_Fellan_InsaneTwo_01_00");	//Opravdu chceš zůstat zde?
	AI_Output(self,other,"DIA_Fellan_InsaneTwo_01_01");	//Určitě... Je tady nádherně.
	AI_Output(other,self,"DIA_Fellan_InsaneTwo_01_03");	//Ale co je nádherného na hromadě spáleného dřeva?!
	AI_Output(self,other,"DIA_Fellan_InsaneTwo_01_04");	//Prostě jsi odsouzeníhodný blázen, protože tohle je nejhezčí místo, jaké znám.
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_INSANELAST(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_insanelast_condition;
	information = dia_fellan_insanelast_info;
	permanent = TRUE;
	description = "Počkej, ještě jedna věc.";
};


func int dia_fellan_insanelast_condition()
{
	if(Npc_KnowsInfo(other,dia_fellan_insanetwo) && (MIS_BELIARHELPME == LOG_Running) && (FELLANGORFIRSTMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_insanelast_info()
{
	AI_Output(other,self,"DIA_Fellan_InsaneLast_01_01");	//Počkej, ještě jedna věc.
	if(TELLFIRSTFELLAN == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_InsaneLast_01_02");	//Zase ty! Co po mě chceš?!
		AI_Output(other,self,"DIA_Fellan_InsaneLast_01_03");	//Jednoduše myslím, že jsi osoba kterou hledám.
		AI_Output(self,other,"DIA_Fellan_InsaneLast_01_04");	//Zase?! (rozzlobeně)
		TELLFIRSTFELLAN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_InsaneLast_01_04");	//Zase?! (rozzlobeně)
	};
	Info_ClearChoices(dia_fellan_insanelast);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_insanelast,"... ARH BELIAR NOMEN SAKT DAGAR JARAS...!",dia_fellan_insanelast_yes);
	};
	Info_AddChoice(dia_fellan_insanelast,"Když tě vidím, nejsem si tím zase tak jistý, ale kdo ví...",dia_fellan_insanelast_no);
};

func void dia_fellan_insanelast_no()
{
	AI_Output(other,self,"DIA_Fellan_InsaneLast_No_01_00");	//Když tě vidím, nejsem si tím zase tak jistý, ale kdo ví...
	AI_Output(self,other,"DIA_Fellan_InsaneLast_No_01_01");	//Hmmm...
	AI_StopProcessInfos(self);
};

func void dia_fellan_insanelast_yes()
{
	B_GivePlayerXP(100);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Fellangor";
	FELLANGORFIRSTMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_InsaneLast_Yes_01_00");	//... ARH BELIAR NOMEN SAKT DAGAR JARAS...!
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_01");	//Arrgh!... (Hlas ze záhrobí) Takže jsi rozluštil mé tajemství ty ubohý skrčku.
	AI_Output(other,self,"DIA_Fellan_InsaneLast_Yes_01_02");	//To znamená, že ty jsi ten mistr, co sloužil Beliarovi a pak odešel?!
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_03");	//Ano, a myslím, že jsem ten, koho hledáš.
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_04");	//Ale nemůžeš zničit nesmrtelného!
	AI_Output(other,self,"DIA_Fellan_InsaneLast_Yes_01_05");	//Podíváme se na to! Hleď na tento amulet a okus jeho sílu!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_06");	//Amulet! Jak je to možné?! Jak ses mohl odvážit...?!
	AI_Output(other,self,"DIA_Fellan_InsaneLast_Yes_01_07");	//Jsem zde na rozkaz tvého majitele, který tě chce zpět.
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_08");	//Arrgh!... Blázne! Mě nedostaneš.
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_09");	//Amulet je silný, ale nedokáže mě celého zničit!
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_10");	//Jeho síla ochabuje v tvých rukou a nikdo mi nezabrání znovu zmizet z dohledu Temného boha.
	B_LogEntry(TOPIC_BELIARHELPME,"Našel jsem Fellangora a použil na něj kouzlo a amulet od Zigose. Sice nedokázal Fellangora zničit a poslat k Beliarovi, ale možná se to povede, když to zkusím ještě jednou. První ho ale musím najít.");
	Info_ClearChoices(dia_fellan_insanelast);
	Info_AddChoice(dia_fellan_insanelast,"... (KONEC)",dia_fellan_insanelast_away);
};

func void dia_fellan_insanelast_away()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_ExchangeRoutine(self,"InsanePath");
	B_Attack(self,other,0,0);
};

instance DIA_FELLAN_MEETTWO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meettwo_condition;
	information = dia_fellan_meettwo_info;
	permanent = FALSE;
	description = "Kde se tady bereš?";
};


func int dia_fellan_meettwo_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORFIRSTMEET == TRUE) && (FELLANGORSECONDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_meettwo_info()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwo_01_00");	//Kde se tady bereš?
	AI_Output(self,other,"DIA_Fellan_MeetTwo_01_01");	//Jednoduše jsem se rozhodl jít na dřevo.
	AI_Output(other,self,"DIA_Fellan_MeetTwo_01_02");	//Jít na dřevo jen tak sám v této době?
	AI_Output(self,other,"DIA_Fellan_MeetTwo_01_03");	//Ale v jaké době? Je tady tak krásně!
	AI_Output(other,self,"DIA_Fellan_MeetTwo_01_04");	//Je na tobě něco divného.
	AI_Output(self,other,"DIA_Fellan_MeetTwo_01_05");	//Co tím myslíš? (s údivem)
	SPEAKTWOFELLANGORONCE = TRUE;
	Info_ClearChoices(dia_fellan_meettwo);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meettwo,"... ARH BELIAR NOMEN SAKT DAGAR JARAS...!",dia_fellan_meettwo_yes);
	};
	Info_AddChoice(dia_fellan_meettwo,"Na tom nezáleží.",dia_fellan_meettwo_no);
};

func void dia_fellan_meettwo_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwo_No_01_00");	//Nic důležitého.
	AI_Output(self,other,"DIA_Fellan_MeetTwo_No_01_01");	//To se mi ulevilo. Myslel jsem si, že jsi bandita.
	AI_StopProcessInfos(self);
};

func void dia_fellan_meettwo_yes()
{
	B_GivePlayerXP(200);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Fellangor";
	FELLANGORSECONDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_MeetTwo_Yes_01_00");	//... ARH BELIAR NOMEN SAKT DAGAR JARAS...!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetTwo_Yes_01_01");	//Aargh!... Jak jsi mě mohl najít člověče!
	AI_Output(other,self,"DIA_Fellan_MeetTwo_Yes_01_02");	//Mě se neschováš Fellangore. Podřiď se a vrať se!
	AI_Output(self,other,"DIA_Fellan_MeetTwo_Yes_01_03");	//Ne! Nevrátím se k nikomu! Ani k samotnému Beliarovi!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Fellan_MeetTwo_Yes_01_04");	//(Divoce se směje) Amulet znova selhal v pokusu mě zabít!
	AI_Output(self,other,"DIA_Fellan_MeetTwo_Yes_01_06");	//Schovám se ve tmě a ty mě už nikdy nenajdeš.
	B_LogEntry(TOPIC_BELIARHELPME,"Znovu jsem narazil na Fellangora. Amulet mu vysál další síly. Sice se mu znovu podařilo zmizet, ale jsem si jistý, že to bylo naposledy.");
	Info_ClearChoices(dia_fellan_meettwo);
	Info_AddChoice(dia_fellan_meettwo,"... (KONEC)",dia_fellan_meettwo_away);
};

func void dia_fellan_meettwo_away()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_ExchangeRoutine(self,"InsanePathNext");
	B_Attack(self,other,0,0);
};


instance DIA_FELLAN_MEETTWOAGAIN(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meettwoagain_condition;
	information = dia_fellan_meettwoagain_info;
	permanent = TRUE;
	description = "Hej, poslouchej mě!";
};


func int dia_fellan_meettwoagain_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORFIRSTMEET == TRUE) && (SPEAKTWOFELLANGORONCE == TRUE) && (FELLANGORSECONDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_meettwoagain_info()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwoAgain_01_00");	//Hej, poslouchej mě!
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_01_01");	//Co chceš?!
	Info_ClearChoices(dia_fellan_meettwoagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meettwoagain,"... ARH BELIAR NOMEN SAKT DAGAR JARAS...!",dia_fellan_meettwoagain_yes);
	};
	Info_AddChoice(dia_fellan_meettwoagain,"To nevadí.",dia_fellan_meettwoagain_no);
};

func void dia_fellan_meettwoagain_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwoAgain_No_01_00");	//To nevadí.
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_No_01_01");	//Potom mě nech být!
	AI_StopProcessInfos(self);
};

func void dia_fellan_meettwoagain_yes()
{
	B_GivePlayerXP(200);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Fellangor";
	FELLANGORSECONDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_MeetTwoAgain_Yes_01_00");	//... ARH BELIAR NOMEN SAKT DAGAR JARAS...!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_Yes_01_01");	//Aargh!... Jak jsi mě zase našel člověče!
	AI_Output(other,self,"DIA_Fellan_MeetTwoAgain_Yes_01_02");	//Mě se neschováš Fellangore! Podřiď se vůli amuletu a vrať se.
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_Yes_01_03");	//Ne! Nevrátím se k nikomu! Ani k samotnému Beliarovi!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_Yes_01_04");	//(Divoce se směje) Amulet znova selhal v pokusu mě zabít!
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_Yes_01_06");	//Schovám se ve tmě a ty mě už nikdy nenajdeš.
	B_LogEntry(TOPIC_BELIARHELPME,"Znovu jsem narazil na Fellangora. Amulet mu vysál další síly. Sice se mu znovu podařilo zmizet, ale jsem si jistý, že to bylo naposledy.");
	Info_ClearChoices(dia_fellan_meettwoagain);
	Info_AddChoice(dia_fellan_meettwoagain,"... (KONEC)",dia_fellan_meettwoagain_away);
};

func void dia_fellan_meettwoagain_away()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_ExchangeRoutine(self,"InsanePathNext");
	B_Attack(self,other,0,0);
};


instance DIA_FELLAN_MEETLAST(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meetlast_condition;
	information = dia_fellan_meetlast_info;
	permanent = FALSE;
	description = "Hej, přiteli, co tu děláš?";
};


func int dia_fellan_meetlast_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORSECONDMEET == TRUE) && (FELLANGORTHIRDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_meetlast_info()
{
	AI_Output(other,self,"DIA_Fellan_MeetLast_01_00");	//Hej, přiteli, co tu děláš?
	AI_Output(self,other,"DIA_Fellan_MeetLast_01_01");	//Jsem obchodník. Neruš mě, každou chvílí tu může být můj zákazník.
	AI_Output(other,self,"DIA_Fellan_MeetLast_01_02");	//Ty obchoduješ uprostřed lesa plného nestvůr?
	AI_Output(other,self,"DIA_Fellan_MeetLast_01_04");	//Hmmm... A kde je tvé zboží?!
	AI_Output(self,other,"DIA_Fellan_MeetLast_01_05");	//E-e-e... Nemám ho tu... Nech... Ne... Nechal jsem ho ve městě pro případ, že by mě přepadli banditi!
	AI_Output(self,other,"DIA_Fellan_MeetLast_01_07");	//Co na mě tak koukáš?
	SPEAKTHIRDFELLANGORONCE = TRUE;
	Info_ClearChoices(dia_fellan_meetlast);

	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meetlast,"... ARH BELIAR NOMEN SAKT DAGAR JARAS...!",dia_fellan_meetlast_yes);
	};
	Info_AddChoice(dia_fellan_meetlast,"To nevadí.",dia_fellan_meetlast_no);
};

func void dia_fellan_meetlast_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetLast_No_01_00");	//Zapomeň na to.
	AI_Output(self,other,"DIA_Fellan_MeetLast_No_01_01");	//Takže se vrátím k obchodu, nemáš námitky?!
	AI_StopProcessInfos(self);
};

func void dia_fellan_meetlast_yes()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Fellangor";
	FELLANGORTHIRDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_MeetLast_Yes_01_00");	//... ARH BELIAR NOMEN SAKT DAGAR JARAS...!
	AI_Output(self,other,"DIA_Fellan_MeetLast_Yes_01_01");	//Nevím, jak to děláš člověče, ale znovu jsi mě našel.
	AI_Output(other,self,"DIA_Fellan_MeetLast_Yes_01_02");	//Netlachej a připrav se na smrt.
	AI_Output(self,other,"DIA_Fellan_MeetLast_Yes_01_03");	//Zadrž! Ušetři mě a má vděčnost nebude znát mezí!
	B_LogEntry(TOPIC_BELIARHELPME,"Chytil jsem Fellangora. Teď už mi neuteče.");
	Info_ClearChoices(dia_fellan_meetlast);
	Info_AddChoice(dia_fellan_meetlast,"A co můžeš nabídnout?",dia_fellan_meetlast_what);
	Info_AddChoice(dia_fellan_meetlast,"Dobrá, souhlasím.",dia_fellan_meetlast_free);
	Info_AddChoice(dia_fellan_meetlast,"Ne, skoncuji s tebou.",dia_fellan_meetlast_kill);
};

func void dia_fellan_meetlast_what()
{
	AI_Output(other,self,"DIA_Fellan_MeetLast_What_01_00");	//A co můžeš nabídnout?
	AI_Output(self,other,"DIA_Fellan_MeetLast_What_01_01");	//Něco, co ti poskytne obrovskou moc.
};

func void dia_fellan_meetlast_free()
{
	AI_Output(other,self,"DIA_Fellan_MeetLast_Free_01_00");	//Dobrá, souhlasím.
	AI_Output(self,other,"DIA_Fellan_MeetLast_Free_01_01");	//Díky člověče a jako důkaz mých slov přijmi tento prsten.
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		CreateInvItems(self,itri_fellangor_magic,1);
		B_GiveInvItems(self,other,itri_fellangor_magic,1);
	}
	else
	{
		CreateInvItems(self,itri_fellangor,1);
		B_GiveInvItems(self,other,itri_fellangor,1);
	};
	AI_Output(other,self,"DIA_Fellan_MeetLast_Free_01_02");	//Prsten? Jenom?!
	AI_Output(self,other,"DIA_Fellan_MeetLast_Free_01_03");	//Nemysli jsi, že jsem tě oklamal. Je to nejmocnější prsten na tomto ostrově.
	AI_Output(self,other,"DIA_Fellan_MeetLast_Free_01_04");	//Vyzkoušej si ho a porozumíš, že mluvím pravdu.
	AI_Output(self,other,"DIA_Fellan_MeetLast_Free_01_05");	//A teď sbohem!
	FELLANGORSAVE = TRUE;
	Info_ClearChoices(dia_fellan_meetlast);
	Info_AddChoice(dia_fellan_meetlast,Dialog_Ende,dia_fellan_meetlast_ext);
};

func void dia_fellan_meetlast_ext()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};

func void dia_fellan_meetlast_kill()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Fellan_MeetLast_Kill_01_00");	//Ne, skoncuji s tebou.
	AI_Output(other,self,"DIA_Fellan_MeetLast_Kill_01_01");	//Za vše zaplatíš... Zemři!
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetLast_Kill_01_02");	//Aargh...
	Info_ClearChoices(dia_fellan_meetlast);
	Info_AddChoice(dia_fellan_meetlast,"...(použít amulet)",dia_fellan_meetlast_extkill);
};

func void dia_fellan_meetlast_extkill()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_FELLAN_MEETLASTAGAIN(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meetlastagain_condition;
	information = dia_fellan_meetlastagain_info;
	permanent = TRUE;
	description = "Chtěl bych ti něco říci.";
};


func int dia_fellan_meetlastagain_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (SPEAKTHIRDFELLANGORONCE == TRUE) && (FELLANGORSECONDMEET == TRUE) && (FELLANGORTHIRDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_meetlastagain_info()
{
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_01_00");	//Chtěl bych ti něco říci.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_01_01");	//Ano?! A co to je?
	Info_ClearChoices(dia_fellan_meetlastagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meetlastagain,"... ARH BELIAR NOMEN SAKT DAGAR JARAS...!",dia_fellan_meetlastagain_yes);
	};
	Info_AddChoice(dia_fellan_meetlastagain,"Ale nic, zapomeň na to.",dia_fellan_meetlastagain_no);
};

func void dia_fellan_meetlastagain_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_No_01_00");	//Ale nic, zapomeň na to.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_No_01_01");	//Tak mě nech a já se vrátím k obchodu, jasné?!
	AI_StopProcessInfos(self);
};

func void dia_fellan_meetlastagain_yes()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Fellangor";
	FELLANGORTHIRDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Yes_01_00");	//... ARH BELIAR NOMEN SAKT DAGAR JARAS...!
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Yes_01_01");	//Nevím, jak to děláš člověče, ale znovu jsi mě našel.
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Yes_01_02");	//Netlachej a připrav se na smrt.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Yes_01_03");	//Zadrž! Ušetři mě a má vděčnost nebude znát mezí!
	B_LogEntry(TOPIC_BELIARHELPME,"Chytil jsem Fellangora. Teď už mi neuteče.");
	Info_ClearChoices(dia_fellan_meetlastagain);
	Info_AddChoice(dia_fellan_meetlastagain,"A co můžeš nabídnout?",dia_fellan_meetlastagain_what);
	Info_AddChoice(dia_fellan_meetlastagain,"Dobrá, souhlasím.",dia_fellan_meetlastagain_free);
	Info_AddChoice(dia_fellan_meetlastagain,"Ne, skoncuji s tebou.",dia_fellan_meetlastagain_kill);
};

func void dia_fellan_meetlastagain_what()
{
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_What_01_00");	//A co můžeš nabídnout?
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_What_01_01");	//Něco, co ti poskytne obrovskou moc.
};

func void dia_fellan_meetlastagain_free()
{
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Free_01_00");	//Dobrá, souhlasím.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Free_01_01");	//Díky člověče a jako důkaz mých slov přijmi tento prsten.
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		CreateInvItems(self,itri_fellangor_magic,1);
		B_GiveInvItems(self,other,itri_fellangor_magic,1);
	}
	else
	{
		CreateInvItems(self,itri_fellangor,1);
		B_GiveInvItems(self,other,itri_fellangor,1);
	};
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Free_01_02");	//Prsten? Jenom?!
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Free_01_03");	//Nemysli jsi, že jsem tě oklamal. Je to nejmocnější prsten na tomto ostrově.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Free_01_04");	//Vyzkoušej si ho a porozumíš, že mluvím pravdu.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Free_01_05");	//A teď sbohem!
	FELLANGORSAVE = TRUE;
	Info_ClearChoices(dia_fellan_meetlastagain);
	Info_AddChoice(dia_fellan_meetlastagain,Dialog_Ende,dia_fellan_meetlastagain_ext);
};

func void dia_fellan_meetlastagain_ext()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};

func void dia_fellan_meetlastagain_kill()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Kill_01_00");	//Ne, skoncuji s tebou.
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Kill_01_01");	//A teď mi už neutečeš... ZEMŘI!
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Kill_01_02");	//Aargh... (zoufale)
	Info_ClearChoices(dia_fellan_meetlastagain);
	Info_AddChoice(dia_fellan_meetlastagain,"...(použít amulet)",dia_fellan_meetlastagain_extkill);
};

func void dia_fellan_meetlastagain_extkill()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};