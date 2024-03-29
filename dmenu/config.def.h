/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 0;                      /* -b  option; if 0, dmenu appears at bottom     */
static const unsigned int alpha = 0xff;
static int centered = 1; /* -c option; centers dmenu on screen*/
static int min_width = 300; /*minimum width when centered*/
/* -fn option overrides fonts[0]; default X11 font or font set */
static char font[] = "Hack:size=11";
static const char *fonts[] = {
	font,
	"Hack:size=11"
};
static char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static char normfgcolor[] = "#fbf1c7";
static char normbgcolor[] = "#3c3836";
static char selfgcolor[]  = "#282828";
static char selbgcolor[]  = "#83a598";
static char *colors[SchemeLast][2] = {
        /*     fg         bg       */
       [SchemeNorm] = { normfgcolor, normbgcolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor  },
       [SchemeOut]  = { "#000000",   "#00ffff" },
 };
//
//
static const unsigned int alphas[SchemeLast][2] = {
       [SchemeNorm] = { OPAQUE, alpha },
       [SchemeSel] = { OPAQUE, alpha },
       [SchemeOut] = { OPAQUE, alpha },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
	{ "font",        STRING, &font },
	{ "normfgcolor", STRING, &normfgcolor },
	{ "normbgcolor", STRING, &normbgcolor },
	{ "selfgcolor",  STRING, &selfgcolor },
	{ "selbgcolor",  STRING, &selbgcolor },
	{ "prompt",      STRING, &prompt },
};
