% �����ɷַ�����
clc;
clear all;
%% 
% ------------������
load sn11.txt  %��ԭʼ�����ݱ����ڴ��ı��ļ�sn22.txt�� 
[m,n]=size(sn11); 
x0=sn11(:,1:n-3);  %�Ŷ���������
y0 = mean([sn11(:,n),sn11(:,n),sn11(:,n)],2);   % �ο��Ա�ֵ
r=corrcoef(x0)  %�������ϵ������
% ----------�������ݱ�׼������ 
xb=zscore(x0);  
yb=zscore(y0);  
% -----------���ɷַ���,s��Ӧ�任�����Ӻ����t����ֵ��c���ɷֵ�ϵ�� 
[c,s,t]=princomp(xb) 
% ----------�����ۻ�������
contr=cumsum(t)/sum(t)  
num=input('���ɷֵĸ���:')   
fprintf('\n���ɷֱ����ع鷽�̣�') 
hg=s(:,1:num)\yb;  
hg=c(:,1:num)*hg;  
hg2=[mean(y0)-std(y0)*mean(x0)./std(x0)*hg, std(y0)*hg'./std(x0)]  
fprintf('y=%f',hg2(1)); 
for i=1:n-3     
    fprintf('+%f*x%d',hg2(i+1),i); 
end
