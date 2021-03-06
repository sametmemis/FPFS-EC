%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation:
% S. Memi?, S. Engino?lu, and U. Erkan, 2021. Numerical Data Classification 
% via Distance-Based Similarity Measures of Fuzzy Parameterized Fuzzy Soft 
% Matrices, IEEE Access, 9, 88583-88601.
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
% DM = importdata('Wine.mat');
% [x,y]=size(DM);
% 
% data=DM(:,1:end-1);
% class=DM(:,end);
% if prod(class)==0
%     class=class+1;
% end
% k_fold=5;
% cv = cvpartition(class,'KFold',k_fold);
%     for i=1:k_fold
%         test=data(cv.test(i),:);
%         train=data(~cv.test(i),:);
%         T=class(cv.test(i),:);
%         C=class(~cv.test(i),:);
%     
%         sFPFSEC=FPFSEC(train,C,test);
%         accuracy(i,:)=sum(sFPFSEC==T)/numel(T);
%     end
% mean_accuracy=mean(accuracy);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function PredictedClass=FPFSEC(train,C,test)
[em,en]=size(train);
[tm,n]=size(test);

  for j=1:en
      fw(1,j)=abs(corr(train(:,j),C,'Type','Pearson','Rows','complete'));
  end
  fw(isnan(fw))=0;

data=[train;test];
for j=1:n
    data(:,j)=normalise(data(:,j));
end

train=data(1:em,:);
test=data(em+1:end,:);

for i=1:tm
    a=[fw ; test(i,:)];
    for j=1:em
          b=[fw  ; train(j,:)];
          Sr(j)=fpfss3(a,b);         
    end    
    [~,w]=max(Sr);
    PredictedClass(i,1)=C(w);
    
end
end

function na=normalise(a)
[m,n]=size(a);
    if max(a)~=min(a)
        na=(a-min(a))/(max(a)-min(a));
    else
        na=ones(m,n);
    end
end                                                                                                                                                                  

% Euclidean pseudo similarity over fpfs-matrices
function X=fpfss3(a,b)
if size(a)==size(b)
[m,n]=size(a);
d=0;
  for i=2:m
    for j=1:n
       d=d+abs(a(1,j)*a(i,j)-b(1,j)*b(i,j))^2;
    end
  end
  X=1-(sqrt(d)/(sqrt((m-1)*n)));
end
end
