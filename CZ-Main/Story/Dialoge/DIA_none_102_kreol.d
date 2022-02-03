/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků


v1.01:

(6x) CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)


v1.00:

(6x) var int KREOL_ITEMSGIVEN_CHAPTER_... - upravena nabídka obchodníka
func void dia_kreol_trade_info - upravena nabídka obchodníka

*/



var int KREOL_ITEMSGIVEN_CHAPTER_1;
var int KREOL_ITEMSGIVEN_CHAPTER_2;
var int KREOL_ITEMSGIVEN_CHAPTER_3;
var int KREOL_ITEMSGIVEN_CHAPTER_4;
var int KREOL_ITEMSGIVEN_CHAPTER_5;
var int KREOL_ITEMSGIVEN_CHAPTER_6;

instance DIA_KREOL_EXIT(C_Info)
{
	npc = none_102_kreol;
	nr = 999;
	condition = dia_kreol_exit_condition;
	information = dia_kreol_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_kreol_exit_condition()
{
	return TRUE;
};

func void dia_kreol_exit_info()
{
	if(MIS_FINDKREOL == LOG_Running)
	{
		B_GivePlayerXP(100);
		Log_SetTopicStatus(TOPIC_FINDKREOL,LOG_SUCCESS);
		MIS_FINDKREOL = LOG_SUCCESS;
	};

	AI_StopProcessInfos(self);
};

func void dia_kreol_hello_ext()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_67");	//Uvidíme, kdo z nás zemře!
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_54");	//Bude z tebe skvělý kostlivý mág.
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_55");	//Bude z tebe skvělý kostlivý válečník.
	};

	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_03,1,500);
	}
	else if(SBMODE == 2)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
	}
	else if(SBMODE == 4)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
	};

	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"... (KONEC)",dia_kreol_hello_end_trans);
};

func void dia_kreol_noforever_ext()
{
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_54");	//Bude z tebe skvělý kostlivý mág.
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_55");	//Bude z tebe skvělý kostlivý válečník.
	};

	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_03,1,500);
	}
	else if(SBMODE == 2)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
	}
	else if(SBMODE == 4)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
	};

	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"... (KONEC)",dia_kreol_hello_end_trans);
};

func void dia_kreol_demonlanguage_ext()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_14_53");	//To bude špatné, špatné pro tebe!
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_54");	//Bude z tebe skvělý kostlivý mág.
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_55");	//Bude z tebe skvělý kostlivý válečník.
	};

	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_03,1,500);
	}
	else if(SBMODE == 2)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
	}
	else if(SBMODE == 4)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
	};

	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"... (KONEC)",dia_kreol_hello_end_trans);
};

func void dia_kreol_hello_end_trans()
{
	AI_StopProcessInfos(self);
};

instance DIA_KREOL_HELLO(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_hello_condition;
	information = dia_kreol_hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_kreol_hello_condition()
{
	return TRUE;
};

func void dia_kreol_hello_info()
{
	Npc_ExchangeRoutine(self,"KreolRoutine");
	AI_Output(self,other,"DIA_Kreol_Hello_14_00");	//KDO SE OPOVAŽUJE RUŠIT MĚ U MÉHO VÝZKUMU?
	AI_Output(self,other,"DIA_Kreol_Hello_14_03");	//Jak ses sem dostal?
	AI_Output(other,self,"DIA_Kreol_Hello_14_04");	//No, nebylo to zrovna nejlehčí - potkal jsem hodně nemrtvých!
	AI_Output(self,other,"DIA_Kreol_Hello_14_05");	//To byli mí služebníci a divím se, že ještě žiješ.
	AI_Output(other,self,"DIA_Kreol_Hello_14_06");	//Ty jsi nekromant?!
	AI_Output(self,other,"DIA_Kreol_Hello_14_08");	//(naštvaně) Ano, co ode mně chceš?!

	if(MIS_FINDKREOL == LOG_Running)
	{
		B_GivePlayerXP(100);
		Log_SetTopicStatus(TOPIC_FINDKREOL,LOG_SUCCESS);
		B_LogEntry(TOPIC_FINDKREOL,"Našel jsem nekromanta Creola. Vypadá to, že se zabydlel v Zamlžené věži. Bylo dost těžké se k němu dostat - zřejmě má rád klid a samotu.");
		MIS_FINDKREOL = LOG_SUCCESS;
	};

	Wld_InsertNpc(Demon,"OW_FOGDUNGEON_36_MOVEMENT2");

	if(XARDASTELLABOUTKREOL == TRUE)
	{
		Info_AddChoice(dia_kreol_hello,"Myslím, že naše setkání není náhoda.",dia_kreol_hello_prophecy);
	};
	if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE))
	{
		Info_AddChoice(dia_kreol_hello,"Potřebuji tvou pomoc, nekromante.",dia_kreol_hello_mora);
	};
	if(other.guild == GIL_KDM)
	{
		Info_AddChoice(dia_kreol_hello,"Hledám učitele magie Temnoty, mistře.",dia_kreol_hello_teach);
	};

	Info_AddChoice(dia_kreol_hello,"Přišel jsem tě zabít!",dia_kreol_hello_kill);
	Info_AddChoice(dia_kreol_hello,"Vypadáš překvapeně.",dia_kreol_hello_fuckoff);

	// if(RhetorikSkillValue[1] >= 40)
	// {
		Info_AddChoice(dia_kreol_hello,
			ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 40, TRUE), "Nechci rušit tvou samotu."),
			// "Nechci rušit tvou samotu.",
			dia_kreol_hello_sorry);
	// };

	Info_AddChoice(dia_kreol_hello,"Omylem jsem narazil na toto místo.",dia_kreol_hello_dontknow);
};

func void dia_kreol_hello_mora()
{
	AI_Output(other,self,"DIA_Kreol_Hello_Mora_01_00");	//Potřebuji tvou pomoc, nekromante.
	AI_Output(self,other,"DIA_Kreol_Hello_Mora_01_02");	//Jmenuj jeden důvod, proč bych ti měl pomoci...
	AI_Output(self,other,"DIA_Kreol_Hello_Mora_01_03");	//... tak co, ty ubohý červe?!
	AI_Output(other,self,"DIA_Kreol_Hello_Mora_01_04");	//Senyak!
	AI_Output(self,other,"DIA_Kreol_Hello_Mora_01_06");	//(zamyšleně) Hmm... Dobrá, to jako důvod bude stačit.
	AI_Output(self,other,"DIA_Kreol_Hello_Mora_01_07");	//Nuže! Ptej se.
	Info_ClearChoices(dia_kreol_hello);
};

func void dia_kreol_hello_teach()
{
	AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_00");	//Hledám učitele magie Temnoty, mistře.
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_01");	//Ha, ha, ha!...
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_02");	//A proč si myslíš, že bych tě učil?!
	AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_03");	//Jsem také nekromant, ale mé znalosti jsou bohužel poněkud omezené...
	if(Kapitel >= 5)
	{
		AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_04");	//A můj bývalý učitel zmizel...
		AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_05");	//... A kdo byl tvůj učitel?!
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_06");	//... A kdo byl tvůj učitel?!
	};
	AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_08");	//Xardas! Znáš ho?
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_09");	//Xardas?! Hmm... (zaskočen)
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_10");	//No jestli tě učil Xardas, tak to už něco znamená!
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_11");	//Je to opravdový mistr a nebere do učení jen tak někoho!
	AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_13");	//Můžu teda pokračovat ve výcviku u tebe?
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_23");	//Dobrá, budu tě cvičit v umění magie Temnoty.
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_26");	//Doufám, že nezačneš pochybovat o svém rozhodnutí.
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_27");	//Teď jdi a dělej něco užitečného!
	Info_ClearChoices(dia_kreol_hello);
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Creol mě bude učit tajemstvím magie Temnoty.");
	KREOL_MYTEACHER = TRUE;
};

func void dia_kreol_hello_prophecy()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_52");	//Věděl jsem, že tu budeš.
	AI_Output(self,other,"DIA_Kreol_Hello_14_55");	//Kdo ti o mě řekl?!
	AI_Output(other,self,"DIA_Kreol_Hello_14_56");	//Xardas!
	AI_Output(self,other,"DIA_Kreol_Hello_14_57");	//Xardas? Ano vzpomínám na něho, byl dřív mágem Ohně!

	if(other.guild == GIL_KDM)
	{
		AI_Output(other,self,"DIA_Kreol_Hello_14_61");	//Xardas je můj mentor, já také náležím ke kruhu temných mágů.
		AI_Output(self,other,"DIA_Kreol_Hello_14_63");	//Takže ty jsi také nekromant... Vybral sis velmi náročnou cestu.
	};

	AI_Output(self,other,"DIA_Kreol_Hello_14_65");	//Ale dost řečí! Chtěl ses se mnou setkat, tak teď stojím před tebou!
	AI_Output(self,other,"DIA_Kreol_Hello_14_66");	//Mluv, co ode mne chceš?
	Info_ClearChoices(dia_kreol_hello);
};

func void dia_kreol_hello_kill()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_10");	//Přišel jsem tě zabít!

	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(other.guild == GIL_PAL)
		{
			AI_Output(other,self,"DIA_Kreol_Hello_14_11");	//Je mou svatou povinností paladina Innosova zničit veškeré zlo z temnot!
			AI_Output(self,other,"DIA_Kreol_Hello_14_14");	//Vyzvat mě, jednoho z vyvolených Beliara, to je tvůj poslední omyl.
			AI_Output(self,other,"DIA_Kreol_Hello_14_15");	//Zemři, ubohý červe!
		}
		else
		{
			AI_Output(other,self,"DIA_Kreol_Hello_14_16");	//Je mou svatou povinností služebníka Innosova zničit veškeré zlo z temnot!
			AI_Output(self,other,"DIA_Kreol_Hello_14_19");	//Vyzvat mě, jednoho z vyvolených Beliara, to je tvůj poslední omyl.
			AI_Output(self,other,"DIA_Kreol_Hello_14_20");	//Innos ti nepomůže, zemři ubohý červe.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_Hello_14_22");	//Vyzvat mě, jednoho z vyvolených Beliara, to je tvůj poslední omyl.
		AI_Output(self,other,"DIA_Kreol_Hello_14_23");	//Nyní zemřeš a temnému pánu budeš sloužit i po smerti!
		AI_Output(self,other,"DIA_Kreol_Hello_14_24");	//Zemři, ubohý červe!
	};
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"Na to se ještě podíváme, kdo z nás zemře.",dia_kreol_hello_ext);
};

func void dia_kreol_hello_fuckoff()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_25");	//To se tě netýká!
	AI_Output(self,other,"DIA_Kreol_Hello_14_26");	//(naštvaně) Asi jsi ještě nepochopil, s kým mluvíš. Tvá drzost zde nebude tolerována.
	AI_Output(self,other,"DIA_Kreol_Hello_14_30");	//A nyní ti to objasním. Zemři, ubohý červe!
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"Na to se ještě podíváme, kdo z nás zemře.",dia_kreol_hello_ext);
};

func void dia_kreol_hello_dontknow()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_31");	//Jsem tady náhodou.
	AI_Output(self,other,"DIA_Kreol_Hello_14_33");	//Své samoty si velmi cením a nenechám se jen tak rušit!
	AI_Output(self,other,"DIA_Kreol_Hello_14_34");	//A nyní ti to objasním. Zemři, ubohý červe!
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"Na to se ještě podíváme, kdo z nás zemře.",dia_kreol_hello_ext);
};

func void dia_kreol_hello_sorry()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_40");	//Neměl jsem tušení, že kromě mrtvých zde ještě někoho potkám.
	AI_Output(self,other,"DIA_Kreol_Hello_14_43");	//Nikdo nesmí rušit můj klid a vtrhnout sem bez pozvání!
	AI_Output(self,other,"DIA_Kreol_Hello_14_45");	//Rozhodl jsem se zachovat tvůj život a neudělat s tebou to, co s předchozími návštěvníky.
	AI_Output(self,other,"DIA_Kreol_Hello_14_50");	//A teď mě zmiz z očí, než si to rozmyslím.
	AI_Output(self,other,"DIA_Kreol_Hello_14_51");	//A pamatuj, že naše příští setkání už nebude tak přátelské!
	KREOL_WARN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_KREOL_NOFOREVER(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_noforever_condition;
	information = dia_kreol_noforever_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_kreol_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KREOL_WARN == TRUE))
	{
		return TRUE;
	};
};

func void dia_kreol_noforever_info()
{
	if((XARDASTELLABOUTKREOL == TRUE) && (KREOL_KILL == FALSE))
	{
		if(other.guild == GIL_KDM)
		{
			AI_Output(self,other,"DIA_Kreol_NoForever_01_00");	//Co to. Vidím, že ses stal nekromantem, kdo tě přijal?!
			AI_Output(other,self,"DIA_Kreol_NoForever_01_01");	//Xardas!
		}
		else
		{
			AI_Output(self,other,"DIA_Kreol_NoForever_01_02");	//Nezkoušej mě! Říkal jsem, abys mi zmizel z očí!
			AI_Output(other,self,"DIA_Kreol_NoForever_01_03");	//Poslal mě sem Xardas.
		};

		AI_Output(self,other,"DIA_Kreol_NoForever_01_04");	//Xardas? ... Bývalý mág Ohně - ten mohl vědět, že tu jsem.

		if(other.guild == GIL_KDM)
		{
			AI_Output(self,other,"DIA_Kreol_NoForever_01_08");	//Takže ty jsi také nekromant... Vybral sis složitou cestu.
		};
		AI_Output(self,other,"DIA_Kreol_NoForever_01_10");	//Ale to je jedno, co po mě chceš?
	}
	else if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE) && (XARDASTELLABOUTKREOL == FALSE) && (KREOL_KILL == FALSE))
	{
		AI_Output(self,other,"DIA_Kreol_NoForever_01_13");	//Pokoušíš mou trpělivost, řekl jsem ti ať mi zmizíš z očí!
		AI_Output(other,self,"DIA_Kreol_NoForever_01_14");	//Tvá pomoc je pro mě nezbytná, nekromante.
		AI_Output(self,other,"DIA_Kreol_NoForever_01_16");	//Jmenuj jeden důvod, proč bych ti měl pomoci...
		AI_Output(self,other,"DIA_Kreol_NoForever_01_17");	//... Nuže, ubohý červe?!
		AI_Output(other,self,"DIA_Kreol_NoForever_01_18");	//Senyak!
		AI_Output(self,other,"DIA_Kreol_NoForever_01_20");	//No, to je opravdu pádný důvod.
		AI_Output(self,other,"DIA_Kreol_NoForever_01_21");	//Dobře. Co bys potreboval?
		Info_ClearChoices(dia_kreol_noforever);
	}
	else if((other.guild == GIL_KDM) && (XARDASTELLABOUTKREOL == FALSE) && (KREOL_KILL == FALSE))
	{
		AI_Output(self,other,"DIA_Kreol_NoForever_01_22");	//Jak vidím, stal ses nekromantem. A kdo je tvůj učitel?!
		AI_Output(other,self,"DIA_Kreol_NoForever_01_22a");	//Xardas.
		AI_Output(self,other,"DIA_Kreol_NoForever_01_23");	//Xardas...
		AI_Output(self,other,"DIA_Kreol_NoForever_01_25");	//Nevybírá si jen tak někoho!
		AI_Output(other,self,"DIA_Kreol_NoForever_01_26");	//Jak vidíš, jsem také nekromant, ale mé znalosti jsou bohužel poněkud omezené...
		AI_Output(other,self,"DIA_Kreol_NoForever_01_29");	//Můžu se u tebe učit?
		AI_Output(self,other,"DIA_Kreol_NoForever_01_36");	//Dobrá, budeš můj žák. Ale jestli něco zkusíš, poznáš můj hněv!
		AI_Output(self,other,"DIA_Kreol_NoForever_01_40");	//Doufám, že svého rozhodnutí nebudu litovat.
		AI_Output(self,other,"DIA_Kreol_NoForever_01_41");	//Nyní jdi a dělej něco užitečného!
		Info_ClearChoices(dia_kreol_noforever);
		Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Creol souhlasil, že mě bude učit magii Temnoty.");
		KREOL_MYTEACHER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_NoForever_01_11");	//Zkoušíš mou trpělivost, řekl jsem ti ať mi jdeš z očí!
		AI_Output(self,other,"DIA_Kreol_NoForever_01_12");	//Zemři!
		Info_ClearChoices(dia_kreol_noforever);
		Info_AddChoice(dia_kreol_noforever,"Počkej!",dia_kreol_noforever_ext);
	};
};


