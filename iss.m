%%%%%%%%
% The 7-dof Canadarm-2 robot is mounted on the International Space Station
% (ISS) and was donated by Canada. 
%  Forward kinematics
clc
clear all
close all     

%Link Parameters
L(1)= Link([0 380 0 -pi/2]);
L(2)= Link([0 635 0 pi/2]);
L(3)= Link([0 504 6850 0]);
L(4)= Link([0 0 6850 0]);
L(5)= Link([0 504 0 -pi/2]);
L(6)= Link([0 635 0 pi/2]);
L(7)= Link([0 380 0 0]);

Canadarm = SerialLink(L, 'name', 'Canadarm');
 
%Joint Angles
q=[0, 0, 0, pi, 0, pi/2, 0];

%Computing Forward Kinematics of Canadarm

cnd = Canadarm.fkine(q)
%Computing Inverse Kinematics of Canadarm
%DH Parameters
theta= [0, 0, -1.950 -2.287 -3.651 2.575 1.634 0.938];
alpha=[0, -pi/2, pi/2, 0, 0, -pi/2, pi/2, 0];
a=[0, 0 0, 6850, 6850, 0, 0,0];
d=[0, 380, 635, 504, 0, 504, 635, 380];

T = Canadarm.fkine(q);
q1 = Canadarm.ikine(T);