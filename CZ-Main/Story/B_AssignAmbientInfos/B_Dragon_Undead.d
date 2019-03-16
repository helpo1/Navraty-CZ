instance DIA_Dragon_Undead_Hello(C_Info)
{
	npc = Dragon_Undead;
	nr = 5;
	condition = DIA_Dragon_Undead_Hello_Condition;
	information = DIA_Dragon_Undead_Hello_Info;
	important = TRUE;
};

func int DIA_Dragon_Undead_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Undead_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_00");	//Takže jsi mě dokázal najít. Na tvůj příchod jsem čekal velmi dlouhou dobu.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_15_01");	//Ale no tak, přestaň s těmi plány.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_02");	//(hlasitý smích) Co ty o nich víš?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_03");	//Nebyli to snad Pátrači, kdo tě přivedl k mé existenci?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_04");	//Nenechával jsem ti o ní důkazy tak jasné, že jsi je nemohl minout?

	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_05");	//A nepřispěla snad dračí vejce k vylepšení tvé zbroje, takže ses sem mohl snadněji dostat?
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_06");	//Nebyli snad znovuzrození paladinové dostatečným důvodem, abys začal pátrat po skryté moci v pozadí?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_07");	//Nebylo snad prokletí tvého rodu dostatečným důvodem, abys začal pátrat po skryté síle v pozadí?
	};

	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_08");	//Ať se budeš vykrucovat, jak chceš, tohle všechno popřít nemůžeš.
	B_LogEntry(TOPIC_HallenVonIrdorath,"Můj úhlavní nepřítel - Nemrtvý drak kterého si vyvolil Beliar musí pryč z tohohle světa!");

	if(ItarIsDead == FALSE)
	{
		Wld_InsertNpc(ItarMinion,"DRT_BOSS_01");
		B_KillNpc(Draconian_Elite_Boss);
	};
	if(YelaIsDead == FALSE)
	{
		Wld_InsertNpc(YelaMinion,"DRT_BOSS_02");
		B_KillNpc(UndeadWolf);
	};
	if((ItarIsDead == FALSE) || (YelaIsDead == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);

		if(ItarIsDead == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",ItarMinion,ItarMinion,0,0,0,FALSE);
		};
		if(YelaIsDead == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",YelaMinion,YelaMinion,0,0,0,FALSE);
		};
	};

	Info_ClearChoices(DIA_Dragon_Undead_Hello);
	Info_AddChoice(DIA_Dragon_Undead_Hello,Dialog_Ende,DIA_Dragon_Undead_Hello_attack);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"Jménem koho vedeš své tažení proti lidstvu?",DIA_Dragon_Undead_Hello_Auftraggeber);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"Proč jsi tady?",DIA_Dragon_Undead_Hello_warum);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"Kdo jsi?",DIA_Dragon_Undead_Hello_wer);
};

func void DIA_Dragon_Undead_Hello_wer()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_01");	//(smích) Ještě pořád se na to musíš ptát? Zeptej se sám sebe, ty hlupáku. Víš, kdo jsem.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_03");	//Můj stvořitel mi dal božskou moc. Stejně jako ty v sobě nosíš moc svého boha.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_04");	//Mým osudem je zničení světa.

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_05");	//Stejně jako je tvůj osud předurčen bezúhonností a poctivostí paladinů.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_06");	//Stejně jako tvá ruka přináší jistou smrt, drakobijče.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_07");	//Stejně jako je tvým údělem kázat Innosovo učení, mágu Ohně.
	};

	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_08");	//Necítíš to pouto, co nás spolu pojí? Ano, ty víš, kdo jsem.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_09");	//(rozzlobeně) Ne. To nemůže být pravda. Xardas vždycky říkal...
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_10");	//Xardas je slabý a ty pro mě nepředstavuješ žádnou hrozbu. Pro tebe je ctí, že ses se mnou mohl vůbec setkat.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_11");	//Tak stojí psáno. Nadešel čas přijmout svůj osud.
};

func void DIA_Dragon_Undead_Hello_warum()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_warum_15_00");	//Odkud jsi?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_01");	//Božství, jež mi bylo propůjčeno, mě podnítilo k tomu, abych tento svět utopil v řece násilí.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_02");	//Jedině tehdy, až poslední pevnost poctivých padne, si budu moci odpočinout.
};

func void DIA_Dragon_Undead_Hello_Auftraggeber()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_Auftraggeber_15_00");	//Jménem koho vedeš své tažení proti lidstvu?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_01");	//Mým pánem je samotná Tma. Znáš ji. Slyšíš její volání.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_03");	//Má vojska povstanou v jejím jménu a zahalí svět do temnoty.
};

func void DIA_Dragon_Undead_Hello_attack()
{
	AI_PlayAni(self,"T_WARN");
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_02");	//Tvé kosti mi poslouží k tomu, abych mohl nechat vát zhoubný vítr smrti nad povrchem celého světa.

	if(ItarIsDead == FALSE)
	{
		B_KillNpc_Fire(ItarMinion);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + 150;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20000;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(YelaIsDead == FALSE)
	{
		B_KillNpc_Fire(YelaMinion);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + 150;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20000;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};	
	if((ItarIsDead == FALSE) || (YelaIsDead == FALSE))
	{
		Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_01");	//Ještě nejsi připraven na to mě porazit. Od cíle tě odděluje skutečně hodně.
	};

	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};