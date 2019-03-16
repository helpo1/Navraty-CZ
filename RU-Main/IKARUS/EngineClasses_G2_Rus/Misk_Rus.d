//--------------------------------------
// Узел / Лист. Для Vobtree
//--------------------------------------

//template <class T> //NS: шаблон для класса T (можно использовать любой класс)
class zCTree {
    var int parent;            //zCTree* 
    var int firstChild;        //zCTree* 
    var int next;              //zCTree* 
    var int prev;              //zCTree* 
    var int data;              //T*
};

//--------------------------------------
// Списки, массивы. Часто используются.
//--------------------------------------

const int sizeof_zCArray = 12;

/* zCArray является очень простой, но очень важной структурой данных. */

//template <class T>
class zCArray {
    var int array;              //T*        //Указатель на область памяти
    var int numAlloc;           //int       //На сколько элементов выделить память?
    var int numInArray;         //int       //Сколько элементов реально хранится
};

//template <class T> 
class zCArraySort {
    var int array;              //T*
    var int numAlloc;           //int
    var int numInArray;         //int
    var int compare;            //int (*Compare)(const T* ele1,const T* ele2); //NS: функция для сравнения двух элементов
};

//template <class T>
class zList {
    var int compare;            //int (*Compare)(const T* ele1,const T* ele2);
    var int count;              //Количество элементов
    var int last;               //T*
    var int wurzel;             //T*
};

//template <class T> 
class zCList {
    var int data;               //T*
    var int next;               //zCList<T>*
};

//template <class T> 
class zCListSort {
    var int compareFunc;        //int (*Compare)(T *ele1,T *ele2);
    var int data;               //T*
    var int next;               //zCListSort<T>*
};

//zMAT4
class zMAT4 {
    /* Матрица имеет следующий вид:
     *
     *  x1  y1  z1  p1
     *  x2  y2  z2  p2
     *  x3  y3  z3  p3
     *
     * Здесь x, y, z являются единичными векторами преобразования координат.
     * Проще говоря: x, y, z - это три вектора, которые можно увидеть, 
     * если выделить VOB (обычно вектор y направлен вверх).
     * Если (a1, a2, a3) - координаты точки в локальной системе Vob'а,
     * и M - матрица преобразования координат Vob'а в мировые координаты,
     * то координаты точки в мировой системе = M * (a1, a2, a3, 1)^T.
     * ("^T" означает транспонирование, т.е. вектор является столбцом).
     * Четвертая строка матрицы не используется. */
	//NS: последний столбец - координаты самого Vob'а в мире
    
    /* Построчно */
    var int v0[4]; //zREAL[4]
    var int v1[4]; //zREAL[4]
    var int v2[4]; //zREAL[4]
    var int v3[4]; //zREAL[4]
};

//другая запись, все числа в одном массиве:
class zMATRIX4 {
    var int trafo[16]; //zREAL[16]
};

//------------------------------------------------
//  zTPlane: Плоскость в пространстве
//------------------------------------------------

class zTPlane 
{
    var int distance;    //zREAL    //вероятно, расстояние до начала координат (а что еще?)
    var int normal[3];   //zPOINT3  //вектор нормалей
};

//------------------------------------------------
//  zCPolygon
//------------------------------------------------

/* Значения для zCPolygon.portalPoly:

    enum zTPortalType   { zPORTAL_TYPE_NONE         = 0, 
                          zPORTAL_TYPE_SMALL        = 1, 
                          zPORTAL_TYPE_BIG          = 2, 
                          zPORTAL_TYPE_BIG_NOFADE   = 3 
                        };
*/
const int zCPolygon_bitfield_polyNumVert            = ((1 <<  8) - 1) <<  0;
const int zCPolygon_bitfield_portalPoly             = ((1 <<  2) - 1) <<  8;
const int zCPolygon_bitfield_occluder               = ((1 <<  1) - 1) << 10;
const int zCPolygon_bitfield_sectorPoly             = ((1 <<  1) - 1) << 11;
const int zCPolygon_bitfield_mustRelight            = ((1 <<  1) - 1) << 12;
const int zCPolygon_bitfield_portalIndoorOutdoor    = ((1 <<  1) - 1) << 13;
const int zCPolygon_bitfield_ghostOccluder          = ((1 <<  1) - 1) << 14;
const int zCPolygon_bitfield_noDynLightNear         = ((1 <<  1) - 1) << 15;
const int zCPolygon_bitfield_sectorIndex            = ((1 << 16) - 1) << 16; //только для indoor