instance DIA_KREOL_DEMONLANGUAGE(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_demonlanguage_condition;
	information = dia_kreol_demonlanguage_info;
	important = FALSE;
	permanent = FALSE;
	description = "Co víš o jazyce démonů?";
};

func int dia_kreol_demonlanguage_condition()
{
	if(XARDASTELLABOUTKREOL == TRUE)
	{
		return TRUE;
	};
};

func void dia_kreol_demonlanguage_info()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_00");	//Co víš o jazyce démonů?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_01");	//Je to velký dar! Mnoho lidí to neví, ale zlepšuje pochopení magie Temnoty a její účinnost.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_03");	//Většina knih o magii Temnoty je psaná tímto jazykem.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_04");	//Ale jen vyvolení jsou hodni tohoto vědění!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_05");	//Proč tě to zajímá?
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_06");	//Chtěl bych se ho naučit, pomůžeš mi?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_08");	//Jmenuj jeden důvod - proč bych to měl dělat?
	Info_AddChoice(dia_kreol_demonlanguage,"Jestli to neuděláš, zabiju tě!",dia_kreol_demonlanguage_kill);
	Info_AddChoice(dia_kreol_demonlanguage,"Xardas řekl, že mi pomůžeš.",dia_kreol_demonlanguage_xardas);
	Info_AddChoice(dia_kreol_demonlanguage,"Musím splnit úkol Strážců!",dia_kreol_demonlanguage_guardian);
	Info_AddChoice(dia_kreol_demonlanguage,"Potřebuji to.",dia_kreol_demonlanguage_need);
	Info_AddChoice(dia_kreol_demonlanguage,"Chci se přesvědčit o tvé moci.",dia_kreol_demonlanguage_knowledge);
};

func void dia_kreol_demonlanguage_kill()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_09");	//Jestli to neuděláš, zabiju tě!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_10");	//Bude škoda tě zabít.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_11");	//Ale jen jeden z nás nyní přežije.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_12");	//Myslím, že to je velká škoda!
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_demonlanguage);
	Info_AddChoice(dia_kreol_demonlanguage,"Škoda tebe, já to přežiju.",dia_kreol_demonlanguage_ext);
};

func void dia_kreol_demonlanguage_xardas()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_13");	//Xardas řekl, že mi pomůžeš.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_14");	//Xardas? Nevím odkdy mi Xardas uděluje rozkazy!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_15");	//Proč si myslí, že bych tě měl cvičit?!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_17");	//Jdi za Xardasem a řekni mu má slova...
	KREOL_WARN = TRUE;
	KREOL_KILL = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kreol_demonlanguage_guardian()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_1A");	//Musím splnit úkol Strážců!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_18");	//Strážci!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_19");	//Nebudu pomáhat nikomu, kdo s nimi pracuje!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_20");	//Nedostaneš ani kousek těchto znalostí!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_21");	//Zmiz z mých očí... Domluvil jsem!
	KREOL_WARN = TRUE;
	KREOL_KILL = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kreol_demonlanguage_need()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_22");	//Potřebuji to.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_23");	//To není důvod.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_27");	//Zmiz a už se neukazuj!
	KREOL_WARN = TRUE;
	KREOL_KILL = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kreol_demonlanguage_knowledge()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_28");	//Chci se přesvědčit o tvé moci.
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_29");	//Xardas říkal, že jen někdo mocný mě to dokáže naučit! Mohl se mýlit...
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_32");	//Už nikdy nepochybuj o mé moci, nevíš kdo já jsem!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_34");	//Jsem jeden z vyvolených Beliara, nositel jeho síly!... 
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_35");	//To jsou jen slova - nic víc.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_36");	//COŽE?! CO SI TO DOVOLUJEŠ?!
	if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_44");	//Ale co se dá čekat od Xardasova učně... (smích)
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_45");	//Měl bys vědět, že v životě to takhle nejde.
	};
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_46");	//Budeš mě tedy učit?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_47");	//Hmmm...
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_48");	//Dobrá, vyjevím ti toto svaté tajemství, ale jen když už o mě nebudeš pochybovat... 
	KREOL_TEACHDEMONLANG = TRUE;
	Info_ClearChoices(dia_kreol_demonlanguage);
};


instance DIA_KREOL_DEMONLANGUAGETELL(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_demonlanguagetell_condition;
	information = dia_kreol_demonlanguagetell_info;
	important = FALSE;
	permanent = FALSE;
	description = "Pověz mi o jazyce démonů.";
};


func int dia_kreol_demonlanguagetell_condition()
{
	if(KREOL_TEACHDEMONLANG == TRUE)
	{
		return TRUE;
	};
};

func void dia_kreol_demonlanguagetell_info()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguageTell_01_00");	//Pověz mi o jazyce démonů.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_03");	//Skutečná hodnota tohoto jazyka je ta, že čtenáři umožní přečíst všechna stará tajemství, která se psala výhradně jím.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_04");	//Každý z těch textů je opravdový poklad, jestli jim dokážeš porozumět.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_05");	//Také je to jazyk Temného boha - všechna stvoření vytvořena jeho rukou mu rozumí.
	AI_Output(other,self,"DIA_Kreol_DemonLanguageTell_01_07");	//A co takový Lang?
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_08");	//Lang je císařství démonů. Je to část Mordragu, klášteru Temného boha.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_09");	//Mnoho démonů z Langu také slouží Beliarovi i přesto, že nad nimi nemá moc.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_10");	//Například Eligorova legie - arcidémoni z Langu!
};


instance DIA_KREOL_DEMONLANGUAGETEACH(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_demonlanguageteach_condition;
	information = dia_kreol_demonlanguageteach_info;
	important = FALSE;
	permanent = TRUE;
	description = "Nauč mě jazyk démonů. (VB: 10, Cena: 2000 zlatých)";
};


func int dia_kreol_demonlanguageteach_condition()
{
	if((KREOL_TEACHDEMONLANG == TRUE) && (KNOWDEMENTORLANGUAGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_demonlanguageteach_info()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguageTeach_01_00");	//Nauč mě jazyk démonů.

	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_4))
	{
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other,"DIA_Kreol_DemonLanguageTeach_01_01");	//Poznej sílu tohoto jazyka.
		AI_Output(self,other,"DIA_Kreol_DemonLanguageTeach_01_02");	//Toto vědění dáno Beliarem je přístupné jen elitě.
		AI_Output(self,other,"DIA_Kreol_DemonLanguageTeach_01_03");	//A teď i tobě!
		KNOWDEMENTORLANGUAGE = TRUE;
	};
};

instance DIA_KREOL_PERM(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_perm_condition;
	information = dia_kreol_perm_info;
	permanent = TRUE;
	description = "Jak jsi na tom s magickými pokusy?";
};

func int dia_kreol_perm_condition()
{
	if((KREOLGURD == 0) && (KREOL_KILL == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_perm_info()
{
	AI_Output(other,self,"DIA_Kreol_PERM_15_00");	//Jak jsi na tom s magickými pokusy?
	AI_Output(self,other,"DIA_Kreol_PERM_04_01");	//To není tvoje věc!
};

var int KreolBuyWeap;

instance DIA_KREOL_XARDASMISS(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_xardasmiss_condition;
	information = dia_kreol_xardasmiss_info;
	important = FALSE;
	permanent = FALSE;
	description = "Xardas zmizel.";
};

func int dia_kreol_xardasmiss_condition()
{
	if((hero.guild == GIL_KDM) && (XARDAS_MISS == TRUE))
	{
		return TRUE;
	};
};

func void dia_kreol_xardasmiss_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Kreol_XardasMiss_01_00");	//Xardas zmizel.
	AI_Output(self,other,"DIA_Kreol_XardasMiss_01_01");	//Cože?! Co to zkouší?
	AI_Output(other,self,"DIA_Kreol_XardasMiss_01_02");	//Myslím, že víš kam zmizel.
	AI_Output(self,other,"DIA_Kreol_XardasMiss_01_03");	//To možná ano...
	AI_Output(self,other,"DIA_Kreol_XardasMiss_01_04");	//... ale je zajímavé PROč zmizel...
	KreolBuyWeap = TRUE;

	if(KREOL_MYTEACHER == FALSE)
	{
		AI_Output(other,self,"DIA_Kreol_XardasMiss_01_05");	//Jeho zmizení mi překřížilo plány - nemám učitele magie Temnoty.
		AI_Output(self,other,"DIA_Kreol_XardasMiss_01_06");	//A co já s tím?
		AI_Output(other,self,"DIA_Kreol_XardasMiss_01_07");	//Můžu trénovat u tebe?
		AI_Output(self,other,"DIA_Kreol_XardasMiss_01_08");	//Dobrá, budu tě učit. Ale zkusíš něco a poznáš můj hněv!
		AI_Output(self,other,"DIA_Kreol_XardasMiss_01_20");	//Doufám, že nebudu litovat.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_08");	//A ještě něco, když už jsi mým učněm vem si tenhle prsten.
		B_GiveInvItems(self,other,ITRI_KREOLPLACE,1);
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_09");	//Umožní ti dostat se do této věže rychleji než si umíš predstavit.
		AI_Output(self,other,"DIA_Kreol_XardasMiss_01_21");	//Teď jdi a dělej něco užitečného!
		Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Creol mě bude učit tvorbě run, kruhům magie a pomůže mi navýšit mou zásobu many.");
		KREOL_MYTEACHER = TRUE;
	};
};

instance DIA_KREOL_TRADE(C_Info)
{
	npc = none_102_kreol;
	nr = 99;
	condition = dia_kreol_trade_condition;
	information = dia_kreol_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi své magické svitky.";
};

func int dia_kreol_trade_condition()
{
	if(KREOL_MYTEACHER == TRUE)
	{
		return TRUE;
	};
	if((CHOOSEDARK == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_kreol_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Kreol_Trade_01_01");	//Ukaž mi své magické svitky.

	if((Kapitel >= 1) && (KREOL_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ1,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ2,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ3,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ4,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ5,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ6,1);
		CreateInvItems(self,ItMi_RuneBlank,5);
		CreateInvItems(self,ItSc_SumGobSkel,5);
		CreateInvItems(self,ItSc_SumSkel,2);
		CreateInvItems(self,itsc_deathbolt,3);
		CreateInvItems(self,ItSc_ManaForLife,3);
		CreateInvItems(self,itsc_sumzombie,2);
		CreateInvItems(self,ItSc_Rage,2);
		CreateInvItems(self,ItSc_Lacerate,1);
		CreateInvItems(self,machtvolle_kunst,1);
		CreateInvItems(self,ItMi_DarkPearl,1);
		CreateInvItems(self,ItPo_Mana_02,10);
		CreateInvItems(self,ItBE_Addon_NOV_01,1);
		CreateInvItems(self,ItMi_Flask,50);
		CreateInvItems(self,ITWR_MAGICPAPER,5);
		CreateInvItems(self,ItSc_Ressurect,10);
		KREOL_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (KREOL_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(self,ItMi_RuneBlank,1);
		CreateInvItems(self,ItSc_SumDemon,2);
		CreateInvItems(self,itsc_swarm,2);
		CreateInvItems(self,ItSc_Lacerate,2);
		CreateInvItems(self,ItSc_Rage,1);
		CreateInvItems(self,itsc_energyball,2);
		CreateInvItems(self,ItMi_RuneBlank,2);
		CreateInvItems(self,ItBE_Addon_KDF_01,1);
		CreateInvItems(self,ITWR_MAGICPAPER,5);
		CreateInvItems(self,ItSc_Ressurect,1);
		KREOL_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (KREOL_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(self,ItMi_RuneBlank,3);
		CreateInvItems(self,ItSc_ArmyOfDarkness,3);
		CreateInvItems(self,itsc_deathball,1);
		CreateInvItems(self,itsc_energyball,2);
		CreateInvItems(self,ItSc_Rage,1);
		CreateInvItems(self,ItMi_RuneBlank,2);
		CreateInvItems(self,ItPo_Mana_02,10);
		CreateInvItems(self,ItBE_Addon_KDF_02,1);
		CreateInvItems(self,ITWR_MAGICPAPER,5);
		CreateInvItems(self,ItSc_Ressurect,1);
		KREOL_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (KREOL_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(self,ItMi_RuneBlank,5);
		CreateInvItems(self,ItSc_SumGobSkel,5);
		CreateInvItems(self,ItSc_SumSkel,2);
		CreateInvItems(self,ItSc_SumDemon,5);
		CreateInvItems(self,ItSc_Lacerate,1);
		CreateInvItems(self,ItSc_ArmyOfDarkness,3);
		CreateInvItems(self,itsc_deathbolt,5);
		CreateInvItems(self,ItSc_ManaForLife,3);
		CreateInvItems(self,itsc_sumzombie,2);
		CreateInvItems(self,itsc_swarm,2);
		CreateInvItems(self,itsc_energyball,2);
		CreateInvItems(self,itsc_deathball,3);
		CreateInvItems(self,ItMi_RuneBlank,2);
		CreateInvItems(self,ItSc_MassDeath,1);
		CreateInvItems(self,itsc_skull,1);
		CreateInvItems(self,ItMi_Skull,1);
		CreateInvItems(self,ItMi_DarkPearl,1);
		CreateInvItems(self,ItAt_DemonHeart,1);
		CreateInvItems(self,ItAt_WaranFiretongue,1);
		CreateInvItems(self,ItPo_Mana_02,20);
		CreateInvItems(self,ItBE_Addon_KDF_03,1);
		CreateInvItems(self,ITWR_MAGICPAPER,5);
		CreateInvItems(self,ItSc_Ressurect,1);
		KREOL_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel == 5) && (KREOL_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ1,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ2,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ3,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ4,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ5,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ6,1);
		CreateInvItems(self,ItMi_RuneBlank,2);
		CreateInvItems(self,ItSc_SumGobSkel,5);
		CreateInvItems(self,ItSc_SumSkel,2);
		CreateInvItems(self,ItSc_SumDemon,3);
		CreateInvItems(self,ItSc_ArmyOfDarkness,3);
		CreateInvItems(self,itsc_deathbolt,5);
		CreateInvItems(self,ItSc_ManaForLife,3);
		CreateInvItems(self,itsc_sumzombie,2);
		CreateInvItems(self,itsc_swarm,2);
		CreateInvItems(self,itsc_energyball,2);
		CreateInvItems(self,itsc_deathball,1);
		CreateInvItems(self,ItSc_MassDeath,1);
		CreateInvItems(self,itsc_skull,1);
		CreateInvItems(self,ItBE_Addon_KDF_03,1);
		KREOL_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((Kapitel == 6) && (KREOL_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(self,ItMi_RuneBlank,2);
		CreateInvItems(self,ItSc_SumGobSkel,5);
		CreateInvItems(self,ItSc_SumSkel,2);
		CreateInvItems(self,ItSc_SumDemon,5);
		CreateInvItems(self,ItSc_ArmyOfDarkness,3);
		CreateInvItems(self,itsc_deathbolt,5);
		CreateInvItems(self,ItSc_ManaForLife,3);
		CreateInvItems(self,itsc_sumzombie,2);
		CreateInvItems(self,itsc_swarm,2);
		CreateInvItems(self,itsc_energyball,2);
		CreateInvItems(self,itsc_deathball,1);
		CreateInvItems(self,ItSc_MassDeath,1);
		CreateInvItems(self,itsc_skull,1);
		KREOL_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_KREOL_RUNEN(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_runen_condition;
	information = dia_kreol_runen_info;
	permanent = TRUE;
	description = "Nauč mě vytvářet runy.";
};


func int dia_kreol_runen_condition()
{
	if((KREOL_MYTEACHER == TRUE) || ((CHOOSEDARK == TRUE) && (Kapitel >= 5)))
	{
		return TRUE;
	};
};

func void dia_kreol_runen_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Nauč mě vytvářet runy.
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if((Npc_GetTalentSkill(other,NPC_TALENT_DEMONOLOG) == 1) && (PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE))
	{
		Info_AddChoice(dia_kreol_runen,"Démonologické runy",dia_kreol_runen_dem);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_kreol_runen,"6. kruh magie",dia_kreol_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_kreol_runen,"5. kruh magie",dia_kreol_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_kreol_runen,"4. kruh magie",dia_kreol_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_kreol_runen,"3. kruh magie",dia_kreol_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_kreol_runen,"2. kruh magie",dia_kreol_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_kreol_runen,"1. kruh magie",dia_kreol_runen_1);
	};
};

func void dia_kreol_runen_back()
{
	Info_ClearChoices(dia_kreol_runen);
};

func void dia_kreol_runen_dem()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),dia_kreol_runen_circle_4_spl_summondemon);
	};
};

func void dia_kreol_runen_1()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathbolt] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Deathbolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathbolt)),dia_kreol_runen_circle_1_spl_deathbolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),dia_kreol_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Rage] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Rage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Rage)),dia_kreol_runen_circle_1_spl_Rage);
	};
};

