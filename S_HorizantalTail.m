function [S_ht] = S_HorizantalTailArea(c,S,L_fsg)

Vht=0.7;

L_ht = L_fsg*0.65; %from raymer page 113

S_ht = ( Vht * c * S )/ L_ht ;

end