function [ac , a_ch] = aerodynamic_chord(rc , landa)


a_ch = (2/3) * rc * ( (1+landa+landa^2) / (1+landa) );
ac = 0.25 * a_ch;
ac = (rc - (rc-a_ch)/2) - ac;
ac = rc-ac;
end