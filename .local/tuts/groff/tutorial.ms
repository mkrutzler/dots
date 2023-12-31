.TL
Groff Document Tutorial - What I have learnt about groff ms
.AU
Mark Krutzler
.AI
Kantonschule Im Lee
.DA
23. September 2023


.AB
This is an abstract.
.AE

.XS 1
Heading 1
.XA 3
Heading 2
.XA 2
Heading
.XE
.TC
.bp

.ls 2
.NH
The first heading.

.ls 2
.PP
This is a paragraph.

.PP
To indent the paragraph use .PP, without it an empty line will create a non indented paragraph.

.NH 2
Compiling

.PP
To compile use: "groff -ms -k FILE.ms -T pdf > FILE.pdf" to compile.


.NH
The first heading.

.PP
Here comes more text in
.B another
.I paragraph.
.BI "This is bold italic text.

.PP
.RS
.ls 2
.B "This will be an extra indented paragraph (with line spacing 2):"
Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.
.RE

.PP
.B "This isn't:"
Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.


.SH
Mathematical Formulas (Unnumbered)
.NH 2
Usage in the Document

.PP
A Mathematical formula starts with
.B EQ
and ends with
.B EN.
Everything that's inside will be interpreted as a formula by eqn. Example:
.EQ
x = 3 + 5 sup 2
.EN


Same goes for subscript. Just use "sub".

Square Roots don't work for some reason, need to fix that. (Or at least not with zathura. Firefox does display it correctly.)

.EQ
phi = {1 + sqrt 5 } over {2}
.EN

.NH 2
Compiling the Document with eqn and formulas inside it
.PP
Use: "eqn FILE.ms -Tpdf | groff -k -ms -Tpdf > FILE.pdf"

Or you can do it with just groff: "groff -e -k FILE.ms -ms -Tpdf > FILE.pdf"

.NH
Bibliography and references
.PP
You can use the preprocessor "refer" to create references. However you have to have a bibliography file, which I still need to figure out with "man refer". You can refer ith .[ and .]. Example:

.[
deep work cal newport
.]

.PP