func void dia_kreol_runen_2()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ManaForLife] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_ManaForLife,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ManaForLife)),dia_kreol_runen_circle_2_spl_suckenergy);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonZombie] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonZombie,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonZombie)),dia_kreol_runen_circle_2_spl_summonzombie);
	};
	if(PLAYER_TALENT_RUNES[SPL_Lacerate] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Lacerate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Lacerate)),dia_kreol_runen_circle_2_spl_Lacerate);
	};
};

func void dia_kreol_runen_3()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Swarm] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Swarm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Swarm)),dia_kreol_runen_circle_3_spl_swarm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),dia_kreol_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Energyball] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_BeliarsRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Energyball)),dia_kreol_runen_circle_3_spl_energyball);
	};
};

func void dia_kreol_runen_4()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathball] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Deathball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathball)),dia_kreol_runen_circle_4_spl_deathball);
	};
};

func void dia_kreol_runen_5()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),dia_kreol_runen_circle_5_spl_armyofdarkness);
	};
};

func void dia_kreol_runen_6()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),dia_kreol_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Skull] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Skull,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Skull)),dia_kreol_runen_circle_6_spl_skull);
	};
};

func void dia_kreol_runen_circle_1_spl_Rage()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Rage);
};

func void dia_kreol_runen_circle_2_spl_Lacerate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Lacerate);
};

func void dia_kreol_runen_circle_1_spl_deathbolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathbolt);
};

func void dia_kreol_runen_circle_1_spl_summongoblinskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void dia_kreol_runen_circle_2_spl_suckenergy()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ManaForLife);
};

func void dia_kreol_runen_circle_2_spl_summonzombie()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonZombie);
};

func void dia_kreol_runen_circle_3_spl_swarm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Swarm);
};

func void dia_kreol_runen_circle_3_spl_summonskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void dia_kreol_runen_circle_3_spl_energyball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Energyball);
};

func void dia_kreol_runen_circle_4_spl_summondemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void dia_kreol_runen_circle_4_spl_deathball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathball);
};

func void dia_kreol_runen_circle_5_spl_armyofdarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void dia_kreol_runen_circle_6_spl_massdeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void dia_kreol_runen_circle_6_spl_skull()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Skull);
};


instance DIA_KREOL_TEACH_MANA(C_Info)
{
	npc = none_102_kreol;
	nr = 10;
	condition = dia_kreol_teach_mana_condition;
	information = dia_kreol_teach_mana_info;
	permanent = TRUE;
	description = "Chci zvýšit svou magickou energii.";
};

func int dia_kreol_teach_mana_condition()
{
	if((KREOL_MYTEACHER == TRUE) && ((other.attribute[ATR_MANA_MAX] < T_MEGA) || (VATRAS_TEACHREGENMANA == FALSE)))
	{
		return TRUE;
	};
};

func void dia_kreol_teach_mana_info()
{
	AI_Output(other,self,"DIA_Kreol_TEACH_MANA_15_00");	//Chci zvýšit svou magickou energii.
	AI_Output(self,other,"DIA_Kreol_TEACH_MANA_15_01");	//Pojďme na to.
	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDM) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Kreol_TEACH_MANA,"Regenerace many (VB: 10, cena: 15000 zlatých)",DIA_Kreol_TEACH_MANA_Regen);
	};
};

func void dia_kreol_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_Kreol_TEACH_MANA_05_00");	//S tím už ti nepomohu, jsme na hranici.
		AI_Output(self,other,"DIA_Kreol_TEACH_MANA_05_01");	//Překročil jsi mé možnosti!
	};

	Info_ClearChoices(dia_kreol_teach_mana);
};

func void DIA_Kreol_TEACH_MANA_Regen()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Nauč mě, jak regenerovat manu.

	kosten = 10;
	money = 15000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Regenerace many");
		VATRAS_TEACHREGENMANA = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);
};

func void dia_kreol_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDM) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Kreol_TEACH_MANA,"Regenerace many (VB: 10, cena: 15000 zlatých)",DIA_Kreol_TEACH_MANA_Regen);
	};
};

func void dia_kreol_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDM) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Kreol_TEACH_MANA,"Regenerace many (VB: 10, cena: 15000 zlatých)",DIA_Kreol_TEACH_MANA_Regen);
	};
};


var int dia_kreol_circle_noperm;

instance DIA_KREOL_CIRCLE(C_Info)
{
	npc = none_102_kreol;
	nr = 99;
	condition = dia_kreol_circle_condition;
	information = dia_kreol_circle_info;
	permanent = TRUE;
	description = "Chci se učit kruhy.";
};


func int dia_kreol_circle_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 6) && (KREOL_MYTEACHER == TRUE) && (DIA_KREOL_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_circle_info()
{
	AI_Output(other,self,"DIA_Kreol_CIRCLE_15_00");	//Chci se učit kruhy.
	Info_ClearChoices(DIA_Kreol_CIRCLE);
	Info_AddChoice(DIA_Kreol_CIRCLE,Dialog_Back,DIA_Kreol_CIRCLE_Back);

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 1) && (CanLearnMagicCircleNext_ABCZ(1) == TRUE))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"1. kruh magie (VB: 20)",DIA_Kreol_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (CanLearnMagicCircleNext_ABCZ(2) == TRUE))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"2. kruh magie (VB: 30)",DIA_Kreol_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (CanLearnMagicCircleNext_ABCZ(3) == TRUE))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"3. kruh magie (VB: 40)",DIA_Kreol_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (CanLearnMagicCircleNext_ABCZ(4) == TRUE))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"4. kruh magie (VB: 60)",DIA_Kreol_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (CanLearnMagicCircleNext_ABCZ(5) == TRUE))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"5. kruh magie (VB: 80)",DIA_Kreol_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (CanLearnMagicCircleNext_ABCZ(6) == TRUE))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"6. kruh magie (VB: 100)",DIA_Kreol_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_31");	//Ještě nepřišel čas, vrať se později.
	};
};

func void DIA_Kreol_CIRCLE_Back()
{
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0A");	//Jsi připraven vstoupit do dalšího kruhu magie?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_01");	//Jsem.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_01");	//Vstupem do prvního kruhu se naučíš používat runy.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_02");	//Každá nese magii jednoho kouzla.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_03");	//Užitím své magické síly ho osvobodíš z runy.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_04");	//Ale narozdíl od svitku se runa nevytratí.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_05");	//Runu můžeš používat jak dlouho chceš.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_06");	//Záleží jen na tvé magické energii.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_07");	//S každým novým kruhem dokážeš porozumět složitějším kouzlům.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_08");	//Užij jejich sílu, abys je poznal.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0B");	//Jsi připraven vstoupit do dalšího kruhu magie?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_02");	//Jsem.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_09");	//Přišel čas rozšířit tvé znalosti, po té, co jsi porozuměl runám.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_10");	//Ve druhém kruhu se naučíš základy mocné bojové magie.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_11");	//Ale abys poznal pravé tajemství magie, stále se musíš mnoho učit.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_12");	//Už víš, že runy můžeš užívat neomezeně, pokud máš magickou energii.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_13");	//Ale užívej ji moudře, nebo tě nepřipraveného stihne smrt.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_14");	//Pravý mág ji užívá jen když je to nezbytné.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_15");	//Poslouchej tyto rady a porozumíš tajemství run.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0C");	//Jsi připraven vstoupit do dalšího kruhu magie?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_03");	//Jsem.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_16");	//Třetí kruh je hlavní pozice v životě každého mága.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_17");	//Už jsi zběhlý v cestě magie a run.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_18");	//Tyto znalosti jsou ale jen základem toho, co tě naučí další kruh.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_19");	//Můžeš je používat nebo ne, volba je na tobě.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_20");	//Udělej volbu a prokaž tak sílu své mysli.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_21");	//Najdi cestu, na kterou tě dovede síla tvého rozhodnutí.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0D");	//Jsi připraven vstoupit do dalšího kruhu magie?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_04");	//Jsem.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_22");	//Už jsi prošel třemi kruhy.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_23");	//Základ runy je kámen - kámen, který je obsažen v úlomcích magické rudy.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_24");	//Je to ta, která se těží v dolech. V chrámech jsou pak kameny očarovávány, aby pojmuly zaklínadlo.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_25");	//Nyní znáš znalosti, které byly chráněny v takových chrámech.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_27");	//Poznej magii, která ti otevře tajemství moci.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_28");	//A ještě něco - vstupem do čtvrtého kruhu jsi dokázal, že jsi jeden z mocnějších temných mágů.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_29");	//Nyní jsi jeden z vyvolených Temného boha!
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_30");	//Zde, vem si toto roucho na důkaz tvé hodnosti.
		CreateInvItems(other,itar_dmt_h,1);
		AI_EquipArmor(other,itar_dmt_h);
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0E");	//Jsi připraven vstoupit do dalšího kruhu magie?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_05");	//Jsem.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_32");	//Jestli bys chtěl užívat sílu bez znalosti jejího způsobu, dopadneš špatně.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_33");	//Pamatuj na má slova, brzy je pochopíš. Vlastně proto nemůžeš používat runy vyššího kruhu, než znáš - jsou kvůli tomu chráněny.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_34");	//Ale všude v přírodě můžeš najít nechráněné zdroje této síly.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_35");	//Duch přírody a elementy jsou jen základy této neviditelné síly.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_36");	//Skutečná moc leží ještě dál.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_37");	//Ale mág, který dokáže těmto zdrojům porozumět, je může využívat.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_38");	//Tímto dokážeš pochopit sílu moci, kterou vkládáš do kamene.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_39");	//Pamatuj na to.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_40");	//Odhalím ti šestý kruh magie.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_41");	//Jen ti největší mágové dokončí šestý kruh. Pak obvykle objeví smysl svého života.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_42");	//Temnotu!
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_43");	//Šestý kruh ti umožní užívat jakoukoli runu.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_44");	//Ale nezapomeň - kouzlo potřebuje svůj zdroj.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_45");	//Buď soudce nevěřících, to ti rozkazuje Temný bůh!
		DIA_KREOL_CIRCLE_NOPERM = TRUE;
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

instance DIA_KREOL_FINDDARKSOUL(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_finddarksoul_condition;
	information = dia_kreol_finddarksoul_info;
	permanent = FALSE;
	description = "Říkají ti něco slova Mora Ulartu?";
};


