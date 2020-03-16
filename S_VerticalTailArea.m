function [L_vt, S_vt] = S_VerticalTailArea(b,S,L_fsg)

L_vt = L_fsg*0.55; % from raymer page 113

Vvt = 0.04;

S_vt = (Vvt*b*S) / L_vt;


end