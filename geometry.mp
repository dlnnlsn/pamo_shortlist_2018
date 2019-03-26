prologues := 3;
outputtemplate := "Problem_%c.mps";

defaultscale := 12pt;

vardef mark_right_angle (expr common, endofa, endofb, size) = % right angle mark
    save tn ; tn := turningnumber(common -- endofa -- endofb -- cycle) ;
    draw ((1, 0) -- (1, 1) -- (0, 1))
        zscaled (size*unitvector((1+tn)*endofa + (1-tn)*endofb - 2*common))
        shifted common;
enddef ;

def draw_angle(expr common, endofa, endofb, length) =
    save tn; tn := turningnumber(common--endofa--endofb--cycle);
    draw (unitvector(endofa-common){(endofa-common)
        rotated (tn*90)} .. unitvector(endofb-common))
        scaled length shifted common withcolor 0.3white;
enddef;

u := 0.5in;

beginfig(5);
    pair A, B, C;
    A := dir(90) scaled 3u;
    B := dir(215) scaled 4u;
    C := B + (1, 0) scaled 8u;
   
    pair D; D := 0.5 [A, B];
    pair E; E := 0.5 [A, C];

    pair F; F = whatever [B, C]; (F - A) dotprod (C - B) = 0;

    pair C'; C' := (length(A - C) / (length(A - C) + length(B - C))) [A, B];

    draw A--B--C--cycle;
    draw A--F;
    draw C--C';

    draw D--E;

    draw fullcircle scaled length(A - C) shifted E;

    mark_right_angle(F, A, C, 3mm);

    pair G; G = whatever [D, E]; G = whatever [C, C'];

    draw A--G;
    mark_right_angle(G, A, C, 3mm);

    dotlabel.top(btex $A$ etex, A);
    dotlabel.llft(btex $B$ etex, B);
    dotlabel.lrt(btex $C$ etex, C);

    dotlabel.ulft(btex $D$ etex, D);
    dotlabel.urt(btex $E$ etex, E);
    dotlabel.llft(btex $F$ etex, F);

    dotlabel.llft(btex $G$ etex, G);

endfig;

beginfig(11);
    pair A, B, C;
    A := dir(135) scaled 3u;
    B := dir(215) scaled 4u;
    C := B + (1, 0) scaled 8u;

    draw A--B--C--cycle;

    dotlabel.top(btex $A$ etex, A);
    dotlabel.lft(btex $B$ etex, B);
    dotlabel.rt(btex $C$ etex, C);

    pair D;

    D = A + whatever * ((A - B) rotated 90);
    D = B + whatever * ((C - B) rotated 90);

    draw D--A;
    draw D--B;

    dotlabel.lft(btex $D$ etex, D);

    dotlabel.rt(btex $P$ etex, (0, 0));
    
    draw A--(0, 0)--B;

    mark_right_angle(A, C, D, 3mm);
    mark_right_angle(B, C, D, 3mm);    

endfig;

beginfig(12);

    pair A, B, C, D, P, X;
    A := (4u, 0); B := (4u, 6u); C := (0, 6u); D := (0, 0);
    X := (8u, 6u);

    P = whatever [X, A];
    P = D + whatever * ((A - D) rotated (angle(A - D) - angle(X - D)));

    draw A--B--C--D--cycle;
    draw P--C--X--D--P--X;

    dotlabel.lrt(btex $A (2, 0)$ etex, A);
    dotlabel.urt(btex $B (2, b)$ etex, B);
    dotlabel.ulft(btex $C (0, b)$ etex, C);
    dotlabel.llft(btex $D (0, 0)$ etex, D);

    dotlabel.urt(btex $X (a, b)$ etex, X);
    dotlabel.bot(btex $P (x, y)$ etex, P);

    draw_angle(D, A, P, 5mm);
    draw_angle(D, X, A, 5mm);

    mark_right_angle(A, B, D, 3mm);
    mark_right_angle(B, A, C, 3mm);
    mark_right_angle(C, B, D, 3mm);
    mark_right_angle(D, C, A, 3mm);

endfig;

beginfig(13);

    pair A, B, C, I, X, Y, Z, X', K, L;

    A := dir(135) scaled 3u;
    B := dir(215) scaled 4u;
    C := B + (1, 0) scaled 8u;

    pair A', B';
    A' := (length(A - B) / (length(A - C) + length(A - B))) [B, C];
    B' := (length(B - C) / (length(A - B) + length(B - C))) [C, A];

    I = whatever [A, A'];
    I = whatever [B, B'];

    X = whatever [B, C];
    (X - I) dotprod (C - B) = 0;

    Y = whatever [C, A];
    (Y - I) dotprod (A - C) = 0;

    Z = whatever [A, B];
    (Z - I) dotprod (B - A) = 0;

    draw fullcircle scaled (2 * length(X - I)) shifted I;

    X' = whatever [Z, Y];
    X' = whatever [B, C];

    K = whatever [A, X'];
    K = B + whatever * dir(angle(A - X));

    L = whatever [A, X'];
    L = B + whatever * dir(angle(A - C));

    draw A--B--C--cycle;

    draw Y--X'--B;
    draw A--X';

    draw A--X;
    draw B--K;
    draw B--L;

    dotlabel.top(btex $A$ etex, A);
    dotlabel.llft(btex $B$ etex, B);
    dotlabel.lrt(btex $C$ etex, C);

    dotlabel.bot(btex $X$ etex, X);
    dotlabel.urt(btex $Y$ etex, Y);
    dotlabel.ulft(btex $Z$ etex, Z);

    dotlabel.llft(btex $X^\prime$ etex, X');
    dotlabel.ulft(btex $K$ etex, K);
    dotlabel.ulft(btex $L$ etex, L);

endfig;


end;