class zCVertFeature {
    var int vertNormal[3];    //zPOINT3
	var int lightStat;        //zCOLOR	
	var int lightDyn;         //zCOLOR	
	var int texu;             //zVALUE	
    var int texv;             //zVALUE 
};

class zCPolygon 
{
/*0x0000*/    var int vertex;                 //zCVertex** //массив
/*0x0004*/    var int lastTimeDrawn;          //int
    
              //zTPlane               polyPlane;
/*0x0008*/        var int polyPlane_distance;     //zREAL
/*0x000C*/        var int polyPlane_normal[3];    //zVEC3
    
/*0x0018*/    var int material;               //zCMaterial*
/*0x001C*/    var int lightmap;               //zCLightMap*

/*0x0020*/    var int clipVert;               //zCVertex      **    
/*0x0024*/    var int clipFeat;               //zCVertFeature **
/*0x0028*/    var int numClipVert;            //int

/*0x002C*/    var int feature;                //zCVertFeature ** //массив
/*0x0030*/    var int bitfield;
};

class zCMaterial {
    //zCObject {
      var int    _vtbl;
      var int    _zCObject_refCtr;
      var int    _zCObject_hashIndex;
      var int    _zCObject_hashNext;
      var string _zCObject_objectName;

	//zCArray<zCPolygon*>		polyList;
        var int polyList_array;         //zCPolygon**
        var int polyList_numAlloc;      //int
        var int polyList_numInArray;    //int
        
    var int polyListTimeStamp;          //zDWORD		
	var int texture;                    //zCTexture*	
	var int color;						//zCOLOR		
	var int smoothAngle;                //zREAL		
	var int matGroup;                   //zTMat_Group	
	var int bspSectorFront;			    //zCBspSector*	 //outdoor
	var int bspSectorBack;				//zCBspSector*	 //outdoor
	var int texAniCtrl;                 //zCTexAniCtrl
	var int detailObjectVisualName;     //zSTRING*		

	var int kambient;                        //zREAL
    var int kdiffuse;                        //zREAL
    
    var int m_bEnvironmentalMappingStrength; //zREAL
    
    var int bitfield[7]; //???
    
    /*
		zUINT8				 smooth					: 1;
		zUINT8				 dontUseLightmaps		: 1;
		zUINT8				 texAniMap				: 1;
		zUINT8				 lodDontCollapse		: 1;
		zUINT8				 noCollDet				: 1;
		zUINT8				 forceOccluder			: 1;
		zUINT8				 m_bEnvironmentalMapping: 1;
		zUINT8				 polyListNeedsSort		: 1;
		zUINT8				 matUsage				: 8;
		zUINT8				 libFlag				: 8;
		zTRnd_AlphaBlendFunc rndAlphaBlendFunc		: 8;
		zUINT8				 m_bIgnoreSun			: 1;
	*/
	                                       
	var int m_enuWaveMode;                   //zTWaveAniMode	
	var int m_enuWaveSpeed;                  //zTFFT			
	var int m_fWaveMaxAmplitude;             //float			
	var int m_fWaveGridSize;                 //float			
                                           
	var int detailTexture;                   //zCTexture*                  
	var int detailTextureScale;              //zREAL		                    
	var int texAniMapDelta[2];               //zPOINT2		                
                                           
	var int default_mapping[2];              //zPOINT2		                    
	var int texScale[2];                     //zPOINT2		                        
};

class zTPortalInfo {
	var int visible;        //zBYTE
	var int alpha;          //zBYTE
};

class zCBspSector {
	var string sectorName;             //zSTRING
	
    //zCArray<zCBspBase*>				sectorNodes;
        var int sectorNodes_array;        //zCBspBase**
        var int sectorNodes_numAlloc;    //int
        var int sectorNodes_numInArray;  //int
        
	var int sectorIndex;		        //zDWORD
    
	//zCArray<zCPolygon*>				sectorPortals;
        var int sectorPortals_array;        //zCPolygon**
        var int sectorPortals_numAlloc;    //int
        var int sectorPortals_numInArray;  //int
    
	//zCArray<zTPortalInfo>			sectorPortalInfo;
        var int sectorPortalInfo_array;      //zTPortalInfo*
        var int sectorPortalInfo_numAlloc;  //int
        var int sectorPortalInfo_numInArray;//int
    
