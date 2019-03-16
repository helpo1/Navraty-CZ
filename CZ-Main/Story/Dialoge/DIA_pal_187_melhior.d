
instance DIA_PAL_187_MELHIOR_EXIT(C_Info)
{
	npc = pal_187_melhior;
	nr = 999;
	condition = dia_pal_187_melhior_exit_condition;
	information = dia_pal_187_melhior_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_187_melhior_exit_condition()
{
	return TRUE;
};

func void dia_pal_187_melhior_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_FIRSTWARN(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_firstwarn_condition;
	information = dia_pal_187_melhior_firstwarn_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int dia_pal_187_melhior_firstwarn_condition()
{
	return TRUE;
};

func void dia_pal_187_melhior_firstwarn_info()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_FirstWarn_01_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Pal_187_Melhior_FirstWarn_01_01");	//(vystrašeně) Ehm, co? Já?
	AI_Output(self,other,"DIA_Pal_187_Melhior_FirstWarn_01_02");	//To není tvoje starost. A vůbec, co po mně chceš?
	AI_Output(self,other,"DIA_Pal_187_Melhior_FirstWarn_01_03");	//Táhni, odkud jsi přišel!
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Pal_187_Melhior_FirstWarn_01_04");	//No, co čumíš? Padej...
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_SECONDWARN(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_secondwarn_condition;
	information = dia_pal_187_melhior_secondwarn_info;
	permanent = FALSE;
	description = "Neměl bys být na svém místě, vojáku?";
};


func int dia_pal_187_melhior_secondwarn_condition()
{
	if(Npc_KnowsInfo(other,dia_pal_187_melhior_firstwarn))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_secondwarn_info()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_SecondWarn_01_00");	//Neměl bys být na svém místě, vojáku?
	AI_Output(self,other,"DIA_Pal_187_Melhior_SecondWarn_01_01");	//(naštvaně) Zase ty?! Začínáš mi pomalu lézt na nervy!
	AI_Output(self,other,"DIA_Pal_187_Melhior_SecondWarn_01_02");	//Táhni k Beliarovi! To snad není nikde místo, kde bych se mohl v klidu napít?
	AI_Output(self,other,"DIA_Pal_187_Melhior_SecondWarn_01_03");	//Dávej si bacha, nebo tě odnaučím plést se mi pod nohy!
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Pal_187_Melhior_SecondWarn_01_04");	//(škyt) Jasný?
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_LASTWARN(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_lastwarn_condition;
	information = dia_pal_187_melhior_lastwarn_info;
	permanent = FALSE;
	description = "Zajímalo by mě, co na to řekne lord Hagen...";
};


func int dia_pal_187_melhior_lastwarn_condition()
{
	if(Npc_KnowsInfo(other,dia_pal_187_melhior_secondwarn))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_lastwarn_info()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_LastWarn_01_00");	//Jsi zpitý jak zvíře! Zajímalo by mě, co na to řekne lord Hagen...
	AI_Output(self,other,"DIA_Pal_187_Melhior_LastWarn_01_01");	//CO?! Ty mi chceš vyhrožovat, bonzáku?!
	AI_Output(self,other,"DIA_Pal_187_Melhior_LastWarn_01_02");	//Mě nevystrašíš! Kašlu ti na Hagena!
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Pal_187_Melhior_LastWarn_01_03");	//(škyt) Myslím, že už jsem tě jednou varoval!
	AI_Output(self,other,"DIA_Pal_187_Melhior_LastWarn_01_04");	//Teď ti ukážu, jak se mnou máš mluvit!
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_PAL_187_MELHIOR_PAYBACKOK(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_paybackok_condition;
	information = dia_pal_187_melhior_paybackok_info;
	permanent = FALSE;
	description = "Nezasloužíš si být paladinem!";
};


func int dia_pal_187_melhior_paybackok_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_KnowsInfo(hero,dia_pal_187_melhior_lastwarn))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_paybackok_info()
{
	if(Npc_HasEquippedWeapon(self) == FALSE)
	{
		CreateInvItems(self,ItMw_1h_Pal_Sword,1);
		EquipItem(self,ItMw_1h_Pal_Sword);
	};
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_00");	//Nezasloužíš si být paladinem!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_01");	//Tvé chování dělá ostudu celému Řádu!
		AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_02");	//Myslím, že si o tom stejně promluvím s lordem Hagenem.
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_04");	//Tvé chování dělá ostudu celému Řádu!
		AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_05");	//Myslím, že si o tom stejně promluvím s lordem Hagenem.
	};
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_07");	//(vystrašeně) Cože? Ne, to přece není nutné! Jen to ne!
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_08");	//A proč bych to neměl dělat?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_09");	//Nedovedeš si představit, jaké to je, když tě vyhodí z Řádu!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_10");	//Celý můj život by pak byl nesnesitelný.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_11");	//Každý by mnou opovrhoval - a to je jen zlomek z toho, co by následovalo!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_12");	//Jestli chceš, můžu ti dát peníze. Hodně peněz!
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
	if((TELLABOUTDS == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running))
	{
		Info_AddChoice(dia_pal_187_melhior_paybackok,"Potřebuji informace.",dia_pal_187_melhior_paybackok_inform);
	};
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Podplácení ti nepomůže!",dia_pal_187_melhior_paybackok_gotcha);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Kolik mi dáš, když to na tebe neřeknu?",dia_pal_187_melhior_paybackok_money);
};

