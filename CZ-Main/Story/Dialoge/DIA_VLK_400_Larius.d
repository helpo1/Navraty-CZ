
instance DIA_Larius_EXIT(C_Info)
{
	npc = VLK_400_Larius;
	nr = 999;
	condition = DIA_Larius_EXIT_Condition;
	information = DIA_Larius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Larius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Larius_Hello(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = DIA_Larius_Hello_Condition;
	information = DIA_Larius_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Larius_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Larius_Hello_Info()
{
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Co tady děláš? Jestli něco chceš, musíš si nejdřív sjednat schůzku.
};


instance DIA_Larius_WhoAreYou(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_WhoAreYou_Condition;
	information = DIA_Larius_WhoAreYou_Info;
	permanent = FALSE;
	description = "Kdo jste?";
};


func int DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

func void DIA_Larius_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Kdo jste?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Jsem Larius, místodržící města Khorinis, a služebník našeho krále Rhobara.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//I když to tak teď asi nevypadá, jsem nejmocnějším mužem ve městě.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//Takže vy vedete toto město?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//Já... no... teď zrovna mám svázané ruce.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Velí tady tomu lord Hagen, králův generál a Innosův válečník. Alespoň po tu dobu, co je ve městě.
};


instance DIA_Larius_Disturb(C_Info)
{
	npc = VLK_400_Larius;
	nr = 3;
	condition = DIA_Larius_Disturb_Condition;
	information = DIA_Larius_Disturb_Info;
	permanent = TRUE;
	description = "Nechtěl jsem Vás rušit můj pane.";
};


func int DIA_Larius_Disturb_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou) && Wld_IsTime(14,0,12,0))
	{
		return TRUE;
	};
};

func void DIA_Larius_Disturb_Info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Nechtěl jsem Vás rušit můj pane.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//Jenže se ti to vůbec nepovedlo! Takže vypadni!
};


instance DIA_Larius_DieLage(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_DieLage_Condition;
	information = DIA_Larius_DieLage_Info;
	permanent = TRUE;
	description = "Jak to jde, pane?";
};


func int DIA_Larius_DieLage_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void DIA_Larius_DieLage_Info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//Jak to jde, pane?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//Co tady chceš? Dokud jsou paladinové ve městě, mají veškeré věci kolem Khorinisu na starosti oni.
};


instance DIA_Larius_Richterueberfall(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_Richterueberfall_Condition;
	information = DIA_Larius_Richterueberfall_Info;
	description = "Soudce si najal nějaké bandity, aby tě napadli. Můžu to prokázat.";
};


