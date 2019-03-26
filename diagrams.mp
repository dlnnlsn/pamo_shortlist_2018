prologues := 3;
outputtemplate := "Figure_%c.mps";

input latexmp;

verbatimtex
%&latex
\documentclass[12pt]{article}
\usepackage{amsmath,amssymb}
\begin{document}
etex

defaultscale := 12pt;

u := 3in;

pair v[];
for i := 0 upto 7:
	v[i] := dir(360 / 16 + i * 360 / 8) scaled 3.5u;
endfor;

def cell(expr lab, offset, index) =
	label(textext("\fbox{$" & lab & "$}") scaled defaultscale, offset + v[index]);
enddef;

pair O[];
O1 := (0, 0);
O2 := (16u, 0);

beginfig(1);
    draw fullcircle scaled 10u;

    for i := 0 upto 7:
        draw O1--(O1 + dir(i * 360 / 8) scaled 5u);
    endfor;

    cell("\longrightarrow 0", O1, 0);
	cell("1", O1, 1);
	cell("0", O1, 2);
	cell("0", O1, 3);
	cell("0", O1, 4);
	cell("1", O1, 5);
	cell("1", O1, 6);
	cell("0", O1, 7);

	label(btex \fbox{$\implies$} etex scaled defaultscale, (O1 + O2)/2);

    draw fullcircle scaled 10u shifted O2;

    for i := 0 upto 7:
        draw O2--(O2 + dir(i * 360 / 8) scaled 5u);
    endfor;

    cell("\longrightarrow 1", O2, 0);
	cell("0", O2, 1);
	cell("0", O2, 2);
	cell("0", O2, 3);
	cell("0", O2, 4);
	cell("1", O2, 5);
	cell("1", O2, 6);
	cell("1", O2, 7);

endfig;

end;