	var int activated;          //zTFrameCtr	
	var int rendered;           //zTFrameCtr	
	//zTBBox2D	 activePortal;
        var int mins[2];                //zVEC2
        var int maxs[2];                //zVEC2
	var int sectorCenter[3];	//zVEC3
	var int hasBigNoFade;		//zBOOL8	
};

//--------------------------------------
// Boundingbox
//--------------------------------------

class zTBBox3D {
	var int mins[3]; //zPOINT3	
	var int maxs[3]; //zPOINT3
};

//--------------------------------------
// Порталы
//--------------------------------------

class oCPortalRoom {
    var string portalName;    //zSTRING 
    var string ownerNpc;      //zSTRING 
    var int ownerGuild;    //int           
};

class oCPortalRoomManager {
    var int oldPlayerPortal;    //zSTRING*      
    var int curPlayerPortal;    //zSTRING*      
    var int oldPlayerRoom;      //oCPortalRoom*
    var int curPlayerRoom;      //oCPortalRoom*

    //zCArraySort <oCPortalRoom*> portals;
        var int portals_array;      //oCPortalRoom**
        var int portals_numAlloc;   //int
        var int portals_numInArray; //int
        var int portals_compare;    //int (*Compare)(const oCPortalRoom* ele1,const oCPortalRoom* ele2); //сортирует по именам порталов.
};

//--------------------------------------
// Таймер (техническая и игровая реализация)
//--------------------------------------

class zCTimer {
    var int factorMotion;        //zREAL        //не должно быть слишком маленьким. Иначе: замораживает высокий Framerate!
    var int frameTimeFloat;      //zREAL [msec] //время между текущим и последним кадром, мс
    var int totalTimeFloat;      //zREAL [msec] //общее время, мс
    var int frameTimeFloatSecs;  //zREAL  [s]	//то же в сек.
    var int totalTimeFloatSecs;  //zREAL  [s]	//то же в сек.
    var int lastTimer;           //zDWORD
    var int frameTime;           //zDWORD [msec] /как целове число
    var int totalTime;           //zDWORD [msec]
    var int minFrameTime;        //zDWORD       //от "заморозки". Иначе частота кадров округляется до 0 и ничего не движется
          
    var int forcedMaxFrameTime;  //zDWORD //кадр не может длиться больше этой величины (по времени). Чтобы избежать больших скачков во времени для объектов? Во всяком случае, вроде того, что игра будет замедляться, если она не совпадает с рендерингом.
};

const int oCWorldTimer_TicksPerHour		  = 250000;
const int oCWorldTimer_TicksPerMin_approx = 4167; //< 1 сек / день недопустимо

class oCWorldTimer {
    //250000 тактов (тиков) в час
    var int worldTime;    //zREAL   
    var int day;          //int      
};

//--------------------------------------
// Spawnmanager
//--------------------------------------

/* Довольно бесполезный класс, 
 * но следующие три статических переменных очень интересны:

     SPAWN_INSERTTIME_MAX_Address
     SPAWN_INSERTRANGE_Address   
     SPAWN_REMOVERANGE_Address   

 * Они объявлены в Ikarus_Const.d */

class oTSpawnNode {
    var int npc;         //oCNpc *
    var int spawnPos[3]; //zVEC3
    var int timer;       //zREAL
};

class oCSpawnManager {
    //zCArray<oTSpawnNode*> spawnList;
        var int spawnList_array;        //oTSpawnNode**
        var int spawnList_numAlloc;     //int
        var int spawnList_numInArray;   //int
        
    var int spawningEnabled;        //zBOOL
    var int camPos[3];              //zVEC3
    var int insertTime;             //zREAL //Время задержки Spawnmanager'а (из соображений производительности)

    var int spawnFlags; //были времена, когда не было защиты от копирования, и злобным пиратам приходилось бороться с ветхими бессмертными флагами. устарело.
};

//--------------------------------------
// zCOLOR (цвет)
//--------------------------------------

const int zCOLOR_CHANNEL     = (1 << 8) - 1;
const int zCOLOR_SHIFT_RED   = 16;
const int zCOLOR_SHIFT_GREEN = 8;
const int zCOLOR_SHIFT_BLUE  = 0;
const int zCOLOR_SHIFT_ALPHA = 24;

