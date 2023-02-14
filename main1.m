% we study the localization-delocalization transition 

data=LocalizationDelocalization()

% % testcode
% psi=ones(1,100);
% psi(1,20)=1;
% psi=psi./sqrt(psi*psi');
% Ipr(psi)

function [data]=LocalizationDelocalization()

L=100;
v=1;w=0.5;
J0=1.2;
delta=2*pi*rand();
                    
w_all=0:0.03:3;

data=zeros(length(w_all),2*L);
dataE=zeros(length(w_all),2*L);
for n=1:length(w_all)
    w=w_all(n);
    H1=Hssh_disorder(L,v,w,J0,delta);
    [Ev,E]=eig(H1,'vector');
    for m=1:length(E)
        data(n,m)=Ipr(Ev(:,m));
    end
    dataE(n,:)=E;
end

xy=kron(w_all',ones(1,2*L));

figure()
for  m=1:length(w_all)
    scatter(xy(m,:),dataE(m,:),5,log10(data(m,:)),'filled') 
    hold on;
end

colorbar()

end