function wa=r_w(U1,L,L1)
%R_W real space topological invariant with chiral symmetry
%   L为矩阵大小，也是体系尺寸的二倍
%   L1对边缘的截断
    Gamma=diag(kron(ones(1,L/2),[1,-1]));
    X=diag(kron(linspace(1,L/2,L/2),[1,1]));
    Wa=Gamma*U1'*(U1*X-X*U1);
    Wa1=Wa(L1+1:L-L1,L1+1:L-L1);
    wa=trace(Wa1)/(L-2*L1);
end