func int dia_kreol_finddarksoul_condition()
{
	if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_finddarksoul_info()
{
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_00");	//Říkají ti něco slova Mora Ulartu?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_01");	//Hmm... (zaskočen) Odkud je znáš?!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_03");	//Hmm!... (udiveně) Nevím toho moc, ale co vím ti zkusím vysvětlit...
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_05");	//Co já vím, Mora Ulartu je velmi staré a mocné kouzlo. Někdy je nazýváno Bludiště Duší.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_06");	//Bylo stvořeno v pradávných časech spolu s naším světem.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_07");	//Není jisté jak se dostalo do světa, ale je jisté, že ho sem dostal Beliar!
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_09");	//Pověz, jak bych mohl získat Mora Ulartu?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_10");	//COŽE?!... (s překvapením) Pro co by ti byla?!
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_14");	//Když nebudu zacházet do detailů, potřebuji to kouzlo na uvěznění duše jednoho démona.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_22");	//Největší problém je, že Mora Ulartu není jen tak obyčejné kouzlo.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_23");	//Je to dar. Dar Beliara těm, kdo si podle jeho mínění zaslouží získat takové vědění. Jen Temný bůh ti ji může udělit!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_24");	//A nemyslím si, že usoudí, že ty si ji zasloužíš!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_25");	//Jsi mág Ohně, přívrženec Innose!
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_26");	//Bojím se, že nemáš šanci!...
		CHANCEGETDARKSOUL = 1;
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_27");	//Jsi paladin!
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_28");	//Bojím se, že tvá šance je velmi malá!... 
		CHANCEGETDARKSOUL = 5;
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_29");	//Jsi mág Vody, přívrženec Adana!
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_30");	//Mezi ním a Beliarem není nepřátelství, ale i tak to nebude lehké!
		CHANCEGETDARKSOUL = 25;
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_31");	//Na druhou stranu... To že jsi temný mág je velké plus.
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_32");	//Ale myslím, že bychom na to neměli moc spoléhat!
		CHANCEGETDARKSOUL = 50;
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_33");	//I když na druhou stranu nejsi vázán k ostatním bohům!
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_34");	//To může byt v naší věci výhoda... 
		CHANCEGETDARKSOUL = 75;
	};
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_35");	//V každém případě to bude něco stát... Tedy, jestli se o to ještě zajímáš.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_39");	//Něco výměnou za jeho dar...
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_42");	//Hmm... Myslím, že je tu hodně zajímavých věcí, ale i jedna ještě zajímavější věc.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_46");	//Samozřejmě... Jeden mocný artefakt - Amulet Triramaru.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_47");	//Nevím přesně, kdo byl jeho původní vlastník, ale vše nasvědčuje tomu, že Beliar!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_48");	//Jak jinak by šlo vysvětlit, že byl nalezen v jednom z chrámů věnovaných Temnému bohu.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_51");	//Není tomu tak dlouho, vlastně to bylo opravdu před chvílí. Asi půl století zpátky paladinové Innose ten chrám zničili.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_52");	//Nebylo sice v jejich silách zničit ten amulet, ale za to ho spolehlivě skryli.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_53");	//A síla Innose je ochránila před hněvem Beliara, který usiloval o navrácení.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_54");	//A na co mu byl?!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_55");	//Temný bůh do něj uložil přesně jednu čtvrtinu moci, kterou disponoval, když artefakt nechal uložit do chrámu.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_56");	//Pro ty, kdo sloužili Beliarovi to byl zdroj nesmírné síly...
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_57");	//... A pro Temného boha součást jeho vlastní existence!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_60");	//Nemysli si, že to půjde jen tak - Beliar je dovedný a prohnaný!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_61");	//Samozřejmě, že bude rád, když se k němu artefakt vrátí, ale neznamená to, že se od něj dočkáš odměny.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_63");	//Kromě toho ti pak bude hrozit nebezpečí ze strany paladinů.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_64");	//Jak se rozhodneš je na tobě.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_65");	//A kde paladinové schovávají ten artefakt?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_66");	//Věřím, že někde tady na Khorinise.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_68");	//Nejpravděpodobněji bude to místo schované někde mimo očí zvědavých a dosah zručných.
	if(Npc_KnowsInfo(other,dia_pal_199_ritter_firstwarn) || Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_69");	//Nemůže být uschován v královské pevnosti Azgan?
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_70");	//O tom jsem nikdy neslyšel!
	};
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_72");	//Zkus to, ale nevím, jestli tam bude.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_74");	//Jasně. A co až najdu cestu k amuletu?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_75");	//Velmi jednoduché - pomodli se k Beliarovi a polož amulet na jeho oltář.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_76");	//Pak se ho zeptej, zda ti věnuje Mora Ulartu.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_77");	//Možná pak získáš to co hledáš.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_78");	//No, jdu na to.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_79");	//A ještě něco...
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_80");	//Jestli se dozvíš o amuletu, informuj mě!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_83");	//To je vše, můžeš jít.
	KREOLLINE = TRUE;
	TELLABOUTDS = TRUE;
	TELLMORAKREOL = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Creol mi řekl o kouzlu Mora Ulartu - Bludišti Duší. Kouzlo můžu dostat jen od Beliara a mé šance nejsou moc velké. Nicméně Creol mi poradil jak na to. Pro tento účel musím získat amulet Triramar - mocný artefakt, ve kterém se Beliar rozhodl uschovat čtvrtinu své někdejší síly a který ukořistili paladinové v průběhu drancování jednoho z chrámů Temného boha. Creol přesně neví, kde by ho paladinové mohli skrývat.");
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Jestli se mi amulet podaří získat, měl bych se pomodlit u Beliarovi svatyně a amulet mu darovat. Přitom bych ho měl požádat, aby mi na oplátku udělil Mora Ulartu. Creol mě varoval, že mé šance Ulartu získat nebudou velké.");
};


instance DIA_KREOL_FINDETLU(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_findetlu_condition;
	information = dia_kreol_findetlu_info;
	permanent = FALSE;
	description = "Zjistil jsem, kde paladinové skryli Triramar.";
};


func int dia_kreol_findetlu_condition()
{
	if((ETLUBEGINS == TRUE) && Npc_KnowsInfo(other,dia_kreol_finddarksoul) && (BEONETLU == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_findetlu_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_00");	//Zjistil jsem, kde paladinové skryli Triramar.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_01");	//A kde?
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_02");	//Na ostrově Etlu.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_03");	//Etlu?! Hmm... (zaskočen) Mmm, to by souhlasilo.
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_04");	//A taky jsem zjistil jak se tam dostat...
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_05");	//Na ostrově je portál na Etlu.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_06");	//Portál?! Zajímavé, kde se tam vzal?
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_07");	//Paladinové ho postavili!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_09");	//Pak potřebuješ jen najít ten portál.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_11");	//Ale ještě něco... Měl bych tě varovat.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_13");	//Nemyslím, že paladiny na ostrově potěší tvá návštěva.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_14");	//Je to zakázaná oblast...
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_15");	//... A každý, kdo se odváží porušit toto pravidlo a rozhodne se vstoupit bez pozvání, skončí špatně.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_17");	//Myslím, že víš jak!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_18");	//I když jsi paladin!
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_19");	//Na ostrově ti to nepomůže!
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_20");	//I když jsi mág Ohně!
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_21");	//Na ostrově ti to nepomůže!
	}
	else if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_22");	//I když jsi mág Vody!
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_23");	//Na ostrově ti to nepomůže!
	};
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_24");	//Očekávej těžký boj!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_25");	//Paladinové položí životy na ochranu toho artefaktu!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_26");	//O tom nepochybuj.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_27");	//A pamatuj, že si nesmíš nasadit ten amulet!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_28");	//Zabil by tě!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_29");	//Jednoduše nedokážeš odolat jeho síle!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_31");	//To je vše, jdi.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Creol mi sdělil, že nemám na ostrově čekat přivítání. Pravděpodobně se budu muset probít. Také mě varoval, abych nezkoušel amulet nosit - neodolal bych jeho síle a zabil by mě.");
};


instance DIA_KREOL_ASKABOUTPEACEWAY(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_askaboutpeaceway_condition;
	information = dia_kreol_askaboutpeaceway_info;
	permanent = FALSE;
	description = "Ještě jedna otázka.";
};


func int dia_kreol_askaboutpeaceway_condition()
{
	if(Npc_KnowsInfo(other,dia_kreol_findetlu) && (MEHASTRIRAVAR == FALSE) && (ASKABOUTPEACEWAY == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_kreol_askaboutpeaceway_info()
{
	AI_Output(other,self,"DIA_Kreol_AskAboutPeaceWay_01_00");	//Ještě jedna otázka.
	AI_Output(other,self,"DIA_Kreol_AskAboutPeaceWay_01_03");	//Opravdu tu není cesta jak získat amulet bez boje?
	AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_04");	//Já ji neznám a paladinové ti ho jen tak nedají.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_05");	//Na tvém místě bych se zeptal pána amuletu - Beliara!
		if(other.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_06");	//Ale nevím, jestli pomůže paladinovi.
		}
		else
		{
			AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_07");	//Ale nevím, jestli pomůže mágovi Ohně.
		};
		AI_Output(other,self,"DIA_Kreol_AskAboutPeaceWay_01_08");	//Dobrá, něco vymyslím.
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_09");	//Na tvém místě bych se zeptal pána amuletu.
		AI_Output(other,self,"DIA_Kreol_AskAboutPeaceWay_01_10");	//Máš namysli Beliara?!
		AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_11");	//Ano, pomodli se k němu a budeš mít nějakou šanci si cestu ulehčit.
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Zeptal jsem se Creola, jestli není jednodušší cesta na získání amuletu. Řekl mi, že bych se měl zeptat pána amuletu, Beliara.");
	};
	ASKABOUTPEACEWAY = TRUE;
};


instance DIA_KREOL_FINDAMULET(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_findamulet_condition;
	information = dia_kreol_findamulet_info;
	permanent = FALSE;
	description = "Mám amulet Triramar!";
};


func int dia_kreol_findamulet_condition()
{
	if((Npc_HasItems(other,itmi_triramar) >= 1) && Npc_KnowsInfo(other,dia_kreol_finddarksoul))
	{
		return TRUE;
	};
};

func void dia_kreol_findamulet_info()
{
	B_GivePlayerXP(250);

	if(Npc_HasItems(other,ITKE_SI_SIGN) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_SI_SIGN,1);
	};
	if(Npc_HasItems(other,ITKE_HAGEN_SECRETKEY) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_HAGEN_SECRETKEY,1);
	};

	AI_Output(other,self,"DIA_Kreol_FindAmulet_01_00");	//Mám amulet Triramar!
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_01");	//Opravdu jsi ho získal?
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_03");	//Tím jsi mě trochu překvapil.
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_07");	//Možná jsi udělal chybu, ale to teď není důležité...
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_08");	//Nyní potřebuješ jen provést rituál u Beliarovi svatyně.
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_09");	//Jdi k nejbližší Beliarově svatyni a polož amulet na oltář! Pak se zeptej, zda ti na oplátku nepropůjčí Bludiště Duší!
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_10");	//Jedna je v mé věži, neztrácej čas!
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_11");	//A pamatuj co jsem ti řekl - Beliar je mocný a prohnaný!
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_12");	//Nemysli si, že předáním amuletu automaticky získáš nárok na odměnu!
	AI_Output(other,self,"DIA_Kreol_FindAmulet_01_13");	//Udělám vše co budu moci!
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ukázal jsem Creolovi Triramar - byl velmi překvapen! Poslal mě ke svatyni Beliara obětovat Triramar a na oplátku získat Mora Ulartu.");
	AI_StopProcessInfos(self);
};


instance DIA_KREOL_GETSUPERBELIARWEAPON(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_getsuperbeliarweapon_condition;
	information = dia_kreol_getsuperbeliarweapon_info;
	permanent = FALSE;
	description = "Temný bůh mi věnoval Mora Ulartu!";
};


func int dia_kreol_getsuperbeliarweapon_condition()
{
	if((Npc_HasItems(hero,itru_moraulartu) >= 1) && Npc_KnowsInfo(other,dia_kreol_finddarksoul))
	{
		return TRUE;
	};
};

func void dia_kreol_getsuperbeliarweapon_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_00");	//Temný bůh mi věnoval Mora Ulartu!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_01");	//Takže jsi to dokázal?!... 
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_02");	//Překvapuješ mě čím dál víc!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_07");	//Nyní je ve tvých rukou mocný artefakt, který ti uděluje moc Lovce duší.
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_08");	//Lovce duší?
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_09");	//Ano, tak se nazývají ti, kdo obdrží tento dar!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_10");	//A moc jich nebylo...
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_11");	//Kdo přesně?
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_12");	//Většinou démoni, ale jen ti nejmocnější!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_13");	//Pro lidi je tato znalost skoro nedosažitelná... Ale jsou výjimky, že... 
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_14");	//Ale k čemu by mi duše byly?!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_15");	//Je vidět, že si neuvědomuješ svůj dar...
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_16");	//Duše může být použita jako zdroj moci.
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_17");	//Každá duše má jiné vlastnosti, ale jaké přesně nevíme.
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_19");	//Vlastně jsou klíčem k neomezené moci!
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_20");	//Nemůžeš mi to trochu vysvětlit?
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_21");	//Není to složité - s Mora Ulartu budeš moci chytat duše všech stvoření, které zabiješ...
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_22");	//Nicméně jejich sílu užít nemůžeš...
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_24");	//Lidé nejsou jako démoni - ti z duší dokážou vysát magickou a životní energii.
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_25");	//A co s nimi teda budu dělat?!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_26");	//Dobrá otázka! Můžeš je obětovat Beliarovi. Myslím.
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_27");	//Ten by ti mohl nabídnout něco zajímavého výměnou.
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_29");	//Jasně.
	KNOWSHOWDEALSOULS = TRUE;
	Log_CreateTopic(TOPIC_SUPERBELIARWEAPON_UPG,LOG_NOTE);
	B_LogEntry(TOPIC_SUPERBELIARWEAPON_UPG,"S Mora Ulartu mi byla udělena moc Lovce duší. Můžu díky ní zajmout duši každého živého tvora, kterého usmrtím. Pak je můžu obětovat Beliarovi a dostat něco na oplátku.");
};


instance DIA_KREOL_GETSUPERSOUL(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_getsupersoul_condition;
	information = dia_kreol_getsupersoul_info;
	permanent = FALSE;
	description = "Polapil jsem duši arcidémona Senyaka!";
};


func int dia_kreol_getsupersoul_condition()
{
	if((Npc_HasItems(hero,itmi_stonesoul_senyak) >= 1) && (TELLCANSUPERBELIARWEAPON == FALSE) && (KNOWSHOWDEALSOULS == TRUE))
	{
		return TRUE;
	};
};

func void dia_kreol_getsupersoul_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Kreol_GetSuperSoul_01_00");	//Polapil jsem duši arcidémona Senyaka!
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_01");	//Hmmm... Ty opravdu víš jak na věc, že?
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_02");	//V tvých rukách je hotový poklad, ale vidím, že nevíš jak ho využít.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_05");	//Duše arcidémona není stejná jako ostatní - je prostě obrovská.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_06");	//Mohl bys z ní udělat mocný artefakt.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_07");	//Nebo můžeš zvednout sílu již existujícího artefaktu.
	AI_Output(other,self,"DIA_Kreol_GetSuperSoul_01_08");	//A co by to mělo být?
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_09");	//Hmm... Měl by být už teď mocný, aby ho duše nerozpoltila.
	AI_Output(other,self,"DIA_Kreol_GetSuperSoul_01_10");	//A co Beliarův dráp?
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_11");	//DRÁP! Hmm... (zaskočen) No, ten by byl pro naše účely výborný.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_12");	//Jeho magie je stejně jako démonova magií Beliara!
	AI_Output(other,self,"DIA_Kreol_GetSuperSoul_01_14");	//A jak bych měl dostat duši démona do toho artefaktu?
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_15");	//Není nic jednoduššího! Stačí jakákoli svatyně Beliara.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_16");	//Její aura umožní provést rituál!
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_17");	//Pamatuj ale, že musíš být oblíbencem Beliara - jen tak se ti rituál povede.
	TELLCANSUPERBELIARWEAPON = TRUE;
	B_LogEntry(TOPIC_SUPERBELIARWEAPON_UPG,"K využití duše arcidémona bude třeba nějaký artefakt, který bude schopen pojmout sílu duše. Pro tyto účeli by byl perfektní Beliarův dráp! Pro uvěznění duše v Drápu stačí provést rituál u Beliarovi svatyně! Ale musím být Beliarův oblíbenec, jinak se rituál nezdaří!");
};


