%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation:
% Memiş, S., Enginoğlu, S., Erkan, U., 2021. Numerical Data Classification 
% via Distance-Based Similarity Measures of Fuzzy Parameterized Fuzzy Soft 
% Matrices. IEEE Access, 9, 88583-88601.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abbreviation of Journal Title: IEEE Access
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://doi.org/10.1109/ACCESS.2021.3089849
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://www.researchgate.net/profile/Samet_Memis2
% https://www.researchgate.net/profile/Serdar_Enginoglu2
% https://www.researchgate.net/profile/Ugur_Erkan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Demo: 
% clc;
% clear all;
% % a and b two fpfs-matrices
% % d is the Normalized Minkowski pseudo-distance of the fpfs-matrices a and b 
% a=rand(5,4); 
% b=rand(5,4); 
% d=fpfsnd6(a,b,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Normalized Minkowski pseudo-metric over fpfs-matrices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function X=fpfsnd6(a,b,p)
if size(a)~=size(b)
    error('The sizes of the matrices must be the same.');
else
[m,n]=size(a);
d=0;
  for i=2:m
    for j=1:n
       d=d+abs(a(1,j)*a(i,j)-b(1,j)*b(i,j))^p;
    end
  end
  X=(d^(1/p))/(((m-1)*n)^(1/p));
end
end