func int DIA_Larius_Richterueberfall_Condition()
{
	if((SCKnowsRichterKomproBrief == TRUE) && Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void DIA_Larius_Richterueberfall_Info()
{
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//Soudce si najal nějaké bandity, aby tě napadli. Můžu to prokázat.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//Přestaň plácat takové nesmysly, nebo snad chceš, abych tě nechal vsadit do želez?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//I kdybys byl válečníkem našeho boha a Pána Innose...
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//I kdybys byl mágee...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//Mé slovo má v tomhle městě stále ještě svou váhu. Už se nikdy víc neopovažuj špinit jméno soudce!
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Larius_PICKPOCKET(C_Info)
{
	npc = VLK_400_Larius;
	nr = 900;
	condition = DIA_Larius_PICKPOCKET_Condition;
	information = DIA_Larius_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Larius_PICKPOCKET_Condition()
{
	return C_Beklauen(35,120);
};

func void DIA_Larius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
	Info_AddChoice(DIA_Larius_PICKPOCKET,Dialog_Back,DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Larius_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};


instance DIA_LARIUS_DROGENPACKET(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = dia_larius_drogenpacket_condition;
	information = dia_larius_drogenpacket_info;
	permanent = TRUE;
	important = FALSE;
	description = "Něco pro vás mám.";
};


func int dia_larius_drogenpacket_condition()
{
	if((MIS_ORUNPACKET == LOG_Running) && (Npc_HasItems(other,itmi_drogenpocket) >= 1) && (LARIUSTALKPACKET == FALSE) && Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void dia_larius_drogenpacket_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Larius_DrogenPacket_01_00");	//Něco pro vás mám.
	AI_Output(self,other,"DIA_Larius_DrogenPacket_01_01");	//Co?
	AI_Output(other,self,"DIA_Larius_DrogenPacket_01_02");	//Baal Orun vám posílá tuto zásilku.
	AI_Output(self,other,"DIA_Larius_DrogenPacket_01_03");	//Hmm... (podívá se)

	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE))
	{
		MeetLarius = TRUE;
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_04");	//Říkáš že tě poslal Baal Orun?
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_05");	//Dobrá, tak tady máš.
		B_GiveInvItems(other,self,itmi_drogenpocket,1);
		Npc_RemoveInvItems(self,itmi_drogenpocket,1);
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_06");	//Uff! Konečně, už mně to čekání unavovalo!
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_07");	//Tu máš, dej mu to. A neopovažuj se to otevří jasný? A drž hubu o všem co si tady teď viděl.
		B_GiveInvItems(self,other,itmi_lariusgoldpocket,1);
		B_LogEntry(TOPIC_ORUNPACKET,"Setkal jsem se s Lariusem, místodržícím města Khorinis. Dal mi zásilku pro Baala Oruna.");

		if(TALKLARIUSABOUTTALIASAN == TRUE)
		{
			Npc_ExchangeRoutine(self,"Always");
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_10");	//A co Baal Orun, posílá ještě něco?
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_11");	//Kdo vůbec jsi?!
		AI_Output(other,self,"DIA_Larius_DrogenPacket_01_12");	//Já jsem jeho služebník. Neposílá již nic.
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_13");	//Pravděpodobně jsem si tedy spletl poslíčka... (zklamaně)
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_14");	//Takže na co ještě čekáš!
		B_LogEntry(TOPIC_ORUNPACKET,"Setkal jsem se s Lariusem. Byl velmi nervozní když jsem se zmínil o Baal Orunovi. Larius odmítnul přijmout balíček, co jsem udělal špatně?");
		AI_StopProcessInfos(self);
		LARIUSTALKPACKET = TRUE;
		LARIUSCANCELPACKET = 0;
	};
};


instance DIA_LARIUS_DROGENPACKETAGAIN(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = dia_larius_drogenpacketagain_condition;
	information = dia_larius_drogenpacketagain_info;
	permanent = TRUE;
	important = FALSE;
	description = "Ohledně té zásilky...";
};


func int dia_larius_drogenpacketagain_condition()
{
	if((MIS_ORUNPACKET == LOG_Running) && (Npc_HasItems(other,itmi_drogenpocket) >= 1) && (LARIUSTALKPACKET == TRUE) && (LARIUSCANCELPACKET < 2))
	{
		return TRUE;
	};
};

func void dia_larius_drogenpacketagain_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Larius_DrogenPacketAgain_01_00");	//Ohledně té zásilky...
	AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_01");	//Co?!... (velice rozzlobeně)

	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE))
	{
		MeetLarius = TRUE;
		AI_Output(other,self,"DIA_Larius_DrogenPacketAgain_01_02");	//Nemohl jsem to mít. Posílá mne Baal Orun!
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_03");	//Hmm... (podívá se)
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_04");	//Baal Orun, povídáš (zamyšleně)
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_05");	//Fajn, dej to sem!
		B_GiveInvItems(other,self,itmi_drogenpocket,1);
		Npc_RemoveInvItems(self,itmi_drogenpocket,1);
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_06");	//Konečně! To čekání mně unavovalo!
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_07");	//Tu máš! Dej to svému pánovi!
		B_GiveInvItems(self,other,itmi_lariusgoldpocket,1);
		B_LogEntry(TOPIC_ORUNPACKET,"Larius přijal balíček a posílá obratem zásilku Baalu Orunovi.");
		if(TALKLARIUSABOUTTALIASAN == TRUE)
		{
			Npc_ExchangeRoutine(self,"Always");
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		LARIUSCANCELPACKET = LARIUSCANCELPACKET + 1;
		if(LARIUSCANCELPACKET != 2)
		{
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_10");	//Poslouchej chlape!
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_11");	//Ještě jednou se mi to pokusíš vnutit, a skončíš za mřížemi!
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_12");	//Jasné?!
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_13");	//Varoval jsem tě! Tohle si přehnal hajzle!
			AI_Standup(self);
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_14");	//Stráže!
			MIS_ORUNPACKET = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_ORUNPACKET);

			if(TALKLARIUSABOUTTALIASAN == TRUE)
			{
				Npc_ExchangeRoutine(self,"Always");
			};

			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_NONE,1);
		};
	};
};


