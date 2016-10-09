         %%% First we clean the workspace
clear;
clc;
%%% Create links
L(1) = Link([0 0.78 0.41 -pi/2]);
L(2) = Link([0 0 1.075 0]);
L(3) = Link([0 0 0.165 -pi/2]);
L(4) = Link([0 1.056 0 pi/2]);
L(5) = Link([0 0 0 -pi/2]);
L(6) = Link([0 0.25 0 0]);
L(2).offset = -pi/2;
L(6).offset = pi;
%%% Joint limits
L(1).qlim = pi/180*[-180 180];
L(2).qlim = pi/180*[-60 85];
L(3).qlim = pi/180*[-180 60];
L(4).qlim = pi/180*[-300 300];
L(5).qlim = pi/180*[-100 100];
L(6).qlim = pi/180*[-300 300];
%%% Create robot and plot it
IRB7600 = SerialLink(L);
IRB7600.name = 'IRB7600';
%IRB7600.plot([0 0 0 0 0 0]);
%%% To solve the forward kinematics in the general case, we have to
%%% introduce the six joint angles as symbols
a1 = sym('a1');
a2 = sym('a2');
a3 = sym('a3');
a4 = sym('a4');
a5 = sym('a5');
a6 = sym('a6');
IRB7600.fkine([0 3 4 5 6 7])
t = IRB7600.ikine(IRB7600.fkine([0 3 4 5 6 7]))