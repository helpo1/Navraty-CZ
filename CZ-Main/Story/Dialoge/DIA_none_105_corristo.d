
instance DIA_NONE_105_CORRISTO_EXIT(C_Info)
{
	npc = none_105_corristo;
	nr = 999;
	condition = dia_none_105_corristo_exit_condition;
	information = dia_none_105_corristo_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_none_105_corristo_exit_condition()
{
	return TRUE;
};

func void dia_none_105_corristo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_105_CORRISTO_HALLO(C_Info)
{
	npc = none_105_corristo;
	nr = 1;
	condition = dia_none_105_corristo_hallo_condition;
	information = dia_none_105_corristo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_none_105_corristo_hallo_condition()
{
	if((TALKTOCORRISTO == FALSE) && (FIREMAGECOMES == TRUE) && (RESCUEGOMEZSTEPTHREE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_none_105_corristo_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	TALKTOCORRISTO = TRUE;
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_01_00");	//KDO NÁS TO PŘIVOLAL? (mrtvolně) KDO RUŠÍ NÁŠ POSVÁTNÝ ODPOČINEK?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_01_02");	//Kdo jsi?
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_01_03");	//Ty jsi mě nepamatuješ?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_01_04");	//Hmm... (zadumaně) Ano, tvá tvář je mi povědomá. Ale uběhlo už tolik času...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_01_05");	//Nechtěl bys mi připomenout, kým jsi kdysi byl?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Byl jsem strážcem ve Starém táboře.",dia_none_105_corristo_hallo_gomezwatch);
	Info_AddChoice(dia_none_105_corristo_hallo,"Byl jsem žoldákem v Novém táboře.",dia_none_105_corristo_hallo_naemniklee);
	Info_AddChoice(dia_none_105_corristo_hallo,"Byl jsem templářem v Bratrstvu.",dia_none_105_corristo_hallo_sleeper);
	Info_AddChoice(dia_none_105_corristo_hallo,"Byl jsem mágem Vody.",dia_none_105_corristo_hallo_watermage);
	Info_AddChoice(dia_none_105_corristo_hallo,"Byl jsem mágem Ohně, mistře!",dia_none_105_corristo_hallo_firemage);
};

func void dia_none_105_corristo_hallo_gomezwatch()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_GomezWatch_01_00");	//Byl jsem strážcem ve Starém táboře.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_GomezWatch_01_01");	//Přesně! Byl jsi jedním z Thorusových mužů v Gomezově stráži.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_GomezWatch_01_02");	//Už si na tebe vzpomínám... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_GomezWatch_01_03");	//Teď mi řekni, co tě přimělo obrátit se na nás? Proč jsi nás vyhledal?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Potřebuji vaši pomoc.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_naemniklee()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_00");	//Byl jsem žoldákem v Novém táboře.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_01");	//Ach, ano! Byl jsi jedním z mužů generála Leeho...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_02");	//Už si na tebe vzpomínám, žoldáku... (mrtvolně)

	if(other.guild == GIL_SLD)
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(250);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
		MEMORYBONUS = TRUE;
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_03");	//A vidím, že ještě pořád jsi pod jeho velením.
		AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_04");	//Máš pravdu.
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_05");	//Hmm... (zamyšleně) Nu, taková oddanost svým ideálům je hodná respektu!
	};

	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_06");	//Teď mi řekni, co tě přimělo obrátit se na nás? Proč jsi nás vyhledal?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Potřebuji vaši pomoc.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_sleeper()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_00");	//Byl jsem templářem v Bratrstvu.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_01");	//Ach, ano - byl jsi jedním z uctívačů Spáče... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_02");	//Už si na tebe vzpomínám, sektáři.
	if((other.guild == GIL_TPL) && (other.guild == GIL_SEK) && (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_03");	//A taky vidím, že jsi své cestě zůstal oddaný.
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_04");	//Hmm... (zamyšleně) Nu, taková oddanost svým ideálům je hodná respektu!
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_05");	//I přesto, že se váš bůh ukázal být jen zlým démonem...
		B_GivePlayerXP(250);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
	};
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_08");	//Teď mi řekni, co tě přimělo obrátit se na nás? Proč jsi nás vyhledal?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Potřebuji vaši pomoc.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_watermage()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_00");	//Byl jsem mágem Vody.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_01");	//Ach, ano. Už si na tebe vzpomínám... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_02");	//Vypadá to, že Saturas si dal tu námahu a usměrnil tě na cestu služby Adanovi...
	if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_04");	//A jak vidím, svou přísahu jsi pořád neporušil.
		B_GivePlayerXP(250);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
	};
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_07");	//Teď mi řekni, co tě přimělo obrátit se na nás? Proč jsi nás vyhledal?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Potřebuji vaši pomoc.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_firemage()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_FireMage_01_00");	//Byl jsem mágem Ohně, mistře! Byl jsi mým učitelem.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_01");	//Ach, ano! Byl jsi mým učedníkem - jak jsem jen mohl zapomenout... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_02");	//Už si na tebe vzpomínám, synu.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_03");	//A jak vidím, svou přísahu Ohni a Innosovi jsi pořád neporušil!
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_04");	//Taková oddanost Innosovi je hodna respektu!
		B_GivePlayerXP(500);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
	}
	else
	{
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_08");	//Ale jak vidím, porušil jsi svou přísahu Innosovi a Ohni.
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_09");	//A to mě hodně mrzí... (mrtvolně)
	};
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_10");	//Teď mi řekni, co tě přimělo obrátit se na nás? Proč jsi nás vyhledal?
	Info_ClearChoices(dia_none_105_corristo_hallo);
