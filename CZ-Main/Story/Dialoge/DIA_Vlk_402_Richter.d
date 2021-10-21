
instance DIA_Richter_EXIT(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 999;
	condition = DIA_Richter_EXIT_Condition;
	information = DIA_Richter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Richter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_TALIASAN(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 1;
	condition = dia_richter_taliasan_condition;
	information = dia_richter_taliasan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_richter_taliasan_condition()
{
	if(MEETTALIASAN == FALSE)
	{
		return TRUE;
	};
};

func void dia_richter_taliasan_info()
{
	AI_Output(self,other,"DIA_Richter_Taliasan_01_00");	//Co tady děláš? Kdo vlastně jsi? A kdo tě sem pustil?!
	AI_Output(other,self,"DIA_Richter_Taliasan_01_01");	//Já, ehm... no...
	AI_Output(self,other,"DIA_Richter_Taliasan_01_02");	//Vidím, že neumíš ani zřetelně mluvit.
	AI_Output(self,other,"DIA_Richter_Taliasan_01_03");	//Je jasné, že nemáš žádné vychování!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Richter_Taliasan_01_0A");	//Nechápu, jak tě mohli přijmout mezi mágy Ohně!
	};
	AI_Output(other,self,"DIA_Richter_Taliasan_01_04");	//Vidím, že bys potřeboval lekci dobrého chování!
	AI_Output(self,other,"DIA_Richter_Taliasan_01_05");	//Cože?! Ty mi vyhrožuješ? Takže tu máme dalšího Gallahada!
	AI_Output(other,self,"DIA_Richter_Taliasan_01_06");	//Gallahad?! Kdo je to?
	AI_Output(self,other,"DIA_Richter_Taliasan_01_07");	//Byl u nás takový chytrý člověk. Myslel, že když je mág, může vše.
	AI_Output(self,other,"DIA_Richter_Taliasan_01_08");	//A kde je teď?!
	AI_Output(other,self,"DIA_Richter_Taliasan_01_09");	//Kde?
	AI_Output(self,other,"DIA_Richter_Taliasan_01_10");	//Chceš vědět kde je? Na úplném dně!
	AI_Output(self,other,"DIA_Richter_Taliasan_01_11");	//Je nyní v přístavní čtvrti mezi městskou lůzou.
	AI_Output(self,other,"DIA_Richter_Taliasan_01_12");	//Jestli tak nechceš skončit - vypadni!
	AI_Output(self,other,"DIA_Richter_Taliasan_01_13");	//Není tu pro tebe místo!
	KNOWSABOUTTALIASAN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Hello(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 4;
	condition = DIA_Richter_Hello_Condition;
	information = DIA_Richter_Hello_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Richter_Hello_Condition()
{
	if(MIS_Lee_JudgeRichter == 0)
	{
		return TRUE;
	};
};

func void DIA_Richter_Hello_Info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//Proč mě obtěžuješ? Kdo vlastně jsi?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//Já, ehm...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//Řekni, neznáme se odněkud?
	Info_ClearChoices(DIA_Richter_Hello);
	Info_AddChoice(DIA_Richter_Hello,"Co si pamatuju, tak ne.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice(DIA_Richter_Hello,"Možná ano.",DIA_Richter_Hello_MayBe);
};

func void DIA_Richter_Hello_DontThinkSo()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Co si pamatuju, tak ne.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//To je zvláštní. Přísahal bych, že už jsme se někde viděli.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Nevadí, však jsi jen ubohý šupák. Všichni vypadáte stejně.
};

func void DIA_Richter_Hello_MayBe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Možná ano.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Chtělo by to trochu uctivější tón! S kým si vůbec myslíš, že mluvíš?
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//To nejmenší, co můžeš udělat, je mluvit se mnou odpovídajícím tónem.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//A teď se mi ztrať z očí!
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Perm(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 800;
	condition = DIA_Richter_Perm_Condition;
	information = DIA_Richter_Perm_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Richter_Perm_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter == LOG_Running)) && (SCIstRichtersLakai == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Richter_Perm_Info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//Jak se vede?
	if((MIS_Lee_JudgeRichter == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//Raději bys měl vypadnout, ty mizernej žoldáku, než zavolám stráže.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Klídek. Nepřišel jsem tě okrást. Hledám práci.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//Á. Tak ty pro mě chceš pracovat. Tak to je samozřejmě jiná.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//Ale má to jeden háček. Nevím, jestli ti mohu věřit. Budeš mi muset nejprve prokázat svou loajalitu.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Neřekl jsem snad jasně, že s tebou nechci nic mít?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//Ne, ne tolika slovy.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//Tak to samozřejmě doufám, že ti to došlo teď.
	};
};


instance DIA_Richter_RichtersLakai(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_RichtersLakai_Condition;
	information = DIA_Richter_RichtersLakai_Info;
	description = "Otestuj si mě.";
};


func int DIA_Richter_RichtersLakai_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter != 0)) && (SCIstRichtersLakai == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Richter_RichtersLakai_Info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Otestuj si mě.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//Hmm. Dobrá. Poslouchej. Přines mi od mágů Ohně posvátné kladivo. Ukrývají ho někde v podzemí svého kláštera.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//Jestli to dokážeš splnit, možná budu uvažovat o tom, že bych si tě najal jako svého osobního strážce.
	Info_ClearChoices(DIA_Richter_RichtersLakai);
	Info_AddChoice(DIA_Richter_RichtersLakai,"To mám jako okrást mágy? Nejsi trochu mimo?",DIA_Richter_RichtersLakai_nein);
	Info_AddChoice(DIA_Richter_RichtersLakai,"Dobrá.",DIA_Richter_RichtersLakai_ja);
	B_LogEntry(TOPIC_RichterLakai,"Soudce mi nevěří. Musím mu prokázat svou loajalitu - ukrást ze sklepení kláštera mágů Ohně posvátné kladivo a přinést mu je.");
	MIS_Richter_BringHolyHammer = LOG_Running;
};

