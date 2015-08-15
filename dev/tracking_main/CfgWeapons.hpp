#define PDA(S, NAME) \
    class S##_itemGPS_FT : itemGPS { \
        _generalMacro = "itemGPS_FT"; \
        author = MAINAUTHOR; \
        displayName = NAME EasyTrack PDA; \
        picture = QDATAPATH(icon_pda.paa); \
    }

#define TABLET(S, NAME) \
    class S##_itemLAPTOP_FT : itemGPS { \
        _generalMacro = "itemLAPTOP_FT"; \
        author = MAINAUTHOR; \
        displayName = NAME EasyTrack Tablet; \
        picture = QDATAPATH(icon_tablet.paa); \
 \
        class iteminfo { \
            mass = 10; \
        }; \
    }

class CfgWeapons {
    class itemGPS;

    PDA(b, BLUFOR);
    PDA(o, OPFOR);
    PDA(i, GUER);

    TABLET(b, BLUFOR);
    TABLET(o, OPFOR);
    TABLET(i, GUER);

    class EasyTrack_PDA_Destructed: itemGPS {
        _generalMacro = "itemGPS_FT";
        author = MAINAUTHOR;
        displayName = $STR_MAIN_PDA_DESTRCUTED;
        picture = QDATAPATH(icon_pda_destructed.paa);
    };

    class EasyTrack_Tablet_Destructed: itemGPS {
        _generalMacro = "itemLAPTOP_FT";
        author = MAINAUTHOR;
        displayName = $STR_MAIN_TABLET_DESTRCUTED;
        picture = QDATAPATH(icon_tablet_destructed.paa);

        class iteminfo {
            mass = 10;
        };
    };
};