func void dia_pal_187_melhior_paybackok_money()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Money_01_00");	//Kolik mi dáš, když to na tebe neřeknu?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Money_01_01");	//Dám ti sto zlatých!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Money_01_02");	//Dohodneme se?
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Myslím, že jsem propásl šanci zjistit víc o Triramaru. Na Mora Ulartu můžu zapomenout.");
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"To nestačí!",dia_pal_187_melhior_paybackok_notok);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Dobrá, jsme dohodnuti.",dia_pal_187_melhior_paybackok_ok);
};

func void dia_pal_187_melhior_paybackok_notok()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_00");	//To má být vtip? To nestačí!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_02");	//Ale - to je vše, co mám!
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_04");	//Pak myslím, že lorda Hagena bude tvoje chování rozhodně zajímat.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_07");	//No dobře, ty hajzle, jak chceš!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_08");	//Ale uvědom si, že já se jen tak nedám!
	MELHIORPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pal_187_melhior_paybackok_ok()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_00");	//Dobrá, jsme dohodnuti.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_03");	//Díky Innosovi! Ještěže jsi s tím souhlasil!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_04");	//Tady, vezmi si moje peníze.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_05");	//A dám ti radu do budoucna - buď přestaň pít, nebo se alespoň nauč lépe schovávat!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_06");	//Ha-ha, jasně!
	AI_StopProcessInfos(self);
};

func void dia_pal_187_melhior_paybackok_gotcha()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_00");	//Podplácení ti nepomůže! Přijde si po tebe stráž!
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_01");	//Myslím, že lorda Hagena bude tvoje chování rozhodně zajímat.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_04");	//No dobře, ty hajzle, jak chceš!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_05");	//Ale uvědom si, že já se jen tak nedám!
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Myslím, že jsem propásl šanci zjistit víc o Triramaru. Na Mora Ulartu můžu zapomenout.");
	MELHIORPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pal_187_melhior_paybackok_inform()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_00");	//Potřebuji informace.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_01");	//Jasně! Co chceš vědět?
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_02");	//Zajímá mě osud jednoho amuletu.
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_03");	//A co vím, naposled ho měli paladinové.
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_04");	//Říká se mu amulet Triramar. Nevíš o něm náhodou něco?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_05");	//(zhrozeně) T-T-Triramar? Já... a-ano, slyšel jsem o něm.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_06");	//Ale nemůžu ti o něm nic říct! Je to posvátné tajemství.
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_08");	//Raději bys to měl rychle vysypat, jinak asi budu muset jít na malou přátelskou návštěvu za lordem Hagenem.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_11");	//Počkej... Dobře, povím ti, co vím.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_12");	//(neochotně) Vím, že ten amulet je na ostrově Etlu.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_14");	//Je to ostrov někde na jihu kontinentu, přesněji ti to říct nemůžu...
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_18");	//Řekni mi, jak se tam můžu dostat!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_25");	//Ehm, no, já jsem jednou... náhodou zaslechl, jak lord Hagen přikázal mágům z kláštera otevřít portál na Etlu.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_26");	//Vím, že to udělali, a že klíč... ehm... klíč k portálu má u sebe osobně lord Hagen.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_31");	//Jen tak mimochodem, proč jsi to vlastně chtěl vědět?
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Zjistil jsem, že amulet Triramar je uschován na ostrově Etlu. Jedinou cestou tam je magický portál tady na ostrově. Bohužel, jeho přesnou polohu jsem se od Melchiora nedověděl. Taky budu potřebovat klíč, kterým průchod k portálu otevřu. Ten bude mít asi lord Hagen osobně, což docela komplikuje situaci.");
	ETLUBEGINS = TRUE;
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Chci se o něm dozvědět víc informací.",dia_pal_187_melhior_paybackok_nothing);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Potřebuji ho.",dia_pal_187_melhior_paybackok_take);
};