instance DIA_KREOL_NDM_TEACHDEMONOLOG(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_ndm_teachdemonolog_condition;
	information = dia_kreol_ndm_teachdemonolog_info;
	permanent = TRUE;
	description = "Nauč mě démonologii.";
};


func int dia_kreol_ndm_teachdemonolog_condition()
{
	if((hero.guild == GIL_KDM) && (KREOL_MYTEACHER == TRUE) && (XARDASTELLABOUTDEMONOLOG == TRUE) && ((XARDASTEACHCASTDEMON_SIMPLE == FALSE) || (XARDASTEACHCASTDEMON_LORD == FALSE)))
	{
		return TRUE;
	};
};

func void dia_kreol_ndm_teachdemonolog_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_TeachDemonolog_01_00");	//Nauč mě démonologii.
	AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_01_00");	//Jsem připraven tě naučit tomuto umění.
	Info_ClearChoices(dia_kreol_ndm_teachdemonolog);
	Info_AddChoice(dia_kreol_ndm_teachdemonolog,Dialog_Back,dia_kreol_ndm_teachdemonolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Démonologie",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Vyšší démonologie",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_high);
	};
};

func void dia_kreol_ndm_teachdemonolog_back()
{
	if(XARDASTEACHCASTDEMON_LORD == TRUE)
	{
		AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_BACK_01_00");	//Nyní je ve tvé moci vyvolávat ty nejvyšší démony.
		AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_BACK_01_01");	//Buď opatrný! Pamatuj, že podřídit si tyto bytosti je neuvěřitelně obtížné.
		AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_BACK_01_02");	//Jediná chyba znamená rychlou smrt.
	};
	Info_ClearChoices(dia_kreol_ndm_teachdemonolog);
};

func void dia_kreol_ndm_teachdemonolog_simple()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		XARDASTEACHCASTDEMON_SIMPLE = TRUE;
	};
	Info_ClearChoices(dia_kreol_ndm_teachdemonolog);
	Info_AddChoice(dia_kreol_ndm_teachdemonolog,Dialog_Back,dia_kreol_ndm_teachdemonolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Démonologie",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Vyšší démonologie",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_high);
	};
};

func void dia_kreol_ndm_teachdemonolog_high()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_High_01_00");	//Poznej sílu pravé moci.
		XARDASTEACHCASTDEMON_LORD = TRUE;
	};
	Info_ClearChoices(dia_kreol_ndm_teachdemonolog);
	Info_AddChoice(dia_kreol_ndm_teachdemonolog,Dialog_Back,dia_kreol_ndm_teachdemonolog_back);
};


instance DIA_KREOL_TEACHSACTANOME(C_Info)
{
	npc = none_102_kreol;
	nr = 99;
	condition = dia_kreol_teachsactanome_condition;
	information = dia_kreol_teachsactanome_info;
	permanent = TRUE;
	description = "Nauč mě umění Sakta Nomen! (VB: 50, cena: 50000 zlatých)";
};


func int dia_kreol_teachsactanome_condition()
{
	if((hero.guild == GIL_KDM) && (XARDAS_TEACHSACTANOME == TRUE) && (XARDAS_KNOWSSACTANOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_teachsactanome_info()
{
	AI_Output(other,self,"DIA_Kreol_TeachSactaNome_01_00");	//Nauč mě umění Sakta Nomen!
	AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_01");	//Jseš si jistý?
	Info_ClearChoices(dia_kreol_teachsactanome);
	Info_AddChoice(dia_kreol_teachsactanome,"No, vlastně ne.",dia_kreol_teachsactanome_no);
	Info_AddChoice(dia_kreol_teachsactanome,"Ano.",dia_kreol_teachsactanome_yes);
};

func void dia_kreol_teachsactanome_no()
{
	AI_Output(other,self,"DIA_Kreol_TeachSactaNome_No_01_00");	//No, vlastně ne.
	AI_Output(self,other,"DIA_Kreol_TeachSactaNome_No_01_01");	//Jak chceš.
	Info_ClearChoices(dia_kreol_teachsactanome);
};

func void dia_kreol_teachsactanome_yes()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50000) && (other.lp >= 50))
	{
		AI_Print(PRINT_SACTANOME);
		Snd_Play("MFX_FEAR_CAST");
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_Yes_01_01");	//Pak poznej sílu krve...
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_Yes_01_02");	//SAKTA SHADAR NOMEN TAR MADAR SATAG!
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_Yes_01_03");	//Tyto znalosti spojí tvou duši s Temnotou!
		other.lp = other.lp - 50;
		RankPoints = RankPoints + 50;
		Npc_RemoveInvItems(other,ItMi_Gold,50000);
		XARDAS_KNOWSSACTANOME = TRUE;
		B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Naučil jsem se umění Sakta Nomen.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};

		Info_ClearChoices(dia_kreol_teachsactanome);
	}
	else if(other.lp < 50)
	{
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_04");	//Nejsi připraven.
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_05");	//Vrať se až budeš zkušenější.
		Info_ClearChoices(dia_kreol_teachsactanome);
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_07");	//Nemáš dost zlata!
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_08");	//Promluvíme si až ho budeš mít.
		Info_ClearChoices(dia_kreol_teachsactanome);
	};
};

instance DIA_KREOL_Kill_Pals(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_KREOL_Kill_Pals_condition;
	information = DIA_KREOL_Kill_Pals_info;
	permanent = FALSE;
	description = "Mohl bych udělat něco pro Temného boha?";
};

func int DIA_KREOL_Kill_Pals_condition()
{
	if((hero.guild == GIL_KDM) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_KREOL_Kill_Pals_info()
{
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_01_01");	//Mohl bych udělat něco pro Temného boha?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_02");	//(arogantne) Zeptej se ho sám. Ale mně by se pomoc hodila!
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_01_03");	//A s čím?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_04");	//Jde o to, že jsem sa rozhodl skusit jeden temný rituál.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_05");	//Ale nanešťestí jsem zjistil, že na to nemám dost materiálu.
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_01_06");	//Jakého materiálu?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_07");	//Nic speciálního. Jenom čerstvé lidské maso!
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_01_08");	//A tomu ríkáš nic speciálního?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_09");	//Pro mne jsou lidé jenom materiál pro mé experimenty a výzkum. 
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_10");	//Jejich bezcenné životy mě nezajímají!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_11");	//Tak můžu s tebou počítat nebo ne?
	Info_ClearChoices(DIA_KREOL_Kill_Pals);
	Info_AddChoice(DIA_KREOL_Kill_Pals,"Ne, to není nic pro mě.",DIA_KREOL_Kill_Pals_no);
	Info_AddChoice(DIA_KREOL_Kill_Pals,"Jasně.",DIA_KREOL_Kill_Pals_yes);
};

func void DIA_KREOL_Kill_Pals_no()
{
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_no_01_01");	//Ne, to není nic pro mě.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_no_01_02");	//Čekal jsem, že jseš slaboch. Nechápu jak ses mohl stát temným mágem!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_no_01_03");	//Tvé místo je po boku těch zbabelců, co uctívají toho svého falešného boha.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_no_01_04");	//Kliď se mi z očí!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);

};

func void DIA_KREOL_Kill_Pals_yes()
{
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_yes_01_01");	//Jasně.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_02");	//To jsem od tebe nečekal. Tvá víra je silnější než jsem si myslel.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_03");	//Tak tedy poslouchej! Tady poblíž se nachází dva malé tábory.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_04");	//Jeden je nad útesem při moři a ten druhý je pod ním.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_05");	//Zkoušel jsem už na ně posílat své služebníky, ale bezúspěšně!
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_yes_01_06");	//Jak je to možné?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_07");	//Tábor nahoře je chráněn nějakou silnou magii.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_08");	//Její povaha mi ještě není úplně známá, ale prozatím nejsem schopen s tím nic udělat.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_09");	//Ale ten druhý tábor vypadá být méně chráněn.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_10");	//Problém je, že mají mezi sebou paladiny!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_11");	//A ti válečníci Innose se lehko postarají a mé nemrtvé.
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_yes_01_12");	//A co chceš ode mne?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_13");	//Chci abys využil své schopnosti temného mága a zničil ty nevěřící hajzly!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_14");	//A když paladinové padnou o ostatní se postarají mí služebníci.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_15");	//Klidně je všechny zabij i sám, mně to je jedno.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_16");	//Hlavně, že díky tomu budu moci pokračovat ve svém rituálu.
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_yes_01_17");	//Dobře, postarám se o ty paladiny.
	MIS_KILL_PALS = LOG_Running;
	Log_CreateTopic(TOPIC_KILL_PALS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILL_PALS,LOG_Running);
	B_LogEntry(TOPIC_KILL_PALS,"Creol po mně chce, abych pobil paladiny v nedalekém táboře.");
	AI_StopProcessInfos(self);
};

instance DIA_KREOL_Kill_Pals_Done(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_KREOL_Kill_Pals_Done_condition;
	information = DIA_KREOL_Kill_Pals_Done_info;
	permanent = FALSE;
	description = "Problém paladinské otázky je vyřešen.";
};

func int DIA_KREOL_Kill_Pals_Done_condition()
{
	if((hero.guild == GIL_KDM) && (KAPITELORCATC == FALSE) && (MIS_KILL_PALS == LOG_Running) && (ALBERTISDEAD == TRUE))
	{
		return TRUE;
	};
};


func void DIA_KREOL_Kill_Pals_Done_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_Done_01_01");	//Problém paladinské otázky je vyřešen.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_Done_01_02");	//Výborně! Okamžitě pošlu své služebníky, aby je pozbírali.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_Done_01_03");	//A ty dostaneš svou odměnu.
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_Done_01_04");	//Doufám, že to bude stát za to.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_Done_01_05");	//Neboj se. Tady, vem si tyto lektvary.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_Done_01_06");	//Sem si jistý, že víš co s nima.
	B_GiveInvItems(self,other,ITPO_DEMON_POTION,1);
	MIS_KILL_PALS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILL_PALS,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILL_PALS,"Creol byl potěšen mou prací.");
};


instance DIA_KREOL_Kill_Done_Rings(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_KREOL_Kill_Done_Rings_condition;
	information = DIA_KREOL_Kill_Done_Rings_info;
	permanent = FALSE;
	description = "Mám prsteny těch paladinů.";
};

func int DIA_KREOL_Kill_Done_Rings_condition()
{
	if((hero.guild == GIL_KDM) && (Npc_HasItems(hero,itri_quest_pal_ring) >= 1))
	{
		return TRUE;
	};
};

func void DIA_KREOL_Kill_Done_Rings_info()
{
	var int RingSum;
	var int RingSumXP;
	var int RingSumGold;

	AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_01");	//Mám prsteny těch paladinů. Máš zájem?
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_03");	//Zbláznil ses?! Vem si to a běž!
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_04");	//I když, počkej chvíli. Říkáš, že patřili těm paladinům?
	AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_05");	//Přesně tak.
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_06");	//Možná by mi nakonec k něčemu byly.
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_07");	//Mohl bych je proměnit na artefakty temnoty, které by dokázali vnutit mou vůli každému, kdo je nosí.
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_08");	//A budu mít vlastní armádu. Armádu temných paladinů!
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_09");	//Tak dej je sem.
	AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_10");	//Tady máš.

	RingSum = Npc_HasItems(hero,itri_quest_pal_ring);
	B_GiveInvItems(other,self,itri_quest_pal_ring,RingSum);
	Npc_RemoveInvItems(self,itri_quest_pal_ring,Npc_HasItems(self,itri_quest_pal_ring));

	if(RingSum == 1)
	{
		RingSumXP = RingSum * 100;
		RingSumGold = RingSum * 100;
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_11");	//Cože? Jenom jeden prsten? To myslíš vážně?!
		AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_12");	//Víc nemám.
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_13");	//Tady máš svou odměnu a ať už tě nevidím!
	}
	else if(RingSum <= 3)
	{
		RingSumXP = RingSum * 150;
		RingSumGold = RingSum * 150;
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_14");	//To jich nemáš zrovna moc.
		AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_15");	//Víc nemám.
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_16");	//Tady máš svou odměnu, i když si ji vlastně nezasloužíš.
	}
	else if(RingSum > 3)
	{
		RingSumXP = RingSum * 200;
		RingSumGold = RingSum * 200;
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_17");	//Skvělé! To by mělo stačit.
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_18");	//Tady máš svou odměnu. Vážně si ji zasloužíš!
	};

	B_GivePlayerXP(RingSumXP);
	B_GiveInvItems(self,other,ItMi_Gold,RingSumGold);
	AI_StopProcessInfos(self);

	if(RingSum <= 1)
	{
		Npc_SetRefuseTalk(self,30);
	};
};

instance DIA_Kreol_MonasterySecret(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_MonasterySecret_condition;
	information = DIA_Kreol_MonasterySecret_info;
	permanent = FALSE;
	description = "Mám tady jeden svitek...";
};

func int DIA_Kreol_MonasterySecret_condition()
{
	if((MonasterySecretLeadOW == TRUE) && (MIS_MonasterySecret == LOG_Running) && (Npc_HasItems(hero,ITWr_MonasterySecretLeadOW) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MonasterySecret_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_01");	//Mám tady jeden svitek...
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_02");	//A proč by mě to mělo zajímat?
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_03");	//Protože se tam zmiňuje tvé jméno.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_04");	//Vskutku? Dobře, ukaž ho sem.
	B_GiveInvItems(other,self,ITWr_MonasterySecretLeadOW,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_05");	//Hmm... Kdes ho našel?
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_06");	//Našel jsem ho ve věži Amon Shen.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_07");	//Ve staré věži nekromanta Nergala?!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_08");	//Ne dělám si legraci.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_09");	//Takže ten blázen snil o získání tohoto artefaktu již do konce svích dní!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_10");	//Mluvíš o něčem, co dokáže kontrolovat živého draka?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_11");	//Přesně tak!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_12");	//A co o něm víš?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_13");	//Málo. Jednu věc vím ale jistě: vypadá jak žezlo, na konci kterého se nachází dračí oko.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_14");	//Čaroděj, co tento artefakt vytvořil, ho před smrtí rozlomil na čtyři části a ty schoval někde na ostrově.
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_15");	//A odkud to všechno víš?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_16");	//Jednu část totiž mám! Ale ty ji nikdy nedostaneš, o tom ani nesni.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_17");	//Navíc bez ostaních částí je to jen kus kovu, nic víc.
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_18");	//A pokud bych ti přinesl ostatní kousky?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_19");	//Pak se k tomu můžeme vrátit. Jasně?
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_20");	//Dobře.
	MonasterySecret_Kreol = TRUE;
	B_LogEntry(TOPIC_MonasterySecret,"Creol mi řekl o artefaktě, který mě zajímal. Ale mág, co tento artefakt vytvořil, ho před smrtí rozlomil na čtyři části a ty schoval někde na ostrově. Creol již jednu část má, ale zbylé budu muset najít sám.");
};

