function Ha = Hssh_disorder(L,v,w,J0,delta)
%HSSH_DISORDER 在原胞内添加准周期无序
%hopping term A (J0+cos(2*pi*omgea*j+delta)) B v A ...
    omega=(sqrt(5)-1)/2;
    h=w*cos(2*pi*omega*linspace(1,L,L)+delta);
    A=[kron(ones(1,L-1),[J0,v]),J0]+[kron(h(1:L-1),[1,0]),h(L)];
    Ha=diag(A,1)+diag(A,-1);
end
