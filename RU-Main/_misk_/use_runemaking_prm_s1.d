
func void use_runemaking_prm_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Истинная магия");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны истинной магии и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Круг I");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Свет -");
		Doc_PrintLine(nDocID,0,"Золотая монета");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Магический взлом -");
		Doc_PrintLine(nDocID,0,"Отымчка");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Исцеление -");
		Doc_PrintLine(nDocID,0,"Лечебный корень");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Круг II");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Вызвать варга -");
		Doc_PrintLine(nDocID,0,"Шкура варга");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Очищающий свет -");
		Doc_PrintLine(nDocID,0,"Противоядие");
		Doc_PrintLine(nDocID,0,"Святая вода");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"- Уничтожение нежити -");
		Doc_PrintLine(nDocID,1,"Святая вода");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Круг III");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"- Прилив бодрости -");
		Doc_PrintLine(nDocID,1,"Серафис");
		Doc_PrintLine(nDocID,1,"Ледяной кварц");
		Doc_PrintLine(nDocID,1,"Болотник");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"- Призыв каменного голема -");
		Doc_PrintLine(nDocID,1,"Сердце каменного голема");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для изготовления руны необходимы ВСЕ указанные ингредиенты.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(READ_PRM_CIRCLE == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_PRM_CIRCLE = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;
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
		if((BookBonus_143 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_143 = TRUE;
		};
	};
};