instance DIA_Kreol_MonasterySecret_Done(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_MonasterySecret_Done_condition;
	information = DIA_Kreol_MonasterySecret_Done_info;
	permanent = FALSE;
	description = "Našel jsem všechny chybějící části toho magického žezla.";
};

func int DIA_Kreol_MonasterySecret_Done_condition()
{
	if((Kapitel < 6) && (MonasterySecret_Kreol == TRUE) && (MIS_MonasterySecret == LOG_Running) && (Npc_HasItems(hero,ItMi_DragonStaffPiece_01) >= 1) && (Npc_HasItems(hero,ItMi_DragonStaffPiece_03) >= 1) && (Npc_HasItems(hero,ItMi_DragonStaffPiece_04) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MonasterySecret_Done_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_01");	//Našel jsem všechny chybjející části toho magického žezla.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_02");	//Neuvěřím, dokud je neuvidím na vlastní oči!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_03");	//Tady, koukni se.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMi_DragonStaffPiece_01,1);
	Npc_RemoveInvItems(other,ItMi_DragonStaffPiece_03,1);
	Npc_RemoveInvItems(other,ItMi_DragonStaffPiece_04,1);
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_04");	//Ano, vypadají skutečně jako ony! Nikdy bych nevěřil, že to někdo dokáže.
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_05");	//Řekl si, že mi o tom artefaktě povíš víc.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_06");	//Samozřejmě. Já dodržím své slovo!
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_07");	//Už víš, že pomocí tohohle žezla je možné přivolat skutečného draka na tento svět.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_08");	//Jeho silou však není možné podmanit si draky, které se tady nacházeli.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_09");	//To neznamená, že je žezlo bezcené.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_10");	//Ale na to, aby se žezlu navrátila jeho předešlá síla, je potřebná ještě jedna věc.
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_11");	//Co?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_12");	//Dračí oko! Tohle žezlo je úplně na nic dokud v něm není skutečné dračí oko.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_13");	//To s jeho pomocí ovládáš vyvolaného draka. Jinak tě prostě nebude poslouchat.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_14");	//Naneštěstí jsi zabil všechny draky v tomhle údolí.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_15");	//Takže si ten odpad klidně nech!
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItMi_DragonStaffPiece_01,1);
	CreateInvItems(other,ItMi_DragonStaffPiece_02,1);
	CreateInvItems(other,ItMi_DragonStaffPiece_03,1);
	CreateInvItems(other,ItMi_DragonStaffPiece_04,1);
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_16");	//Takže se nic nedá dělat?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_17");	//Vidíš snad kolem stáda draků?
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_18");	//Ale jestli se mi povede setkat se s drakem, jak obnovím tento artefakt?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_19");	//Jsi tvrdohlavý jako osel! Ale jestli si myslíš, že máš šanci nějakého draka ještě potkat...
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_20");	//... tak jenom spoj všechny části žezla do kopy a vlož tam oko.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_21");	//Síla žezla obnoví oko a pak bude možné ho používať.
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_22");	//Dobře, co s okem je mi jasné, ale co kosti?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_23");	//Na dokončení žezla budeš potřebovat čtyři dračí lebky. Přinejmenším!
	MIS_MonasterySecret = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MonasterySecret,LOG_SUCCESS);
	B_LogEntry(TOPIC_MonasterySecret,"Na dokončení žezla budu potřebovat ještě pár věcí - dračí oko a čtyři dračí lebky.");
};

var int EligorNoSword;
var int EligorNoBow;
var int EligorNoStaff;
var int CanTellSleeperAgain;

instance DIA_Kreol_Sleeper(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_condition;
	information = DIA_Kreol_Sleeper_info;
	permanent = FALSE;
	description = "co víš o Spáčovi?";
};

func int DIA_Kreol_Sleeper_condition()
{
	if((SleeperOldIsDead == FALSE) && (NeedDemonolog == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_01");	//Co víš o Spáčovi?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_02");	//(zamyšleně) Je to opravdu starý démon. Jeden z prvních od stvoření tohoto světa.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_03");	//Jeho přítomnost v této části ostrova je důvodem proč jsem sem vlastne přišel.
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_04");	//Proč tě zajímá jeho přítomnost?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_05");	//Chtěl jsem do detailů prostudovat magické vlastnosti jeho démonické aury.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_06");	//Ale naneštěstí, nějaký místní idiot ho nejspíš blbou náhodou dokázal zahnat zpátky do své dimenze. Věřil bys tomu?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_07");	//Všechen můj dlouholetý výzkum teď nestačí ani na vytírání prdele!
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_08");	//Mýlíš se! Spáč se vrátil. To sis nevšiml? A prý že mocný mág...
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_09");	//(nadšeně) Cože?! A jak se o tom dověděl takovej mizera jako ty?
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_10");	//Protože já jsem ten mistní idiot, který ho nějakou blbou náhodou vypudil z nášho světa.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_11");	//Ty?! (dlouhý upřímený pohled) I když připouštím...
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_12");	//... Pokud si dokázal porazit avatar samotného Beliara, pak je možné, že bys měl nejakou šanci i se Spáčem.
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_13");	//Ale co s ním mám dělat teď?
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_14");	//Možná že tak mocný temný mág jako si ty, Beliarův vyvolený... by mi věděl poradit jak na něj tentokrát. A jelikož nevím, kde je teď Xardas, přišel jsem za tebou. 
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_15");	//(dlouhý nepříjemný vražedný pohled) A co ti brání vypudit ho znovu?
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_16");	//Jeho magie! Přivádí mě do šílenství.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_17");	//No ovšem. Co tě na tom překvapuje?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_18");	//Nakonec, jseš jenom místní idiot, smrtelník! A on je jedním z démonů od počátku času.
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_19");	//Poradíš mi, nebo ne?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_20");	//Meh. Tak třeba jo. Uděláme obchod.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_21");	//Já ti řeknu, jak zabránit jeho mentálním útokům a ty mi na oplátku přineseš jeho srdce!
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_22");	//To by mohlo stačit pro můj výzkum. Tak co říkáš?
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_23");	//Stejně nemám na vybranou. Souhlasím.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_24");	//Dobře, tak poslouchej.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_25");	//Překvapivě potrebuješ artefakt, který tě dokáže ochránit před vlivem démonů.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_26");	//Jeho jméno je Koruna démonů! Vytvořil ji samotný Beliar a dal ji darem nejmocnejšímu démonovi.
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_27");	//Hm, a to je který?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_28");	//Eligor, Pán Langu - nejvyšší ze všech démonů... (s respektem) Jenomže on ti ji jen tak nedá!
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_29");	//Je to stejné, jako vzít korunu z hlavy krále.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_30");	//A bojím se jen pomyslet na to, co by mohol chtít na oplátku.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_31");	//Hmm... (upřený pohled) co můžeš nabídnout?
	Info_ClearChoices(DIA_Kreol_Sleeper);
	Info_AddChoice(DIA_Kreol_Sleeper,"Bohužel nic, co by stálo za řeč.",DIA_Kreol_Sleeper_No);

	if((Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1) || (Npc_HasItems(hero,ITMI_HELMSLEEPER_MIS) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"Tady je maska Spáče!",DIA_Kreol_Sleeper_Mask);
	};
	if(hero.guild != GIL_KDW)
	{
		if(Npc_HasItems(hero,G3_ARMOR_HELMET_CRONE) >= 1)
		{
			Info_AddChoice(DIA_Kreol_Sleeper,"Mám Korunu Ledu.",DIA_Kreol_Sleeper_Adanos);
		};
	};
	if((EligorNoSword == FALSE) && (Npc_HasItems(hero,ITMW_2H_DRAGONMASTER) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"(navhrni meč Pána Draků)",DIA_Kreol_Sleeper_Sword);
	};
	if((EligorNoBow == FALSE) && (Npc_HasItems(hero,ITRW_G3_DEMON_BOW_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"(navrhni luk Barva Smrti)",DIA_Kreol_Sleeper_Bow);
	};
	if((EligorNoStaff == FALSE) && (Npc_HasItems(hero,ITMW_2H_KMR_DAEMONSTAFF_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"(navhrni hůl Hasitel Duší)",DIA_Kreol_Sleeper_Staff);
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		if((Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1) || (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1))
		{
			Info_AddChoice(DIA_Kreol_Sleeper,"(navrhni Innosovo oko)",DIA_Kreol_Sleeper_Innos);
		};
	};
};

func void DIA_Kreol_Sleeper_No()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_No_01_01");	//Bohužel nic, co by stálo za řeč.
	AI_Output(self,other,"DIA_Kreol_Sleeper_No_01_02");	//Přestaň tedy marnit můj čas!
	CanTellSleeperAgain = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Mask()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_01");	//Mám masku Spáče.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_02");	//Jo, je to poměrně cenná věc.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_03");	//A mohla by zaujmout i Eligora.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_04");	//Myslím, že to tak uděláme. Teď mi ji dej.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_05");	//A já připravím všechno potřebné k vyvolání démona.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_06");	//Domluveno?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_07");	//Dobře, tady je.

	if(Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1)
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER_MIS,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER_MIS,1);
	};

	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_08");	//Výborně! Zkus přijít za pár dní.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_09");	//Tentokrát musím zařídit věci s Eligorem osobně.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_10");	//Dobře! Ale ať tě ani nenapadne mě podvést.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_11");	//Neměj strach. Jsme dohodnuti.
	B_LogEntry(TOPIC_SLEEPERBACK,"Dal jsem Creolovi masku Spáče v naději, že získám mocný artefakt nazývaný Koruna démonů. Jen s jeho pomocí dokážu odolat Spáčově magii. Jeho nynější vlastník je Eligor, nejmocnější démon světa. Za pár dní se mám stavit u Creola pro další instrukce...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 1;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Adanos()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_01");	//Mám Korunu Ledu.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_02");	//Hmmm... (zamyšleně) Nejstarší artefakt, vytvořený samotným Adanem?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_03");	//Jo, to by Eligora mohlo zajímat.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_04");	//Myslím, že to tak uděláme. Teď mi ji dej.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_05");	//A já připravím všechno potřebné k vyvolání démona.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_06");	//Domluveno?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_07");	//Dobře, tady máš korunu.
	B_GiveInvItems(other,self,G3_ARMOR_HELMET_CRONE,1);
	Npc_RemoveInvItems(self,G3_ARMOR_HELMET_CRONE,1);
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_08");	//Výborně! Zkus přijít za pár dní.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_09");	//Tentokrát musím zařídit věci s Eligorem osobně.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_10");	//Dobře! Ale ať tě ani nenapadne mě podvést.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_11");	//Neměj strach. Jsme dohodnuti.
	B_LogEntry(TOPIC_SLEEPERBACK,"Dal jsem Creolovi Korunu Ledu v naději, že získám mocný artefakt nazývaný Koruna démonů. Jen s jeho pomocí dokážu odolat Spáčově magii. Jeho nynější vlastník je Eligor, nejmocnější démon světa. Za pár dní se mám stavit u Creola pro další instrukce...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 2;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Sword()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Sword_01_01");	//Mám meč Pána Draků!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Sword_01_02");	//Hmmm... (zamyšleně) Zaujímavá věc, ale nemyslím si, že to bude Eligora zajímavat.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Sword_01_03");	//Zkus neco jiného.
	EligorNoSword = TRUE;
};

func void DIA_Kreol_Sleeper_Bow()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Bow_01_01");	//Mám luk Barva smrti!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Bow_01_02");	//Ne, to není ono.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Bow_01_03");	//Potřebuješ něco skutečně hodnotného, abys zaujal Eligora.
	EligorNoBow = TRUE;
};

func void DIA_Kreol_Sleeper_Staff()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Staff_01_01");	//Mám Hasitele Duší!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Staff_01_02");	//A naco to bude pánovi démonů?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Staff_01_03");	//Pořádně se zamysli předtím, než mu nabídneš nějaký odpad.
	EligorNoStaff = TRUE;
};