Info_AddChoice(dia_none_105_corristo_hallo,"Potřebuji vaši pomoc.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_rescue()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_00");	//Potřebuji vaši pomoc.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_01");	//A co od nás chceš?
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_02");	//Chci, abyste udělili své odpuštění duši jedné osoby.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_03");	//Pak raději ani nepokračuj... (mrtvolně)
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_04");	//Proč?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_05");	//Protože myslím, že vím, oč nás žádáš.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_07");	//(mrtvolný povzdech) Jenom jedna osoba nás může žádat o odpuštění svých hříchů.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_08");	//Ten, jehož vinou jsme tady jako duchové, a ne živí lidé...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_09");	//... ten, kdo kvůli zlatu a moci neváhal pozvednout meč na posvátné služebníky Innose...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_10");	//... a jediný, komu nemůže být odpuštěno a jehož duši kvůli jeho hříchům ho prokleli samotní bohové... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_14");	//A TY CHCEŠ, ABYCHOM UDĚLILI ODPUŠTĚNÍ NAŠEMU KATOVI?!
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_15");	//Chápu, že moje žádost zní poněkud neobyčejně.
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_16");	//Ale myslím, že ať už byl kdokoli a udělal cokoli, zaslouží si alespoň jednu šanci na vykoupení.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_18");	//Jen sám Innos posoudí, kdo si co zaslouží.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_19");	//Ale ve tvých slovech se najde i zrnko pravdy - opravdu každý dostane příležitost odčinit své hříchy.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_21");	//(zadumaně) Abych pravdu řekl - myslím, že Gomez by měl dostat šanci zasloužit si naše odpuštění.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_22");	//Kromě toho, jeho prokletá duše je teď schopná udělat už jen velice málo... (mrtvolně)
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_23");	//Pak bych pro vás možná mohl udělat něco, co by vás přimělo zaručit mu svobodu.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_26");	//(mrtvolně) Dobrá tedy. Tak dobře poslouchej...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_27");	//Na západě údolí, nedaleko Xardasovy staré věže, se nachází stará opuštěná krypta.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_28");	//Vstup do ní je bezpečně ukrytý za kamennou deskou, aby se do ní nešlo dostat... (mrtvolně)
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_29");	//A co je v ní?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_33");	//Zlo... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_34");	//Nevíme přesně, co v ní je. Ale není pochyb, že tam něco opravdu je!
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_35");	//Proto jsem zvážil tvou požadavku a přišel jsem na to, že pokud má být jednomu zlu odpuštěno... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_36");	//... jiné zlo, které se v tomhle světě nachází, musí být zničeno!
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_37");	//Jak jistě chápeš, my to udělat nedokážeme. Potřebujeme tedy pomoc.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_38");	//Doufám, že už nemusím víc vysvětlovat. Tohle je to, co žádáme, abychom odpustili Gomezovi... (mrtvolně)
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_39");	//Chceš říct, že musím jít do té hrobky a zničit zlo, co se tam nachází?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_40");	//Ano... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_41");	//Pokud tenhle úkol vykonáš, Gomezovi bude odpuštěno.
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Počkej, musím si to rozmyslet.",dia_none_105_corristo_hallo_no);
	Info_AddChoice(dia_none_105_corristo_hallo,"Dobrá, souhlasím.",dia_none_105_corristo_hallo_yes);
};

