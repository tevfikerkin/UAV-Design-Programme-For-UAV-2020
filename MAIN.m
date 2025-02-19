%% Aircraft Structural Design Programme
clc;
clear all;
%% Horizontal and Vertical Tail Variables

landa_vt = 0.5; %taper ratio of vertical tail
landa_ht = 0.5; % taper ratio of horizantal tail
AR_vt = 1.5; %aspect ratio of vertical tail
AR_ht = 4; %aspect ratio of horizantal tail

%% Wing Dimensions and Variables

L_fsg = 0.8; % length of the fusalage in meter
b = 1.5; %wing span unit is metre
landa = 0.5; % taper ratio
AR = 7; % it is determined recpect to the researches 
S = (b.^2)./ AR; % Wing wet area 
rc = root_chord(S,landa,b); % assigned as a function to calculate the root chord length
tc = landa * rc ; % tip chord length
y = mac (b,landa) ; % mean aerodynamic chord location on wingspan
[ac , c] = aerodynamic_chord(rc,landa) ; %aerodynamic chord length and aerodynamic center location respect to leading edge
%% Horizontal and Vertical Tail Calculations
[L_ht S_ht] = S_HorizantalTailArea(c,S,L_fsg); %horizantal tail area
[L_vt S_vt] = S_VerticalTailArea(b,S,L_fsg); %vertical tail area
b_ht = sqrt(S_ht*AR_ht); % Horizantal tail span
b_vt = sqrt(S_vt*AR_vt); %Vertical tail span (height)
rc_ht = root_chord(S_ht,landa_ht,b_ht); % assigned a function to calculate the root chord length for horizantal tail
tc_ht = landa_ht * rc_ht ; % tip chord length horizantal tail
rc_vt = root_chord(S_vt,landa_vt,b_vt); % assigned a function to calculate the root chord length for vertical tail
tc_vt = landa_vt * rc_vt ; % tip chord length vertical tail

y_ht = mac (b_ht,landa_ht) ; %mean aerodynamic chord location on wingspan
[ac_ht , c_ht] = aerodynamic_chord(rc_ht,landa_ht) ; %aerodynamic chord length and aerodynamic center location respect to leading edge

y_vt = mac (b_vt,landa_vt) ; %mean aerodynamic chord location on wingspan
[ac_vt , c_vt] = aerodynamic_chord(rc_vt,landa_vt) ; %aerodynamic chord length and aerodynamic center location respect to leading edge
%wing_plot(rc,tc,ac,y,b,c);

%% Display
fprintf(' -------Main Wing------- \n');
fprintf('Note: This measurements unit is metre. LOOK OUT!!!\n\n')
fprintf('Length Of Fuselage:%1.4f\nWing Span:%1.4f\nAspect Ratio of Wing: %1.4f\nWing Surface Area:%1.4f\nRoot Chord of Wing:%1.4f\nTip Chord:%1.4f\nAerodynamic Center From Leading Edge:%1.4f\nTaper Ratio of Wing:%1.4f\n\n',L_fsg,b,AR,S,rc,tc,ac,landa);
fprintf(' -------Horizantal Stabilizier------- \n\n');
fprintf('Span of HT:%1.4f\nMoment Arm Length of HT:%1.4f\nRoot Chord of HT:%1.4f\nTip Chord of HT:%1.4f\nSurface Area of HT:%1.4f\nAerodynamic Center of HT from leading edge of HT:%1.4f\nTaper Ratio of HT:%1.4f\nAspect Ratio of HT:%1.4f\n',b_ht,L_ht,rc_ht,tc_ht,S_ht,ac_ht,landa_ht,AR_ht);
fprintf('\n\n --------Vertical Stabilizier------- \n\n');
fprintf('Span of VT:%1.4f\nMoment Arm Length of VT:%1.4f\nRoot Chord of VT:%1.4f\nTip Chord of VT:%1.4f\nSurface Area of VT:%1.4f\nAerodynamic Center of VT from leading edge of VT:%1.4f\nTaper Ratio of VT:%1.4f\nAspect Ratio of VT:%1.4f\n',b_vt,L_vt,rc_vt,tc_vt,S_vt,ac_vt,landa_vt,AR_vt);
