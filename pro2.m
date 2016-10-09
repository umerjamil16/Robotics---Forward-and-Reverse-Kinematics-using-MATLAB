% UGV Forward kinematics
close all;
clc;
clear;
syms v1 v2 v3 v4 v5 v6;
l2 = 2;
l5 = 3;
W = [-1 5 -2 15 -2 2];

% dh parammeters
i1 = link ('d', 0, 'a', l2, 'alpha', 0);
i2 = link ('d', 0, 'a', 0, 'alpha', -pi/2);
i3 = link ('theta', 0, 'a', 0, 'alpha', pi/2);
i4 = link ('d', 0, 'a', 0, 'alpha', -pi/2);
i5 = link ('d', l5, 'a', 0, 'alpha', 0);
%i6 = Link ('d', 0, 'a', 0, 'alpha', pi/2);

% dh parammeters
%i1 = Link ('d', 0, 'a', 0, 'alpha', 0);
%i2 = Link ('d', 0, 'a', l2, 'alpha', 0);
%i3 = Link ('theta', 0, 'a', 0, 'alpha', -pi/2);
%i4 = Link ('d', 0, 'a', 0, 'alpha', pi/2);
%i5 = Link ('d', l5, 'a', 0, 'alpha', -pi/2);

i1.qlim=[23 70] * pi/180;
i2.qlim=[-45 40] * pi/180;
i3.qlim=[4 10];
i4.qlim=[-135 135] * pi/180;
i5.qlim=[0 360] * pi/180;

% homogenous transforms
T01 = i1.A(v1);
T12 = i2.A(v2);
T23 = i3.A(v3);
T34 = i4.A(v4);
T45 = i5.A(v5);

% final transformation matrix = forward kinematics
T05 = T01 * T12 * T23 * T34 * T45;
disp(vpa(T05));
UGV = SerialLink([i1 i2 i3 i4 i5], 'name', 'UGV MANIPULATOR');

UGV.plot([0.4 -pi/4 2 -2.4 0], 'workspace', W);


%qi=[0 0 0.1 0 0 0];
%qi=[pi/4, -pi/6, 0.5, pi/4, pi/4];
%final=UGV.fkine(qi);
%disp(final);

%q0 = [v1 v2 v3 v4 v5];
%m = [1 1 1 1 0 0];
%q = UGV.ikine(final);
%disp(vpa(q));

%check=UGV.fkine(q);
%disp(check);

%forward
f=[0.5 -pi/4 2 1 0];
t=[1 -pi/4 6 -1 0];
newpos=jtraj(f, t, 100);
UGV.plot(newpos, 'workspace', W);

%inverse
%s=transl(0, 0, 0);
%d=transl(0.508, 0.3, 0);
%inv=ctraj(s, d, 50);
%show=UGV.ikine(inv);
%UGV.plot(show, 'workspace', W);
%disp(v1);