func void dia_none_105_corristo_hallo_no()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_No_01_00");	//Počkej, musím si to rozmyslet.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_No_01_01");	//Ne... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_No_01_05");	//Už sis vybral, tím, že jsi nás přivolal.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_No_01_06");	//Teď za to tedy zaplatíš... (mrtvolně)
};

func void dia_none_105_corristo_hallo_yes()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Yes_01_00");	//Dobrá, souhlasím.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_01");	//Tak se tam okamžitě vydej a znič všechno zlo, které na své pouti potkáš... (mrtvolně)
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Yes_01_02");	//Počkej. Říkal jsi přece, že vchod je zavřený - jak se tam mám tedy dostat?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_03");	//Tím se netrap... (mrtvolně) Deska, která zakrývá vstup, ti už nebude překážkou.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_04");	//Jakmile se tam dostaneš, pochopíš.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_06");	//Jdi! Počkáme tu na tebe.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_07");	//Ať tě Innos ochraňuje!
	CORRISTOSENDKILLDEMON = TRUE;
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Mistr Corristo a ostatní mágové Ohně souhlasili, že udělí Gomezovi své odpuštění, když pro ně splním jejich úkol. Musím jít na západ, směrem ke Xardasovy staré věži, a nedaleko ní najít opuštěnou kryptu. Podle Corrista ji obývá zlo, které bych měl zničit. Kamenná deska, která blokuje vchod do krypty, pro mne už nebude problémem.");
	AI_StopProcessInfos(self);
};


instance DIA_NONE_105_CORRISTO_DEMONDONE(C_Info)
{
	npc = none_105_corristo;
	nr = 1;
	condition = dia_none_105_corristo_demondone_condition;
	information = dia_none_105_corristo_demondone_info;
	permanent = FALSE;
	description = "Vyčistil jsem hrobku od zla!";
};


func int dia_none_105_corristo_demondone_condition()
{
	if((TALKTOCORRISTO == TRUE) && (CORRISTOSENDKILLDEMONDONE == TRUE) && (MIS_RESCUEGOMEZ == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_none_105_corristo_demondone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_105_Corristo_DemonDone_01_00");	//Vyčistil jsem hrobku od zla!
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_01_01");	//Já vím... (mrtvolně)
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_01_06");	//Gomez dostane naše odpuštění.
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_01_07");	//A jeho duše teď může najít dlouho očekávaný odpočinek... (mrtvolně)
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Poté, co jsem navštívil kryptu a zničil tamější zlo, se mágové Ohně shodli, že duše rudobarona Gomeze dostane jejich odpuštění.");
	Info_ClearChoices(dia_none_105_corristo_demondone);
	Info_AddChoice(dia_none_105_corristo_demondone,"...",dia_none_105_corristo_demondone_free);
};

func void dia_none_105_corristo_demondone_free()
{
	RESCUEGOMEZSTEPTHREEDONE = TRUE;
	if((RESCUEGOMEZSTEPONEDONE == TRUE) && (RESCUEGOMEZSTEPTWODONE == TRUE) && (RESCUEGOMEZSTEPTHREEDONE == TRUE) && (MIS_RESCUEGOMEZ == LOG_Running))
	{
		GOMEZISFREE = TRUE;
		B_LogEntry(TOPIC_RESCUEGOMEZ,"Teď bych se měl vrátit za Gomezem a oznámit mu, že jeho duše je svobodná.");
	};
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	Npc_ExchangeRoutine(none_105_corristo,"TOT");
	Npc_ExchangeRoutine(none_106_rodriguez,"TOT");
	Npc_ExchangeRoutine(none_107_damarok,"TOT");
	Npc_ExchangeRoutine(none_108_drago,"TOT");
	Npc_ExchangeRoutine(none_109_torrez,"TOT");
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_Free_01_00");	//Gomez získal naše odpuštění... (mrtvolně) Je svobodný!
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_Free_01_01");	//Jdi a řekni mu to.
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_Free_01_02");	//Náš čas nadešel... (mrtvolně) Svět smrtelníků je pro nás už příliš vyčerpávající.
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_Free_01_03");	//Sbohem, smrtelníku. Ať tě Innos ochraňuje!
	AI_StopProcessInfos(self);
};

