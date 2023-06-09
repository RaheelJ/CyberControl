function [dx] = Pow_Sys(t,x,u,sys)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
Acomp=sys.a;
Bcomp=sys.b;
Ccomp=sys.c;

dx=Acomp*x+Bcomp.*u;



