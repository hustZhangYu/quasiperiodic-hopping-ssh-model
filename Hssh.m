function  Ha=Hssh(L,v,w)
%Hssh construct the hamiltonian for the ssh model
%   w Ϊԭ���ڵ�hopping ǿ��
%   v Ϊԭ�����hopping ǿ��
A=[kron(ones(1,L-1),[w,v]),w];
Ha=diag(A,1)+diag(A,-1);
end