const int zCOLOR_RED   = zCOLOR_CHANNEL << zCOLOR_SHIFT_RED;
const int zCOLOR_GREEN = zCOLOR_CHANNEL << zCOLOR_SHIFT_GREEN;
const int zCOLOR_BLUE  = zCOLOR_CHANNEL << zCOLOR_SHIFT_BLUE;
const int zCOLOR_ALPHA = zCOLOR_CHANNEL << zCOLOR_SHIFT_ALPHA;

//--------------------------------------
// Освещение
//--------------------------------------
const int zCVobLight_bitfield_isStatic       = ((1 << 1) - 1) <<  0;
const int zCVobLight_bitfield_rangeAniSmooth = ((1 << 1) - 1) <<  1;
const int zCVobLight_bitfield_rangeAniLoop   = ((1 << 1) - 1) <<  2;
const int zCVobLight_bitfield_colorAniSmooth = ((1 << 1) - 1) <<  3;
const int zCVobLight_bitfield_colorAniLoop   = ((1 << 1) - 1) <<  4;
const int zCVobLight_bitfield_isTurnedOn     = ((1 << 1) - 1) <<  5;
const int zCVobLight_bitfield_lightQuality   = ((1 << 4) - 1) <<  6;
const int zCVobLight_bitfield_lightType      = ((1 << 4) - 1) << 10;
const int zCVobLight_bitfield_m_bCanMove     = ((1 << 1) - 1) << 14;

const int zCVobLight_lightData_colorAniList_array_offset = 300; //0x12C

class zCVobLight {
    //zCVob {
      //zCObject {
      var int    _vtbl;
      var int    _zCObject_refCtr;
      var int    _zCObject_hashIndex;
      var int    _zCObject_hashNext;
      var string _zCObject_objectName;
      //}
      var int    _zCVob_globalVobTreeNode;
      var int    _zCVob_lastTimeDrawn;
      var int    _zCVob_lastTimeCollected;
      var int    _zCVob_vobLeafList_array;
      var int    _zCVob_vobLeafList_numAlloc;
      var int    _zCVob_vobLeafList_numInArray;
      var int    _zCVob_trafoObjToWorld[16];
      var int    _zCVob_bbox3D_mins[3];
      var int    _zCVob_bbox3D_maxs[3];
      var int    _zCVob_bsphere3D_center[3];
      var int    _zCVob_bsphere3D_radius;
      var int    _zCVob_touchVobList_array;
      var int    _zCVob_touchVobList_numAlloc;
      var int    _zCVob_touchVobList_numInArray;
      var int    _zCVob_type;
      var int    _zCVob_groundShadowSizePacked;
      var int    _zCVob_homeWorld;
      var int    _zCVob_groundPoly;
      var int    _zCVob_callback_ai;
      var int    _zCVob_trafo;
      var int    _zCVob_visual;
      var int    _zCVob_visualAlpha;
      var int    _zCVob_m_fVobFarClipZScale;
      var int    _zCVob_m_AniMode;
      var int    _zCVob_m_aniModeStrength;
      var int    _zCVob_m_zBias;
      var int    _zCVob_rigidBody;
      var int    _zCVob_lightColorStat;
      var int    _zCVob_lightColorDyn;
      var int    _zCVob_lightDirectionStat[3];
      var int    _zCVob_vobPresetName;
      var int    _zCVob_eventManager;
      var int    _zCVob_nextOnTimer;
      var int    _zCVob_bitfield[5];
      var int    _zCVob_m_poCollisionObjectClass;
      var int    _zCVob_m_poCollisionObject;
    
	//VOB источника света может иметь различные цвета и диапазон освещения.
    //Кроме того, есть анимированные источники!
    
             //zCVobLightData    lightData;
                 //zCArray<zVALUE>       rangeAniScaleList; //zREAL ~ zVALUE
/*0x120*/            var int lightData_rangeAniScaleList_array;      //zVALUE*
/*0x124*/            var int lightData_rangeAniScaleList_numAlloc;   //int
/*0x128*/            var int lightData_rangeAniScaleList_numInArray; //int
         
                 //zCArray<zCOLOR>       colorAniList;
/*0x12C*/            var int lightData_colorAniList_array;           //zCOLOR*
/*0x130*/            var int lightData_colorAniList_numAlloc;        //int
/*0x134*/            var int lightData_colorAniList_numInArray;      //int
                 
/*0x138*/        var int lensFlareFXNo;                              //int                  
/*0x13C*/        var int lensFlareFX;                                //zCLensFlareFX*
                 
/*0x140*/        var int lightColor;                                 //zCOLOR //Альфа-канал не учитывается
/*0x144*/        var int range;                                      //zVALUE
/*0x148*/        var int rangeInv;                                   //zVALUE
/*0x14C*/        var int rangeBackup;                                //zVALUE
                 
