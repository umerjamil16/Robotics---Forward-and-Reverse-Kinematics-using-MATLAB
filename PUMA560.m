%NS QAZI UMER JAMIL
%GC MUDASSAR WAJID

%ROBOT: PUMA 560

close all;
clc;
clear;

deg = pi/180;

L(1) = Revolute('d', 0, 'a', 0, 'alpha', pi/2, 'qlim', [-160 160]*deg );
L(2) = Revolute('d', 0, 'a', 0.4318, 'alpha', 0, 'qlim', [-45 225]*deg );
L(3) = Revolute('d', 0.15005, 'a', 0.0203, 'alpha', -pi/2, 'qlim', [-225 45]*deg );
L(4) = Revolute('d', 0.4318, 'a', 0, 'alpha', pi/2, 'qlim', [-110 170]*deg);
L(5) = Revolute('d', 0, 'a', 0, 'alpha', -pi/2, 'qlim', [-100 100]*deg );
L(6) = Revolute('d', 0, 'a', 0, 'alpha', 0, 'qlim', [-266 266]*deg );

puma560 = SerialLink(L, 'name', 'Puma 560');

%Poses of PUMA 560 - for simulation
qz = [0 0 0 0 0 0]; 
qr = [0 pi/2 -pi/2 0 0 0]; 
qs = [0 0 -pi/2 0 0 0];
qn=[0 pi/4 pi 0 pi/4  0];

%Forward Kinematics
q = [0 -pi/4 -pi/4 0 pi/8 0];
r = q;
T = puma560.fkine(q);

%Inverse Kinematics
qi = puma560.ikine(T);
qi = puma560.ikine(T, 'pinv');

%Simulation

t = [0:.05:4]'; 	
q = jtraj(qz, qr, t); 
puma560.plot(q);

q = jtraj(qr, qs, t); 
puma560.plot(q);

q = jtraj(qs, qn, t); % generate joint coordinate trajectory
puma560.plot(q);
