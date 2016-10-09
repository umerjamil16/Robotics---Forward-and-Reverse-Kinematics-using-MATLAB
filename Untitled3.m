clc
clear all
close all     

L(1) = Link([0, 0, 0, pi/2]);
L(2) = Link([0, 0, 12, 0]);
L(3) = Link([0, 0, 12, 0]);
L(4) = Link([0, 0, 0, pi/2]);
L(5) = Link([0, 0, 0, -pi/2]);
L(6) = Link([0, 0, 0, 0]);

UGV_ARMY = SerialLink(L, 'name', 'UGV_ARMY');
 
q=[-1.950 -2.287 -3.651 2.575 1.634 0.938];
 
T = UGV_ARMY.fkine(q);
q1 = UGV_ARMY.ikine(T)