instance DIA_LARIUS_LETTERFROMTALIASAN(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = dia_larius_letterfromtaliasan_condition;
	information = dia_larius_letterfromtaliasan_info;
	permanent = FALSE;
	description = "Ohledně úkolu.";
};


func int dia_larius_letterfromtaliasan_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_taliasanrecomendedletters) >= 1) && (TALIASANHELP_STEP1 == TRUE) && Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void dia_larius_letterfromtaliasan_info()
{
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_00");	//Ohledně úkolu.
	AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_01");	//Jakého úkolu?
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_02");	//Jeden člověk by se rád vrátil ke své práci.
	AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_04");	//Ano?! A kdo to je?
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_05");	//Jmenuje se Gallahad.
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_06");	//Prý velmi lituje toho, co se stalo, a žádá o odpuštění.
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_07");	//Také mám jisté papíry s doporučením od jistých obyvatel tohoto města...
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_08");	//... Gallahad jim velmi pomohl a oni na to nezapomněli.

	if(Wld_IsTime(12,0,14,0))
	{
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_09");	//(překvapen) Takže tebe poslal Gallahad?!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_10");	//To od něj je odvážné, rozhodnout se pro takovýto krok.
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_11");	//Říkáš, že máš dopisy, které se zastávají Gallahada, od lidí z města?
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_13");	//Tak dobrá, ukaž mi je...
		AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_14");	//Tady jsou.
		B_GiveInvItems(other,self,itwr_taliasanrecomendedletters,1);
		Npc_RemoveInvItems(self,itwr_taliasanrecomendedletters,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_15");	//Hmmm... (zaskočen) Zajímavé!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_16");	//Je tam hodně o tom, jak je to dobrý člověk.
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_17");	//A autoři jsou samí významní lidé!
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_21");	//Dobrá!... (panovačně)
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_22");	//Můžeš se vrátit za Gallahadem a vyřídit mu, že jsem ochoten na náš incident zapomenout.
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_24");	//V každém případě oceňuji Gallahadovu dobrou práci!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_25");	//Takže myslím, že nyní by se mohl vrátit do mých služeb.
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_26");	//Řekni mu, že je znovu městským mágem.
		TALKLARIUSABOUTTALIASAN = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_LogEntry(TOPIC_TALIASANHELP,"Je to zvláštní, ale Larius mě vyslyšel. Podíval se na dopisy s doporučením. Řekl mi, že Gallahad je velmi užitečný a zapomene kvůli tomu na staré spory - to znamená, že se můžu vrátit ke Gallahadovi a říct mu, že je znovu městským mágem.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_32");	//COŽE?! Gallahad?!... (úplně mimo)
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_33");	//Ten starý zabedněnec?!... (rozhněvaně)
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_35");	//To už nemůže být ani pravda!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_36");	//A nějaké počmárané kousky papíru - ty jsou mi tam, kde slunko nesvítí!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_40");	//A teď jdi z mých očí, jinak zavolám stráže!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_41");	//!... (začíná křičet)
		LARIUSPISSOFF = TRUE;
		TALKLARIUSABOUTTALIASAN = TRUE;
		B_LogEntry(TOPIC_TALIASANHELP,"Larius o ničem nechtěl ani slyšet a vykázal mě z radnice.");
		AI_StopProcessInfos(self);
	};
};


