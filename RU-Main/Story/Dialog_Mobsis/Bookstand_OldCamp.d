
func void Bookstand_Milten_03_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Слишком поздно.");
		Doc_PrintLines(nDocID,0,"С крушением старой шахты настроение рудного барона также сильно ухудшилось. ");
		Doc_PrintLines(nDocID,0,"Гомез словно бочка с порохом, которая стояла незадолго до взрыва.   ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Корристо");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Он думает, что этот новый парень виноват в крушении рудника. Этот человек действительно необычен. Но ему лучше больше не попадаться на глаза. ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Корристо");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Гомез очень гневный и я хочу узнать, что он спланировал. Мы обязательно должны уведомить мага воды, пока еще не слишком поздно. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Корристо");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Может быть у нас получится предотвратить катастрофу. Страшно подумать, что случилось бы, если он пойдет на свободную шахту. ");
		Doc_Show(nDocID);
	};
};

func void Bookstand_Milten_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Возможность позволила мне немного здесь обустроиться. Кто бы мог подумать, что я когда-нибудь стану единственным магом в лагере?");
		Doc_PrintLines(nDocID,0,"Ну, вообще-то мне нечего радоваться, что я вновь здесь оказался. Мне следовало бы отсюда поскорее смыться.");
		Doc_PrintLines(nDocID,0,"Эта экспедиция просто неудачна.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Рудокопы ушли вчера. Они взяли с собой Диего - и я не удивлюсь, если он сбежит. ");
		Doc_PrintLines(nDocID,1,"Диего даже не взял с собой кирку. ");
		Doc_PrintLines(nDocID,1,"Ну, это время я использую, чтобы усовершенствовать свое искусство алхимии. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Милтен");
		Doc_Show(nDocID);
	};
};

func void Bookstand_Milten_01_S1()
{
	var C_Npc her;
	var int Document;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		Document = Doc_CreateMap();
		Doc_SetPages(Document,1);
		Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
		Doc_Show(Document);
	};
};

func void Bookstand_Engor_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"То, что у вас найдено - никуда не годный материал, а именно:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"3 ящика старых материалов ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"8 ящиков ржавых железных материалов ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"4 ящика сломанного снаряжения ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"5 ящиков кожи и мехов (уже воняют!) ");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"2 ящика кирок ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"3 ящика инструментов ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"16 ящиков глыб горных пород (нет руды) ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"1 ящик с ржавыми ножами ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"4 ящика битой посуды ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"56 бочек воды ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"1 ящик болотных...- (все что было, все испорчено). ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Энгор");
		Doc_Show(nDocID);
	};
};

func void Bookstand_Avabul_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;

	her = Hlp_GetNpc(PC_Hero);

	if((PashalQuestPentaStep == TRUE) && (summonavabul_once == FALSE))
	{
		B_LogEntry(TOPIC_PashalQuest,"В глухом склепе я нашел старые записи неизвестного мне некроманта, касательно интересующего меня артефакта. Согласно этим записям, только один из слуг Белиара способен раскрыть мне его тайну! Вызвать его можно проведя ритуал, но для этого мне потребуется череп какого-нибудь очень могущественного демона.");
		summonavabul_once = TRUE;
	};
	if(BookstandAvabul == FALSE)
	{
		B_GivePlayerXP(250);
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;
		BookstandAvabul = TRUE;
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
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Теперь моя единственная надежда отыскать этот артефакт зависит от предстоящего ритуала...");
		Doc_PrintLines(nDocID,0,"Надеюсь, я смогу призвать в этот мир одного из слуг Белиара, который поможет мне ответить на мои вопросы.");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для ритуала мне потребуется череп могущественного демона, который я возложу на алтарь демонов. Без этого все будет напрасно!");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
	};
};