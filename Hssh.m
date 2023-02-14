function  Ha=Hssh(L,v,w)
%Hssh construct the hamiltonian for the ssh model
%   w 为原胞内的hopping 强度
%   v 为原胞间的hopping 强度
A=[kron(ones(1,L-1),[w,v]),w];
Ha=diag(A,1)+diag(A,-1);
end
