function  out= wing_plot(rc,tc,ac,y,b,c)

%      [ x1                            y1   ]

%% wing plotting
wing = [ 0                             0
        
        (rc-(rc-tc))/2                 b 
        ( (rc-(rc-tc))/2 )+tc          b   
        rc                             0 ]; %drawing wing 
    
wing_2=[ 0                             0    
        (rc-(rc-tc))/2                 -b 
        ( (rc-(rc-tc))/2 )+tc          -b   
        rc                             0 ]; %drawing wing 

            
x = wing (:,1);
y_plot = wing (: ,2);

plot (x',y_plot');

hold on; 
x = wing_2 (:,1);
y_plot = wing_2 (: ,2);

plot (x',y_plot');
hold on

%% aerodynamic center point 
plot(ac,y,'g*');
plot(ac,0,'r*');
plot(rc-(rc/2),0,'c+');
a_c = [ac  0; rc 0];
x_ac=a_c(:,1);
y_ac=a_c(:,2);
plot(x_ac',y_ac');

text(ac,y/17 , "A.C" ,'color','r','FontSize',8);

text(ac+ac/8,-y/18 , num2str(rc-ac) ,'color','r','FontSize',8);

text(rc,0,"head",'color','b','FontSize',9);
hold on

%% Mean aerodynamic center plotting

line_ac = [rc-(rc-c)/2  y; ac  y ];
line_x= line_ac(:,1);
line_y= line_ac(:,2);
grid on
plot(line_x',line_y');
end