func void DIA_Kreol_Sleeper_Innos()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_01");	//Mám Innosovo oko!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_02");	//Hmmm... (zamyšleně) Nejstarší paladinský artefakt?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_03");	//Jo. To by mohlo Eligora zajímat.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_04");	//Myslím, že to tak uděláme. Teď mi ho dej.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_05");	//A já připravím všechno potřebné k vyvolání démona.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_06");	//Domluveno?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_07");	//Dobře, tady máš amulet.

	if(Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_MIS,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_Discharged_Mis,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_Discharged_Mis,1);
	};

	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_08");	//Výborně! Zkus přijít za pár dní.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_09");	//Tentokrát musím zařídit věci s Eligorem osobně.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_10");	//Dobře! Ale ať tě ani nenapadne mě podvést.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_11");	//Neměj strach. Jsme dohodnuti.
	B_LogEntry(TOPIC_SLEEPERBACK,"Dal jsem Creolovi Innosovo oko v naději, že získám mocný artefakt nazývaný Koruna démonů. Jen s jeho pomocí dokážu odolat Spáčově magii. Jeho nynější vlastník je Eligor, nejmocnější démon světa. Za pár dní se mám stavit u Creola pro další instrukce...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 3;
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_Sleeper_Again(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_Again_condition;
	information = DIA_Kreol_Sleeper_Again_info;
	permanent = TRUE;
	description = "K našemu poslednímu rozhovoru...";
};

func int DIA_Kreol_Sleeper_Again_condition()
{
	if((SleeperOldIsDead == FALSE) && (CanTellSleeperAgain == TRUE) && (HasSleeperDefence == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_Again_info()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Again_01_01");	//K našemu poslednímu rozhovoru...
	AI_Output(self,other,"DIA_Kreol_Sleeper_Again_01_02");	//Co? Přinesl jsi mi něco cenného?
	Info_ClearChoices(DIA_Kreol_Sleeper_Again);
	Info_AddChoice(DIA_Kreol_Sleeper_Again,"Bohužel nic, co by stálo za řeč.",DIA_Kreol_Sleeper_Again_No);

	if((Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1) || (Npc_HasItems(hero,ITMI_HELMSLEEPER_MIS) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"Tady je maska Spáče!",DIA_Kreol_Sleeper_Mask);
	};
	if(hero.guild != GIL_KDW)
	{
		if(Npc_HasItems(hero,G3_ARMOR_HELMET_CRONE) >= 1)
		{
			Info_AddChoice(DIA_Kreol_Sleeper_Again,"Mám Korunu Ledu.",DIA_Kreol_Sleeper_Again_Adanos);
		};
	};
	if((EligorNoSword == FALSE) && (Npc_HasItems(hero,ITMW_2H_DRAGONMASTER) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper_Again,"(navrhni meč Pána Draků)",DIA_Kreol_Sleeper_Again_Sword);
	};
	if((EligorNoBow == FALSE) && (Npc_HasItems(hero,ITRW_G3_DEMON_BOW_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper_Again,"(navrhni luk Barva Smrti)",DIA_Kreol_Sleeper_Again_Bow);
	};
	if((EligorNoStaff == FALSE) && (Npc_HasItems(hero,ITMW_2H_KMR_DAEMONSTAFF_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper_Again,"(navhrni hůl Hasitel Duší)",DIA_Kreol_Sleeper_Again_Staff);
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		if((Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1) || (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1))
		{
			Info_AddChoice(DIA_Kreol_Sleeper_Again,"(navrhni Innosovo oko)",DIA_Kreol_Sleeper_Again_Innos);
		};
	};
};

func void DIA_Kreol_Sleeper_Again_No()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_No_01_01");	//Bohužel nic, co by stálo za řeč.
	AI_Output(self,other,"DIA_Kreol_Sleeper_No_01_02");	//Tak potom sa nemáme o čom baviť! Zase márniš moj čas!
	CanTellSleeperAgain = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Again_Mask()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_01");	//Mám masku Spáče.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_02");	//Jo, je to poměrně cenná věc.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_03");	//A mohla by zaujmout i Eligora.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_04");	//Myslím, že to tak uděláme. Teď mi ji dej.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_05");	//A já připravím všechno potřebné k vyvolání démona.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_06");	//Domluveno?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_07");	//Dobře, tady je.

	if(Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1)
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER_MIS,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER_MIS,1);
	};

	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_08");	//Výborně! Zkus přijít za pár dní.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_09");	//Tentokrát musím zařídit věci s Eligorem osobně.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_10");	//Dobře! Ale ať tě ani nenapadne mě podvést.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_11");	//Neměj strach. Jsme dohodnuti.
	B_LogEntry(TOPIC_SLEEPERBACK,"Dal jsem Creolovi masku Spáče v naději, že získám mocný artefakt nazývaný Koruna démonů. Jen s jeho pomocí dokážu odolat Spáčově magii. Jeho nynější vlastník je Eligor, nejmocnější démon světa. Za pár dní se mám stavit u Creola pro další instrukce...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 1;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Again_Adanos()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_01");	//Mám Korunu Ledu.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_02");	//Hmmm... (zamyšleně) Nejstarší artefakt, vytvořený samotným Adanem?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_03");	//Jo, to by Eligora mohlo zajímat.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_04");	//Myslím, že to tak uděláme. Teď mi ji dej.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_05");	//A já připravím všechno potřebné k vyvolání démona.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_06");	//Domluveno?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_07");	//Dobře, tady máš korunu.
	B_GiveInvItems(other,self,G3_ARMOR_HELMET_CRONE,1);
	Npc_RemoveInvItems(self,G3_ARMOR_HELMET_CRONE,1);
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_08");	//Výborně! Zkus přijít za pár dní.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_09");	//Tentokrát musím zařídit věci s Eligorem osobně.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_10");	//Dobře! Ale ať tě ani nenapadne mě podvést.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_11");	//Neměj strach. Jsme dohodnuti.
	B_LogEntry(TOPIC_SLEEPERBACK,"Dal jsem Creolovi Korunu Ledu v naději, že získám mocný artefakt nazývaný Koruna démonů. Jen s jeho pomocí dokážu odolat Spáčově magii. Jeho nynější vlastník je Eligor, nejmocnější démon světa. Za pár dní se mám stavit u Creola pro další instrukce...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 2;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Again_Sword()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Sword_01_01");	//Mám meč Pána Draků!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Sword_01_02");	//Hmmm... (zamyšleně) Zaujímavá věc, ale nemyslím si, že to bude Eligora zajímavat.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Sword_01_03");	//Zkus neco jiného.
	EligorNoSword = TRUE;
};

func void DIA_Kreol_Sleeper_Again_Bow()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Bow_01_01");	//Mám luk Barva smrti!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Bow_01_02");	//Ne, to není ono.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Bow_01_03");	//Potřebuješ něco skutečně hodnotného, abys zaujal Eligora.
	EligorNoBow = TRUE;
};

func void DIA_Kreol_Sleeper_Again_Staff()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Staff_01_01");	//Mám Hasitele Duší!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Staff_01_02");	//A naco to bude pánovi démonů?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Staff_01_03");	//Pořádně se zamysli předtím, než mu nabídneš nějaký odpad.
	EligorNoStaff = TRUE;
};

func void DIA_Kreol_Sleeper_Again_Innos()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_01");	//Mám Innosovo oko!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_02");	//Hmmm... (zamyšleně) Nejstarší paladinský artefakt?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_03");	//Jo. To by mohlo Eligora zajímat.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_04");	//Myslím, že to tak uděláme. Teď mi ho dej.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_05");	//A já připravím všechno potřebné k vyvolání démona.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_06");	//Domluveno?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_07");	//Dobře, tady máš amulet.

	if(Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_MIS,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_Discharged_Mis,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_Discharged_Mis,1);
	};

	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_08");	//Výborně! Zkus přijít za pár dní.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_09");	//Tentokrát musím zařídit věci s Eligorem osobně.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_10");	//Dobře! Ale ať tě ani nenapadne mě podvést.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_11");	//Neměj strach. Jsme dohodnuti.
	B_LogEntry(TOPIC_SLEEPERBACK,"Dal jsem Creolovi Innosovo oko v naději, že získám mocný artefakt nazývaný Koruna démonů. Jen s jeho pomocí dokážu odolat Spáčově magii. Jeho nynější vlastník je Eligor, nejmocnější démon světa. Za pár dní se mám stavit u Creola pro další instrukce...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 3;
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_Sleeper_MaskTrade(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_MaskTrade_condition;
	information = DIA_Kreol_Sleeper_MaskTrade_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Kreol_Sleeper_MaskTrade_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((SleeperOldIsDead == FALSE) && (Npc_IsInState(self,ZS_Talk) == TRUE) && (DemonCrownRitualDay != FALSE) && (DemonCrownRitualDay < (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_MaskTrade_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_01");	//Už jsi tady? Hmmm... (nezájem) Dobře! Už mám téměř všechno připravené.
	AI_Output(other,self,"DIA_Kreol_Sleeper_MaskTrade_01_02");	//Týká se to naší dohody?
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_03");	//Samozřejmě... (rozkazujíc) Vem tuhle runu. S její pomocí můžeš přivolat Eligora osobně na tento svět.
	B_GiveInvItems(self,other,ItRu_EligorSummon,1);
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_04");	//Ale nemysli si, že to můžeš udělat kdykoliv.
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_05");	//Jdi do staré Xardasovy věže, co je v Hornickém údolí.
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_06");	//Použi magický pentagram pro rituál vyvolání.
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_07");	//Zbytek ti řekne už Eligor osobně.
	AI_Output(other,self,"DIA_Kreol_Sleeper_MaskTrade_01_08");	//Ale řekls, že...
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_09");	//Dost hloupých otázek! Jdi a nezapomeň mi pňinést Spáčovo srdce až ho zabiješ.
	ReadyToSumEligor = TRUE;
	B_LogEntry(TOPIC_SLEEPERBACK,"Creol mi dal magickou runu, abych mohl přivolat Eligora na tento svět. Místo k provedení rituálu je ve staré Xardasové věži.");
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_Sleeper_Dead(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_Dead_condition;
	information = DIA_Kreol_Sleeper_Dead_info;
	permanent = FALSE;
	description = "Zabil jsem Spáče!";
};

func int DIA_Kreol_Sleeper_Dead_condition()
{
	if(SleeperOldIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_Dead_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Kreol_Sleeper_Dead_01_01");	//Zabil jsem Spáče!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_01_02");	//Dobře. Doufám, že máš u sebe temný krystal jeho duše.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Dead_01_03");	//Na tom nezáleží! Stejně bych ti ho nedal.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_01_04");	//Jseš hlupák! Tedy, sám sis zvolil svůj osud.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_01_05");	//Místo jeho srdce si vezmu to tvoje!
	Info_ClearChoices(DIA_Kreol_Sleeper_Dead);
	Info_AddChoice(DIA_Kreol_Sleeper_Dead,"Uklidni se!",DIA_Kreol_Sleeper_Dead_Ext);
};

func void DIA_Kreol_Sleeper_Dead_Ext()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	Snd_Play("MFX_FEAR_CAST");
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(other,self,"DIA_Kreol_Sleeper_Dead_Ext_01_01");	//Uklidni se! Stejně ti nic nepomůže.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Dead_Ext_01_02");	//Dnes zemřeš, protože taká je vůle Innose!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_Ext_01_03");	//(úškleb) Takže on tě poslal. Ano, teď cítím jeho sílu v tobě! Ty hlupáku!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_Ext_01_04");	//Ale to ti nepomůže! Já tě zničím ty ubohý červe!
	CanKillKreol = TRUE;
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Info_ClearChoices(DIA_Kreol_Sleeper_Dead);
	Info_AddChoice(DIA_Kreol_Sleeper_Dead,"... (KONEC)",DIA_Kreol_Sleeper_Dead_End);
};

func void DIA_Kreol_Sleeper_Dead_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Kreol_Hromanin(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Hromanin_condition;
	information = DIA_Kreol_Hromanin_info;
	permanent = FALSE;
	description = "Co víš o Chromaninu?";
};

func int DIA_Kreol_Hromanin_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_SendToKriol == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Hromanin_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_01");	//Co víš o Chromaninu?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_02");	//Tvé otázky mě nepřestávají udivovat. Nicméně, odpovím ti.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_03");	//Slovo Chromanin v antickém jazyce znamená esenci kterékoliv živé bytosti. Přesněji duši.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_04");	//A kdybychom tím nazvali, dejme tomu, nějaký objekt?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_05");	//Nezáleží na tom, jak Chromanin vypadá! Může to být cokoliv.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_06");	//Hlavná věc je, že tento artefakt má jednu velmi cennou vlastnost.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_07");	//A to?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_08");	//Chromanin zotročí duše těch, kteří se ho odváží vlastnit.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_09");	//Samozřejmě ne hned. Postupně... (se zábleskem v očích) Den po dni přivede svého majitele k šílenství.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_10");	//A když přijde čas, je ochotný vzdát se všeho, jen aby se té kletby zbavil.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_11");	//Pak se zjeví pravý pán artefaktu a vezme si duši šílence.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_12");	//A kdo je tím pánem?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_13");	//Každý Chromanin má svého vlastního! Nemůžu říct, jak přesně vypadá.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_14");	//Já mám svou duši pořád rád.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_15");	//Mimochodem, proč tě to zajímá?
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_16");	//Khorinis je zaplaven nemrtvými. Mágové Ohně říkají, že je to chyba Chromaninu.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_17");	//Pitomci! Jak můžou být tak hloupí? Nevidí si daleko od nosu.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_18");	//A ty očividně víš, co je důvodem?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_19");	//Samozřejmě! Ještě aby ne. Ale nemysli si, že ti jen tak odhalím tohle tajemství.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_20");	//Každá informace má svou cenu. Tak jaká je ta tvoje?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_21");	//Vidím, že umíš smlouvat. Ale v tomto případě ti to moc nepomůže, protože to nebude levné.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_22");	//Nejdřív si řekni a pak dělej závěry.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_23");	//No... (všemocně) Pokud jinak nedáš.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_24");	//Začali jsme tuto konverzaci zmínkou o Chromaninu. To je moje cena!
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_25");	//Chceš abych ti nějaký získal?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_26");	//(panovačně) Ano, přesně to chci!
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_27");	//Přinesla se ke mně informace, že někde na ostrově jeden je.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_28");	//Dones mi ho. A ať tě ani nenapadne udělat to bez toho, aby ses zbavil jeho ochránce.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_29");	//Pořád jsem dost při smyslech na to, abych zamával své duši na rozloučenou.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_30");	//A mojí škoda nebude?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_31");	//Nuže, ty ses ptal na cenu. Nepozdává se ti?
	Info_ClearChoices(DIA_Kreol_Hromanin);
	Info_AddChoice(DIA_Kreol_Hromanin,"Ne, to je příliš.",DIA_Kreol_Hromanin_No);
	Info_AddChoice(DIA_Kreol_Hromanin,"Dobře, dohodli jsme se.",DIA_Kreol_Hromanin_Yes);
};

