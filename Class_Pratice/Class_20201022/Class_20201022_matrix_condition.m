clear all
close all
format long

aa = [8 2 -1; 3 10 1; -1 2 20];
condition = norm(aa) * norm(inv(aa))
% 3.310748027333875

% ill condition
% the greater the condition, the worse the system
bb = [2.0000 3.0010; 2.0000 3.0000];
condition_bb = norm(bb) * norm(inv(bb))
% 1.300300042309611e+04

cc = [2.0000 3.0100; 2.0000 3.0000];
condition_cc = norm(cc) * norm(inv(cc))
% 1.303004232542812e+03