func void dia_pal_187_melhior_paybackok_nothing()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Nothing_01_00");	//Chci se o něm dozvědět víc informací.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Nothing_01_02");	//(s úlevou) Aha... Skoro jsem myslel...
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Nothing_01_03");	//(přísně) Měl by ses zatím více kát za své činy!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Nothing_01_04");	//Co? No, ano. Samozřejmě.
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
};

func void dia_pal_187_melhior_paybackok_take()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Take_01_00");	//Potřebuji ho.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_01");	//Co-cože?! Triramar?!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_02");	//Ale vždyť ten amulet je čisté zlo! Kdo a nač by ho...
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_03");	//(zděšen) ... tys zaprodal svou duši Beliarovi?
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Take_01_04");	//Hej, klídek, neříkej takové hlouposti!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_05");	//Teď je mi to už vše jasné. Tvoje neodbytnost, tvé znalosti...
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_06");	//Tak tohle bych nikdy od paladina nečekal!
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_07");	//Tak tohle bych nikdy od domobránce nečekal!
	}
	else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_08");	//Tak tohle bych nikdy od mága nečekal!
	}
	else if((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_09");	//Co jiného by se dalo čekat od nějakého zhuleného kacíře!
	}
	else if(hero.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_10");	//Co jiného by se dalo čekat od nějakého nekromanta!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_11");	//Co jiného by se dalo od čekat nějakého žoldáka!
	};
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_12");	//U Innose, co jsem to jen udělal! Nikdy jsem ti tohle vše neměl říkat.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_13");	//Ale já své hříchy napravím! Napravím je i za cenu vlastního života!
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_14");	//Nikdy ten amulet nedostaneš, služebníku Beliara! Nikdy!
	MELHIORPISSOFFKILL = TRUE;
	self.aivar[AIV_DropDeadAndKill] = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_PAL_187_MELHIOR_FUCKOFF(C_Info)
{
	npc = pal_187_melhior;
	nr = 10;
	condition = dia_pal_187_melhior_fuckoff_condition;
	information = dia_pal_187_melhior_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_187_melhior_fuckoff_condition()
{
	if((MELHIORPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_FUCKOFFKILL(C_Info)
{
	npc = pal_187_melhior;
	nr = 10;
	condition = dia_pal_187_melhior_fuckoffkill_condition;
	information = dia_pal_187_melhior_fuckoffkill_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_187_melhior_fuckoffkill_condition()
{
	if(MELHIORPISSOFFKILL == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_fuckoffkill_info()
{
	B_Say(self,other,"$KillEnemy");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_PAL_187_MELHIOR_HOWTHINGS(C_Info)
{
	npc = pal_187_melhior;
	nr = 10;
	condition = dia_pal_187_melhior_howthings_condition;
	information = dia_pal_187_melhior_howthings_info;
	permanent = TRUE;
	description = "Je všechno v pořádku?";
};


func int dia_pal_187_melhior_howthings_condition()
{
	if((MELHIORPISSOFFKILL == FALSE) && (MELHIORPISSOFF == FALSE) && Npc_KnowsInfo(other,dia_pal_187_melhior_paybackok))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_howthings_info()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_HowThings_01_00");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_HowThings_01_01");	//Jo, všechno v pořádku.
};