                 //Данные для анимации источника
                 //Задает диапазон анимации
/*0x150*/        var int rangeAniActFrame;                           //zVALUE
/*0x154*/        var int rangeAniFPS;                                //zVALUE
                 
                 //Задает цвет анимации
/*0x158*/        var int colorAniActFrame;                           //zVALUE                
/*0x15C*/        var int colorAniFPS;                                //zVALUE                
                 
                 // направленный свет? Я не знаю про такую возможность.
/*0x160*/        var int spotConeAngleDeg;                           //zREAL
                 
                 //Флаги объявлены выше
/*0x164*/        var int bitfield;
        
    
             //zTRayTurboValMap<zCPolygon*, int>affectedPolyMap;
                 /*
                 struct zSNode                                   
                 {                                               
                     KEY             m_Key       ;               
                     ELEMENT         m_Element   ;               
                     unsigned long   m_u32Hash   ;               
                     zSNode*         m_pNext     ;               
                 }; */
                 //zCArray<zSNode*>              m_arrNodes;
/*0x168*/            var int affectedPolyMap_m_arrNodes_array;       //zSNode**
/*0x16C*/            var int affectedPolyMap_m_arrNodes_numAlloc;    //int
/*0x170*/            var int affectedPolyMap_m_arrNodes_nunInArray;  //int
    
/*0x174*/    var string lightPresetInUse;                //zSTRING
};

//--------------------------------------
// Книга магии
//--------------------------------------

/* Mud-freak дополнил описания. Спасибо за это! */

/* Используется в цикле для выбора игроком заклинания и
 * содержит отображение: заклинание <-> предмет <-> кнопка. */

class oCMag_Book {
    //zCArray    <oCSpell*>   spells;
        var int spells_array;
        var int spells_numAlloc;
        var int spells_numInArray;
    //zCArray    <oCItem*>    spellitems;
        var int spellitems_array;
        var int spellitems_numAlloc;
        var int spellitems_numInArray;
    
    var int wld;                //zCWorld*    
    var int owner;              //zCVob*      
    var int model;              //zCModel*    //модель владельца (кажется, зарезервировано)
    var int spellnr;            //int         //выбранное заклинание --> n+4 = слот/кнопка
    var int MAG_HEIGHT;         //zREAL       //небольшое смещение, чтобы разместить заклинание над головой владельца (при выборе)
    var int active;             //zBOOL       //не используется??
    var int remove_all;         //zBOOL       //что-то внутреннее? --> Когда MagBook закрывается, если ранее выбранное знаклинание убрано, то устанавливается в 1, иначе в 0 (ВСЕ (включая ранее выбранное) заклинания возвращаются "на пояс")
    var int in_movement;        //zBOOL       //текущий поворот заклинаний над головой игрока? --> и открытие/закрытие
    var int show_handsymbol;    //zBOOL       //? --> PFX или заклинание в руке (соответствует выбранному или нет)
    var int step;               //zREAL       //если в книге n заклинаний, то это число = 360/n 
    var int action;             //int         //внутренняя --> 0 = никаких действий, 1 = вращение, 2 = открытие, 3 = закрытие
    var int UNUSED;             //int         //
    var int open;               //zBOOL       //текущее отображение магической книги (круг над головой игрока)?
    var int open_delay_timer;   //zREAL       //используется как время задержки, прежде чем руна превратится в pfx --> 2000 msec
    var int show_particles;     //zBOOL       //текущее отображение заклинания над головой игрока как pfx?
    var int targetdir;          //zREAL       //для поворота книги, когда игрок нажимает влево или вправо --> на сколько градусов поворот; Обычно задается поворот направо (как 360/n), но налево будет ((360/n)-1)*-1 (отрицательное и на 1 градус меньше)
    var int t1;                 //zREAL       // - " -  --> "Keyframes": FLOATNULL = начало действия, FLOATEINS = конец действия
    var int targetpos[3];       //zVEC3       //для вытаскивания заклинания (с пояса) и чтобы убрать его обратно. --> с позиции...
    var int startpos[3];        //zVEC3       // - " -  --> ... на позицию (в итоге, т.о., startpos и targetpos меняются местами)