func void DIA_Richter_RichtersLakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//To mám jako okrást mágy? Nejsi trochu mimo?
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//V tom případě táhni do pekel a přestaň plýtvat mým časem.
	AI_StopProcessInfos(self);
};

func void DIA_Richter_RichtersLakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//Dobrá.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Fajn. Ale pamatuj - jestli tě chytí, nikdy jsem o tobě neslyšel.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KillMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KillMorgahard_Condition;
	information = DIA_Richter_KillMorgahard_Info;
	description = "Tady je posvátné kladivo mágů.";
};


func int DIA_Richter_KillMorgahard_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) && (MIS_Richter_BringHolyHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KillMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Tady je posvátné kladivo mágů.
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//Jsem opravdu překvapen. Ty to myslíš vážně, co? Tady je tvá odměna.
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Fajn. Když se to má takhle, tak to mám pro tebe ještě další úkol.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//Před několika dny uteklo ze zdejšího vězení pár trestanců.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Ti hajzlové se schovali v horách. Někde směrem ke Xardasově nové věži.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//Jejich vůdce se jmenuje Morgahard. Chci, abys ho zabil.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Pospěš si, než nám proklouzne.
	Wld_InsertNpc(BDT_1030_Morgahard,"REICH");
	Wld_InsertNpc(BDT_1031_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1032_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1033_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1034_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1035_Fluechtling,"REICH");
	B_InitNpcGlobals();
	B_GivePlayerXP(XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry(TOPIC_RichterLakai,"Někteří trestanci unikli spravedlnosti. Já je mám dostihnout a zabít jejich velitele Morgaharda. Nejspíš se ukrývají v horách, kdesi směrem ke Xardasově nové věži.");
	MIS_Richter_KillMorgahard = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KilledMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahard_Condition;
	information = DIA_Richter_KilledMorgahard_Info;
	description = "Morgahard je mrtvý.";
};


func int DIA_Richter_KilledMorgahard_Condition()
{
	if(Npc_IsDead(Morgahard) && (MIS_Richter_KillMorgahard == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Morgahard je mrtvý. 
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//Á, jsi dobrej chlap. Tady je tvá odměna.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_KillMorgahard);
	B_LogEntry(TOPIC_RichterLakai,"Soudce byl zprávou o Morgahardově smrti očividně nadšen. No, nechme ho být. Nesmím odbočovat od poslání, kterým mě pověřil Lee.");
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};


instance DIA_Richter_KilledMorgahardPERM(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahardPERM_Condition;
	information = DIA_Richter_KilledMorgahardPERM_Info;
	permanent = TRUE;
	description = "Můžu pro tebe ještě něco udělat?";
};


func int DIA_Richter_KilledMorgahardPERM_Condition()
{
	if((MIS_Richter_KillMorgahard == LOG_SUCCESS) && (MIS_RichtersPermissionForShip == 0))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahardPERM_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//Můžu pro tebe ještě něco udělat?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//Teď zrovna ne. Možná později.
};


instance DIA_Richter_PermissionForShip(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_PermissionForShip_Condition;
	information = DIA_Richter_PermissionForShip_Info;
	description = "Dej mi písemné pověření pro paladinskou loď.";
};


func int DIA_Richter_PermissionForShip_Condition()
{
	if(MIS_RichtersPermissionForShip == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Richter_PermissionForShip_Info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Dej mi písemné pověření pro paladinskou loď.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//(smích) Ty ses musel zbláznit. Co to po mně chceš?
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//Slyšel jsi dobře. Dej mi to písemné oprávnění, nebo tě prásknu domobraně.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//(vrčí) Nenechám se vydírat! Ne od tebe! Nechám tě sežrat vlkům, ty mizernej šmejde.
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Morgahard napadl místodržícího tvým jménem. Mám dokument, který to dokazuje.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//(vrčí) Arrh.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//Toho budeš litovat. Nikdo mě nebude vydírat, aniž by z toho vyváz se zdravou kůží.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Tady je to tvé oprávnění. A teď vypadni. Vyřídím si to s tebou později.
	CreateInvItems(self,ITWr_ForgedShipLetter_MIS,1);
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	B_LogEntry(Topic_Ship,"S plnou mocí v kapse mohu získat loď, než bys řekl švec. Jsem zvědavý, co tomu řekne Lee.");
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP(XP_RichtersPermissionForShip);
};


instance DIA_Richter_perm2(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_perm2_Condition;
	information = DIA_Richter_perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Richter_perm2_Condition()
{
	if((MIS_RichtersPermissionForShip == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Richter_perm2_Info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//Ztrať se mi z očí.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_PICKPOCKET(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 900;
	condition = DIA_Richter_PICKPOCKET_Condition;
	information = DIA_Richter_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tenhle klíč lze snadno ukrást)";
};


func int DIA_Richter_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Richter) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Richter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
	Info_AddChoice(DIA_Richter_PICKPOCKET,Dialog_Back,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Richter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_Richter,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Richter_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
};


