class oCInfoChoice
{
    var string Text    ;   //zSTRING 
    var int Function;      //int     //индекс символа    
};

//----------------------------------
//  oCInfo
//----------------------------------

/* ВНИМАНИЕ!!!

В отличие от C_NPC и C_ITEM, C_INFO указывает 
НЕ на увеличенную область памяти, а просто на себя.
То, что возвращает MEM_InstGetOffset, применительно к C_INFO
возвращают НЕ адрес ограничивающего объект oCInfo, 
а адрес содержащегося в нем C_INFO.
Чтобы получить oCInfo, нужно вычесть 4 + 4 + 20 = 28 байт! */

const int oCInfo_C_INFO_Offset = 28;

class oCInfo {
    //Внимание: Только "name" и "told" попадают в сохранение!
    
    var int _vtbl;                  //таблица методов

    var int next;                   //oCInfo*
    var string name;                //zSTRING

    //Известно:
    //struct Tpd {
        var int npc         ;       //int
        var int nr          ;       //int
        var int important   ;       //zBOOL   
        var int conditions  ;       //int   
        var int information ;       //int   
        var string description ;       //zSTRING
        var int trade       ;       //zBOOL   
        var int permanent   ;       //zBOOL   
    //} pd;

    var int told        ;           //zBOOL  //уже произнесен (то, что возвращает Npc_KnowsInfo)
    var int _instance   ;           //int    //индекс символа oCInfo в парсере.
    
    //Варианты выбора:
    //zCList< oCInfoChoice > listChoices;
        var int listChoices_data;   //oCInfoChoice*
        var int listChoices_next;   //zCList< oCInfoChoice >*
};

class oCInfoManager {
    var int _vtbl;                  //Указатель на таблицу методов                                           
    
    //Список всех oCInfos. Отсортирован по ...? Вам придется сами проверить.
    //zCListSort< oCInfo > infoList;    
        var int infoList_compare;   //int (*Compare)(oCInfo *ele1,oCInfo *ele2);
        var int infoList_data;      //oCInfo*
        var int infoList_next;      //zCListSort< oCInfo >*
        
    //Парсер.
    var int p;                      //zCParser*
};

class oCInformationManager 
{
    /*
    typedef
    enum zEInformationManagerMode
    {
        INFO_MGR_MODE_IMPORTANT ,
        INFO_MGR_MODE_INFO      ,
        INFO_MGR_MODE_CHOICE    ,
        INFO_MGR_MODE_TRADE
    }
    zTInfoMgrMode; */

    var string LastMethod           ;  //zSTRING                         
    var int DlgStatus               ;  //zCViewDialogChoice*    //это View. Вероятно, просто отображение на экране
    var int DlgTrade                ;  //oCViewDialogTrade*     //это View. Вероятно, просто отображение на экране
    var int DlgChoice               ;  //zCViewDialogChoice*    //это View. Вероятно, просто отображение на экране
    var int Npc                     ;  //oCNpc*                       
    var int Player                  ;  //oCNpc*                       
    var int Info                    ;  //oCInfo*                         
    var int IsDone                  ;  //zBOOL                //== InfoManager_HasFinished         
    var int IsWaitingForEnd         ;  //zBOOL                         
    var int IsWaitingForScript      ;  //zBOOL                         
    var int IsWaitingForOpen        ;  //zBOOL                         
    var int IsWaitingForClose       ;  //zBOOL                         
    var int IsWaitingForSelection   ;  //zBOOL                         
    var int MustOpen                ;  //zBOOL                         
    var int IndexBye                ;  //int                                
    var int ImportantCurrent        ;  //int                                
    var int ImportantMax            ;  //int                                
    var int Mode                    ;  //zTInfoMgrMode           
};