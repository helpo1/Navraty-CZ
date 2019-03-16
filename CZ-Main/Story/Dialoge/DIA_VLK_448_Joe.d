
instance DIA_Joe_EXIT(C_Info)
{
	npc = VLK_448_Joe;
	nr = 999;
	condition = DIA_Joe_EXIT_Condition;
	information = DIA_Joe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Joe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Joe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Joe_PICKPOCKET(C_Info)
{
	npc = VLK_448_Joe;
	nr = 900;
	condition = DIA_Joe_PICKPOCKET_Condition;
	information = DIA_Joe_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Joe_PICKPOCKET_Condition()
{
	return C_Beklauen(25,25);
};

func void DIA_Joe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
	Info_AddChoice(DIA_Joe_PICKPOCKET,Dialog_Back,DIA_Joe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Joe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Joe_PICKPOCKET_DoIt);
};

func void DIA_Joe_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,30);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Joe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
};


instance DIA_Joe_Hallo(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Hallo_Condition;
	information = DIA_Joe_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Joe_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Joe_Hallo_Info()
{
	AI_Output(self,other,"DIA_Joe_Hallo_10_00");	//Hej, díky, chlape, vážně děkuju. Už jsem si myslel, že se odsud nikdy nedostanu.
	TOPIC_END_Joe = TRUE;
	B_GivePlayerXP(XP_Ambient * 4);
	AI_Output(other,self,"DIA_Joe_Hallo_15_01");	//Co TADY děláš?
	AI_Output(self,other,"DIA_Joe_Hallo_10_02");	//Jsem tu zamčenej. Ty dveře byly otevřený a já se tu jen chtěl trochu porozhlídnout - ale jakmile jsem vlez dovnitř, přišel strážce a ty zatracený dveře zamknul.
	AI_Output(self,other,"DIA_Joe_Hallo_10_03");	//Je to fakt trapas - byl bych ti vděčnej, kdyby to zůstalo jen mezi náma.
	AI_Output(other,self,"DIA_Joe_Hallo_15_04");	//Rozumím. Vážně to není nic příjemnýho.
	AI_Output(self,other,"DIA_Joe_Hallo_10_05");	//Mám dojem, že potřebuju panáka.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Joe_Perm(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Perm_Condition;
	information = DIA_Joe_Perm_Info;
	permanent = TRUE;
	description = "Je všechno v pořádku?";
};


func int DIA_Joe_Perm_Condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Joe_Perm_Info()
{
	AI_Output(other,self,"DIA_Joe_Perm_15_00");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Joe_Perm_10_01");	//Díky, žes mě z toho dostal.
	AI_StopProcessInfos(self);
};


instance DIA_Joe_Sign(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Sign_Condition;
	information = DIA_Joe_Sign_Info;
	permanent = FALSE;
	description = "(předvést zlodějský signál)";
};


func int DIA_Joe_Sign_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500) && (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Joe_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Joe_Sign_10_00");	//Hej, co ty víš - možná máme společný přátele. V tom případě mi dovol vyjádřit svou vděčnost za svoji záchranu.
	AI_Output(self,other,"DIA_Joe_Sign_10_01");	//Tady, vezmi si tyhle paklíče - jsem si jistý, že se ti budou hodit.
	B_GiveInvItems(self,other,ItKE_lockpick,5);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	AI_StopProcessInfos(self);
};


instance DIA_JOE_INPRISOIN(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = dia_joe_inprisoin_condition;
	information = dia_joe_inprisoin_info;
	permanent = TRUE;
	description = "Řekni mi jak je to s tím prstenem.";
};


func int dia_joe_inprisoin_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (CORAGONTELLJO == TRUE) && (JOTELLSGASPAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_joe_inprisoin_info()
{
	AI_Output(other,self,"DIA_Joe_InPrisoin_01_00");	//Řekni mi jak je to s tím prstenem.
	AI_Output(self,other,"DIA_Joe_InPrisoin_01_01");	//Jakým prstenem?!
	if(Npc_HasItems(other,itri_hakonmissring) >= 1)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_02");	//Tady tím. Už víš?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_03");	//No, dal jsem ho Coragonovi za chlast.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_04");	//Co na tom?!
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_05");	//Zatím nic. Nechceš mi ale povědět odkud ho máš?!
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_06");	//... (nervózně) Našel jsem ho.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_07");	//Lžeš! Nechceš raději mluvit pravdu?!
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_08");	//Ale to je pravda! Přísahám!
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_09");	//Poslouchej chlape, tenhle prsten někdo ukradl jednomu obchodníkovi.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_10");	//A jestli o tom něco víš, tak mi to řekneš, jinak to jednoduše nahlásím domobraně.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_12");	//A to by tě mohlo velmi bolet...
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_13");	//Ale já jsem nic nečmajz... (nervózně) čestný slovo! Ten prsten jsem neukrad já!
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_14");	//A kdo tedy, když ty ne?!
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_15");	//No dobře, tak ti to řeknu...
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_16");	//Dal mi ho obchodník jménem Gaspar.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_97");	//A za co?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_18");	//Udělal jsem mu jednu službu...
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_19");	//A co jsi pro něj udělal?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_20");	//Potřeboval se dostat do hotelu, ale nechtěl, aby to Hanna věděla.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_21");	//Říkal, že to má být překvapení.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_22");	//Takže se mě zeptal, jestli ji nezabavím konverzaci.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_23");	//Slíbil, že dobře zaplatí.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_25");	//Tak jsem udělal vše co chtěl a on mi dal ten prsten.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_26");	//Můžeš to zopakovat v přítomnosti lorda Andreho?!
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_27");	//Co?!... Ale ty jsi mi něco slíbil!
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_28");	//Nerozuměl jsi mi. Slíbil jsem, že tě nedám domobraně.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_29");	//Potřebuji svědka, abych mohl Gaspara obvinit z krádeže. Rozumíš?!
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_30");	//No... Tak jo, udělám to.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_31");	//Paráda! A neboj, nezatknou tě! Ale musíš mi pomoct.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_33");	//Chápu, spolehni se!
		JOTELLSGASPAR = TRUE;
		B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Mluvil jsem s Joem a vše mi řekl. Gaspar mu dal prsten za to, že zabavil Hannu, když se vkradl dovnitř. Joe mi slíbil, že mi pomůže, takže bych měl jít za Andrem.");
	}
	else
	{
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_35");	//Takže co?!
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_36");	//Nechápu o co jde chlape.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_37");	//Nemám žádný prsten.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_38");	//Asi si mě s někým pleteš, takže mě nech být.
		AI_StopProcessInfos(self);
	};
};

