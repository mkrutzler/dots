static const char *colorname[] = {

    "#282828",
    "#cc241d",
    "#98971a",
    "#d79921",
    "#458588",
    "#b16286",
    "#689d6a",
    "#a89984",

    "#928374",
    "#fb4934",
    "#b8bb26",
    "#fabd2f",
    "#83a598",
    "#d3869b",
    "#8ec07c",
    "#ebdbb2",

    [255] = 0,
    /* more colors can be added after 255 to use with DefaultXX */
    [256] = "#191724",
};


/*
 * Default colors (colorname index)
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultbg = 256;
unsigned int defaultfg = 7;
unsigned int defaultcs = 7;
unsigned int defaultrcs = 7;