func void DIA_Kreol_Hromanin_No()
{
	AI_Output(other,self,"DIA_Kreol_Hromanin_No_01_01");	//Ne, to je příliš.
	AI_Output(self,other,"DIA_Kreol_Hromanin_No_01_02");	//Jak jsem si myslel. Domluvili jsme tedy.
	MIS_DarkOrden = LOG_Failed;
	B_LogEntry_Failed(TOPIC_DarkOrden);
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Hromanin_Yes()
{
	AI_Output(other,self,"DIA_Kreol_Hromanin_Yes_01_01");	//Dobře, dohodli jsme se.
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_02");	//Výborně. Tak tady nestoj a běž získat ten artefakt.
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_03");	//Jo a ještě něco...
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_04");	//Dřív než zemřeš, nech mi nějaký odkaz, kde hledat tvou mrtvolu.
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_05");	//Myslím, že z tebe bude skvělý kostlivec. Hodně toho uděláš a jseš tak akorát hloupý.
	AI_Output(other,self,"DIA_Kreol_Hromanin_Yes_01_06");	//Na to ani nemysli.
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_07");	//(úškleb)
	KreolOpenHromaninSaga = TRUE;
	B_LogEntry(TOPIC_DarkOrden,"Dohodl jsem se s Creolem a teď pro něj musím najít Chromanin. Pak mi poví, proč je Khorinis zaplaven nemrtvými.");
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_HromaninDone(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_HromaninDone_condition;
	information = DIA_Kreol_HromaninDone_info;
	permanent = FALSE;
	description = "Donesl jsem ti Chromanin.";
};

func int DIA_Kreol_HromaninDone_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (Npc_HasItems(hero,ITWR_HROMANIN) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kreol_HromaninDone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Kreol_HromaninDone_01_01");	//Donesl jsem ti Chromanin.
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_02");	//Ukaž mi ho.
	AI_Output(other,self,"DIA_Kreol_HromaninDone_01_03");	//Tady máš.
	B_GiveInvItems(other,self,ITWR_HROMANIN,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_04");	//Hmmm... To znamená, že je to obyčejná kniha!
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_05");	//A podle toho, co cítím, když na ni pohlídnu, její strážce je už po smrti.
	AI_Output(other,self,"DIA_Kreol_HromaninDone_01_06");	//Jo, zabil jsem ho.
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_07");	//Upřímně, jsem překvapen, žes to přežil.
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_08");	//Ale řekněme si otevřeně, je to asi jenom náhoda.
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_09");	//V každém případě si zasloužiš odměnu.
	DO_KreolTell = TRUE;
	B_LogEntry(TOPIC_DarkOrden,"Donesl jsem Chromanin Creolovi.");
};

instance DIA_Kreol_TellDarkOrden(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_TellDarkOrden_condition;
	information = DIA_Kreol_TellDarkOrden_info;
	permanent = FALSE;
	description = "Je čas odpovědět na moji otázku.";
};

func int DIA_Kreol_TellDarkOrden_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_KreolTell == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_TellDarkOrden_info()
{
	AI_Output(other,self,"DIA_Kreol_TellDarkOrden_01_01");	//Je čas odpovědět na moji otázku.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_02");	//(nezaujatě) Meh. Všechno je to chyba paladinů! Stačí ti to?
	AI_Output(other,self,"DIA_Kreol_TellDarkOrden_01_03");	//Paladinů?!
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_04");	//Ano jich. Překvapuje tě to?
	AI_Output(other,self,"DIA_Kreol_TellDarkOrden_01_05");	//Jo a jak. Můžeš mi to vysvětlit?
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_06");	//(smích) Beze mne bys byl úplně ztracen, nemám pravdu?
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_07");	//Ale dobře. Když se na tebe kouknu, sbíhá se ve mně lítost až mi je z toho zle. Odhrnu závěsy tohto tajemství pro tvou jednoduchou mysl.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_08");	//Poslouchej pozorně, nebudu to opakovat dvakrát.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_09");	//Jak už asi víš, Innosův paladinský řád je starý víc než milénium.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_10");	//A celý ten čas jediné co dělali bylo, že plnili vůli svého boha.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_11");	//Avšak někteří byli tak fanaticky oddaní svému bohu, že někdy nerozoznali dobro od zla.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_12");	//Ve jménu Innose spáchali strašné zločiny. A nebylo tomu konce...
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_13");	//Pohlížejíc na ně a všechny jejich činy, Innos už nemohl dál poslouchat jejich omluvy.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_14");	//Zbavil tyto paladiny své božské moci a nechal jim jen jejich víru.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_15");	//Mnoho jich je pohřbeno na ostrově. Se slávou a ctí, přesně jak si válečnící řádu zaslouží.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_16");	//Ovšem po smrti začali povstávat v podobě mocných nemrtvých.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_17");	//A nyní jsou z nich generálové nesčetné armády nemrtvých, kteří vedou své legie ke slávě Beliarově.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_18");	//Už chápeš?
	AI_Output(other,self,"DIA_Kreol_TellDarkOrden_01_19");	//Takže nemrtví paladinové jsou důvodem, proč nemrtví útočí na Khorinis?
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_20");	//Přesne tak! A nepřestane to, dokud někdo neupokojí duše těchto prokletých válečníků.
	DO_KnowAboutDO = TRUE;
	B_LogEntry(TOPIC_DarkOrden,"Creol mi vyprávěl příběh o paladinech, kteří se stali tak fanaticky oddaní Innosovi, že spáchali hrozná zvěrstva. Innos to nemohl dovolit a proto jim odepřel svou sílu a pomoc. Mnoho těchto paladinů zůstalo pohřbených na ostrově. Nicméně po smrti povstali jako mocní nemrtví a teď vedou legie nemrtvých do boje za slávu Beliara. Dokud se někdo nepostará o jejich duše, útoky na Khorinis nepřestanou.");
};

instance DIA_Kreol_MAXROBE(C_Info)
{
	npc = none_102_kreol;
	nr = 2;
	condition = DIA_Kreol_MAXROBE_condition;
	information = DIA_Kreol_MAXROBE_info;
	permanent = FALSE;
	description = "Kde seženu lepší roucho?";
};

func int DIA_Kreol_MAXROBE_condition()
{
	if((hero.guild == GIL_KDM) && (Kapitel >= 5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && (LastRobeKDM == FALSE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MAXROBE_info()
{
	AI_Output(other,self,"DIA_Kreol_MAXROBE_01_00");	//Kde seženu lepší roucho?
	AI_Output(self,other,"DIA_Kreol_MAXROBE_01_01");	//Jelikož ovládáš všech šest kruhů magie, jsi hoden nosit roucho velmistra Temnoty. Ale když tak na tebe koukám...
	AI_Output(self,other,"DIA_Kreol_MAXROBE_01_02");	//(úškleb) Jelikož nejsem charita, budeš za něj muset zaplatit.
	AI_Output(other,self,"DIA_Kreol_MAXROBE_01_03");	//Rozumím.
	LastRobeKDM = TRUE;
};

instance DIA_Kreol_MAXROBE_Buy(C_Info)
{
	npc = none_102_kreol;
	nr = 2;
	condition = DIA_Kreol_MAXROBE_Buy_condition;
	information = DIA_Kreol_MAXROBE_Buy_info;
	permanent = TRUE;
	description = "Prodej mi roucho arcimága Temnoty. (cena: 30000 zlatých)";
};

func int DIA_Kreol_MAXROBE_Buy_condition()
{
	if((hero.guild == GIL_KDM) && (LastRobeKDM == TRUE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MAXROBE_Buy_info()
{
	AI_Output(other,self,"DIA_Kreol_MAXROBE_Buy_01_00");	//Prodej mi roucho arcimága Temnoty.

	if(Npc_HasItems(hero,ItMi_Gold) >= 30000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,30000);
		Npc_RemoveInvItems(self,ItMi_Gold,30000);
		AI_Output(self,other,"DIA_Kreol_MAXROBE_Buy_01");	//Dobře. Tady máš. Doufám, že ti sedne, mám ji už věčnost, ale moji učni se ukázali jako jedno zklamání za druhým...
		AI_Output(self,other,"DIA_Kreol_MAXROBE_Buy_02");	//Je to velká čest nosit ji. Pamatuj na to! 
		CreateInvItems(self,itar_kdm_sh,1);
		B_GiveInvItems(self,other,itar_kdm_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_MAXROBE_Buy_01_03");	//Nemáš dost zlata.
	};
};

instance DIA_Kreol_Nergal(C_Info)
{
	npc = none_102_kreol;
	nr = 2;
	condition = DIA_Kreol_Nergal_condition;
	information = DIA_Kreol_Nergal_info;
	permanent = FALSE;
	description = "Víš jak se dostat do Nergalovy věže?";
};

func int DIA_Kreol_Nergal_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALTIMER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Nergal_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Kreol_Nergal_01_00");	//Víš jak se dostat do Nergalovy věže?
	AI_Output(self,other,"DIA_Kreol_Nergal_01_01");	//Jistě, že vím. Přes dveře. Jestli tedy nejsou zamčené. Což jsou.
	AI_Output(other,self,"DIA_Kreol_Nergal_01_02");	//A kde najdu klíč?
	AI_Output(self,other,"DIA_Kreol_Nergal_01_03");	//Klíč od těch dveří je můj.
	AI_Output(self,other,"DIA_Kreol_Nergal_01_04");	//Jestli chceš, tak ti ho dám. Ale vevnitř nečekej nic kromě smrti.
	AI_Output(other,self,"DIA_Kreol_Nergal_01_05");	//Prostě mi ho dej, dobře?
	AI_Output(self,other,"DIA_Kreol_Nergal_01_06");	//Když se nevíš dočkat smrti... Na, vem si ho, alespoň budu mít pokoj.
	B_GiveInvItems(self,other,itke_darktower_01,1);
	KreolGiveKey = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_DarkMageBuySwords(C_Info)
{
	npc = none_102_kreol;
	nr = 3;
	condition = DIA_Kreol_DarkMageBuySwords_condition;
	information = DIA_Kreol_DarkMageBuySwords_info;
	permanent = FALSE;
	description = "Měl bys zájem o tuto zbraň?";
};

func int DIA_Kreol_DarkMageBuySwords_condition()
{
	if((Npc_HasItems(hero,ITMW_FAKESWORD_01) >= 1) && (DarkMageBuySwords == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_DarkMageBuySwords_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwords_01_00");	//Měl bys zájem o tuto zbraň?
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_01");	//(znechuceně) Máš v plánu mi zas prodávat odpadky?
	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwords_01_02");	//Tady je.
	B_GiveInvItems(other,self,ITMW_FAKESWORD_01,1);
	Npc_RemoveInvItems(self,ITMW_FAKESWORD_01,1);
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_03");	//Tak, tak... Ano, je to zajímavá věc!
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_04");	//Cítím jemnou přítomnost Beliarovy temné magie.
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_05");	//Udělals dobře, žes mi ji přinesl. V neschopných rukou by mohla být i smrtelná.
	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwords_01_06");	//A co dál?
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_07");	//Všechno je jednoduché! Já si tuto zbraň ponechám pro studium jejich vlastností.
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_08");	//A jestli se ti podaří najít něco podobného, tak mi to přines.
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_09");	//Samozřejmě ti dám nějakou tu obrovskou odměnu, jak se říká.
	B_LogEntry(Topic_OutTrader,"Creol ode mně odkoupí všechny rituální zbraně z Masyafu, které mu donesu.");
	KreolBuyMasiafSwrods = TRUE;
};

instance DIA_Kreol_DarkMageBuySwordsDone(C_Info)
{
	npc = none_102_kreol;
	nr = 3;
	condition = DIA_Kreol_DarkMageBuySwordsDone_condition;
	information = DIA_Kreol_DarkMageBuySwordsDone_info;
	permanent = TRUE;
	description = "Přinesl jsem ti další rituální zbraň.";
};

func int DIA_Kreol_DarkMageBuySwordsDone_condition()
{
	if((Npc_HasItems(hero,ITMW_FAKESWORD_01) >= 1) && (KreolBuyMasiafSwrods == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_DarkMageBuySwordsDone_info()
{
	var int SummSword;

	SummSword = FALSE;
	SummSword = Npc_HasItems(hero,ITMW_FAKESWORD_01);

	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwordsDone_01_00");	//Přinesl jsem ti další rituální zbraň.
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwordsDone_01_01");	//Výborně. Dej to sem.
	B_GiveInvItems(other,self,ITMW_FAKESWORD_01,Npc_HasItems(other,ITMW_FAKESWORD_01));
	Npc_RemoveInvItems(self,ITMW_FAKESWORD_01,Npc_HasItems(self,ITMW_FAKESWORD_01));
	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwordsDone_01_03");	//A co moje odměna?
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwordsDone_01_04");	//Žádný strach... Na, vem si tohle zlato.
	B_GiveInvItems(self,other,ItMi_Gold,SummSword * 500);
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwordsDone_01_05");	//Je to pro tebe vhodná odměna.
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwordsDone_01_06");	//A teď odejdi, nemám čas na řečnění.
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_BuyWeapons(C_Info)
{
	npc = none_102_kreol;
	nr = 600;
	condition = DIA_Kreol_BuyWeapons_condition;
	information = DIA_Kreol_BuyWeapons_info;
	permanent = TRUE;
	description = "Mám pro tebe prokletou zbraň.";
};

func int DIA_Kreol_BuyWeapons_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Xardas_Mechi) == TRUE) && (KreolBuyWeap == TRUE))
	{
		if((Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0) || (Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0) || (Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0) || (Npc_HasItems(hero,ItMw_PlagueStaff) > 0) || (Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0) || (Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0) || (Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0) || (Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0) || (Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0) || (Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0) || (Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PreElite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0) || (Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0) || (Npc_HasItems(hero,ItRw_Undead) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_Elite) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Kreol_BuyWeapons_info()
{
	var int countexp;
	var int goldplus;
	var int goldplus_all;

	goldplus = FALSE;
	goldplus_all = FALSE;

	AI_Output(other,self,"DIA_Xardas_BuyWeapons_01_00");	//Mám pro tebe prokletou zbraň.

	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Left);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Left,Npc_HasItems(hero,ItMw_1H_ChelDrak_Left));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Right);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Right,Npc_HasItems(hero,ItMw_1H_ChelDrak_Right));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_2H_ShadowBlade_Xert);
		Npc_RemoveInvItems(hero,ItMw_2H_ShadowBlade_Xert,Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elair);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elair,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Ober);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Ober,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_PlagueStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_PlagueStaff);
		Npc_RemoveInvItems(hero,ItMw_PlagueStaff,Npc_HasItems(hero,ItMw_PlagueStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_SoulKeeperStaff);
		Npc_RemoveInvItems(hero,ItMw_SoulKeeperStaff,Npc_HasItems(hero,ItMw_SoulKeeperStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DoomSpeer_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DoomSpeer_Elite,Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMAXE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMAXE,Npc_HasItems(hero,ITMW_2H_DOOMAXE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_HAOSHAND);
		Npc_RemoveInvItems(hero,ITMW_2H_HAOSHAND,Npc_HasItems(hero,ITMW_2H_HAOSHAND));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_RAVENELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_RAVENELITE,Npc_HasItems(hero,ITMW_2H_RAVENELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DRACONSWORD_DEAD);
		Npc_RemoveInvItems(hero,ITMW_2H_DRACONSWORD_DEAD,Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_Doom_OldPiratensaebel);
		Npc_RemoveInvItems(hero,ItMw_Doom_OldPiratensaebel,Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST,Npc_HasItems(hero,ITMW_SHADOWPRIEST));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elite);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elite,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD,Npc_HasItems(hero,ITMW_2H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_PREELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_PREELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_ELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_ELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD,Npc_HasItems(hero,ITMW_1H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_GHOSTSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_GHOSTSWORD,Npc_HasItems(hero,ITMW_1H_GHOSTSWORD));
		goldplus_all = goldplus_all + (goldplus * 15);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSPEER);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSPEER,Npc_HasItems(hero,ITMW_1H_DOOMSPEER));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD_Elite,Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ItRw_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Undead);
		Npc_RemoveInvItems(hero,ItRw_Undead,Npc_HasItems(hero,ItRw_Undead));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Crossbow_Undead);
		Npc_RemoveInvItems(hero,ItRw_Crossbow_Undead,Npc_HasItems(hero,ItRw_Crossbow_Undead));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_01_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_01_Damn,Npc_HasItems(hero,ItAr_Shield_01_Damn));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_02_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_02_Damn,Npc_HasItems(hero,ItAr_Shield_02_Damn));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_03_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_03_Damn,Npc_HasItems(hero,ItAr_Shield_03_Damn));
		goldplus_all = goldplus_all + (goldplus * 10);
	};

	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_13");	//Na, tady máš odměnu a běž!
	B_GiveInvItems(self,other,ItMi_Gold,goldplus_all);
};