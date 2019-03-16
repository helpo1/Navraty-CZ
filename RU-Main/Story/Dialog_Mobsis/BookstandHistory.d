
var int History_1_permanent;
var int History_2_permanent;
var int History_3_permanent;

func void Use_BookstandHistory1_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Путь борьбы ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Блок мечом - лучшая защита против удара меча человека. Бессмысленно ставить блоки против зверей или монстров.");
		Doc_PrintLines(nDocID,0,"Более выгодным является держать противника на дистанции и разработать комбинацию из нескольких ударов.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Комбинации из нескольких ударов могут быть выполнены опытными бойцами. И тот, кто обладает мастерством в борьбе, также может выполнять дальнейшие комбинации.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_1_permanent == FALSE)
		{
			B_RaiseFightTalent_Bonus(self,NPC_TALENT_1H,1);
			AI_Print(PRINT_Learn1H);
			History_1_permanent = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_93 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_93 = TRUE;
		};
	};
};

func void Use_BookstandHistory2_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Остров");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Портовый город Хоринис расположен на острове недалеко от морского берега королевства Миртана.");
		Doc_PrintLines(nDocID,0,"Остров известен, прежде всего, благодаря своей рудниковой долине. На протяжении многих лет через все долину простирался магический барьер и все заключенные королевства отправлялись туда.");
		Doc_PrintLines(nDocID,0,"Так долина стала исправительной колонией для многих приговоренных, которые глубоко под землей добывали магическую руду. ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Кроме того, на острове есть несколько крестьянских усадьб, которые обрабатывают почву для выращивания пшеницы и свеклы, а также выращивают овец. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"На протяжении многих поколений самый большой двор принадлежит помещику, который сдает в аренду другим крестьянам близлежащие земли. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Посреди острова стоит старый монастырь. Монастырь Инноса, которым управляют маги огня. Там они проводят магические и алхимические исследования и изготавливают вино.");
		Doc_Show(nDocID);
		if(History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_2_permanent = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_94 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_94 = TRUE;
		};
	};
};

func void Use_BookstandHistory3_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Закон острова");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Всюду, где собираются люди, общинная жизнь должна быть урегулирована. Будь то монастырь, город или во двор помещика. ");
		Doc_PrintLines(nDocID,0,"Любое преступление против общины наказуемо. ");
		Doc_PrintLines(nDocID,0,"Согласно законам общины запрещены любые нападения или участие в таковых. ");
		Doc_PrintLines(nDocID,0,"Кража также является проступком, который не остается безнаказанным. Под защитой закона пребывает священное животное - овца.  ");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Кто убил человека, должен знать, что и он будет убит.");
		Doc_PrintLines(nDocID,1,"А кто содействовал этому, должен будет заплатить высокий штраф. ");
		Doc_PrintLines(nDocID,1,"Во всех высших управлениях правом управляют мужчины. В их ведомстве все происходящие события и они налагают наказания и штрафы, которые должны восстановить мир и справедливость. ");
		Doc_PrintLines(nDocID,1,"Тот, кто стал жертвой проступка или может засвидетельствовать таковой - не должен молчать.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_3_permanent = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_95 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_95 = TRUE;
		};
	};
};