    var int nextRegister;       //int         //не уверен. Что-то для связи с клавишами? --> Кажется, это значение никогда не меняется
    var int keys;               //int         //флаги. Если флаг n из {0, 1, ..., 9} задействован, то уставанавливается флаг & (1 << n).  --> Определяет, есть ли заклинание в слоте (на кнопке) n+4, т.е. фактически задействовано n = 6 (число флагов), а не 9
};

//--------------------------------------
// Строки
//--------------------------------------

/*
    Отображение строки в памяти.
    Gothic достаточно хорошо оперирует со строками, так что этот класс вряд ли понадобится.
    Я использовал только как внутрениий, чтобы выделять память.
*/

class zString {
    var int _vtbl;
    var int _allocater; //всегда 0
    var int ptr; //указатель на данные
    var int len; //длинна строки
    var int res; //зарезервировано байт
};

const int sizeof_zString = 20;

//--------------------------------------
// zCClassDef
//--------------------------------------

/* Для каждого (производного от zCObject) класса,
 * есть "управляющий объект" типа zCClassDef.
 * Он инкапсулирует некоторую полезную информацию 
 * обо всех объектах этого класса.
 * С помощью MEM_GetClassDef (var int objPtr)
 * можно пределить, к какому классу относится объект.
 * Это значит, что если передать VOB, то
 * вы получите zCClassDef для класса zCVob.
 */

class zCClassDef {
    var string className;            //zSTRING
    var string baseClassName;        //zSTRING
    var string scriptClassName;      //zSTRING
    var int baseClassDef;            //zCClassDef* //класс-предок
    
    var int createNewInstance;       //zCObject* ( *) (void) //Указатель на функцию, зависящую от класса
    var int createNewInstanceBackup; //zCObject* ( *) (void) //Указатель на функцию, зависящую от класса
    
    /*
    enum zTClassFlags {
        zCLASS_FLAG_SHARED_OBJECTS      = 1<<0, //Использовать несколько объектов (например, визуализацию)
        zCLASS_FLAG_TRANSIENT           = 1<<1, //Временный, не сохраняется.
        zCLASS_FLAG_RESOURCE            = 1<<2, //без понятия / не важно, наверное
    };*/
    
    var int classFlags;              //zDWORD //см. выше
    var int classSize;               //zDWORD //размер в байтах
    
    var int numLivingObjects;        //Число объектов этого класса
    var int numCtorCalled;           //Сколько раз вызывался конструктор
    
    var int hashTable;               //zCObject** //Хэш-таблица размером 1024. Объекты ассоциируются с zCObject.hashNext, если более одного объекта хэшируется одним значением.
    //zCArray<zCObject*> objectList;    //все именованые (!) объекты относятся именно (!) к этому классу (!) //Пояснения к (!): 1.) Неименованных здесь нет. 2.) Объекты дочерних классов не считаются. 3.) Это свойство может быть очень полезна.
        var int objectList_array;       //zCObject**
        var int objectList_numAlloc;    //int
        var int objectList_numInArray;  //int
    
    var int archiveVersion;          //zWORD //вероятно, не используется
    var int archiveVersionSum;       //zWORD //вероятно, не используется
};      

//--------------------------------------
// oCLogTopic
//--------------------------------------

class oCLogTopic {
	var string   		m_strDescription;
	var int       		m_enuSection	; //LOG_MISSION / LOG_NOTE
	var int            	m_enuStatus		; //LOG_RUNNING / ...
	
    //zCList<zString> m_lstEntries;
        var int m_lstEntries_data; //zString*
        var int m_lstEntries_next; //zCList<zString>*
};

/* oCLogManager == zCList<oCLogTopic> */

class oCLogManager {
    var int data; //oCLogTopic*
    var int next; //zCList<oCLogTopic>*
};

const int oCLogManager_Ptr = 11191608; //0xAAC538

//--------------------------------------
// zERROR
//--------------------------------------

class zERROR {
    var int _vtbl;
    var int onexit;  //void (*__cdecl)()
    var string filter_authors;
    var int	filter_flag;
    var int filter_level;
    var int	target;
    var int	ack_type; //zERROR_TYPE
    var int log_file; //zFILE*
    var int indent_depth; //zBYTE
    var int spyHandle; //HWND
    var int spyMutex;  //zCMutex*
};
