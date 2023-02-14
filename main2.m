% In this part, we study the real space topological invariant.

compare(1.2)

function []=compare(J0)
% this function was used to compare the topological transition points
% the edgemode
% the real space topological invariant

L=100;
v=1;
delta=2*pi*rand();

w_all=0:0.1:3;
data=zeros(1,length(w_all));
data1=zeros(1,length(w_all));

for m=1:length(w_all)
   w=w_all(m);
   H1=Hssh_disorder(L,v,w,J0,delta);
   [Ev,E]=eig(H1,'vector');
   Q=zeros(size(Ev,1),size(Ev,2));
   Q1=zeros(size(Ev,1),size(Ev,2)); 
   [E1,index]=sort(E); 
   for n=1:size(Ev,1)
       Q1=Q1+Ev(:,n)*Ev(:,n)';
       if n>=L
            Q=Q-Ev(:,index(n))*Ev(:,index(n))';
       else 
            Q=Q+Ev(:,index(n))*Ev(:,index(n))';
       end
   end
   data(1,m)=r_w(Q,2*L,10);
   data1(1,m)=min(abs(E));
end

yyaxis left
plot(w_all,data,'linewidth',2)
hold on;
ylabel('w','interpreter','latex')
ylim([-0.2,1.2])

yyaxis right
plot(w_all,data1,'linewidth',2)
ylim([0,max(data1)])
ylabel('$min(|E|)$','interpreter','latex')
end