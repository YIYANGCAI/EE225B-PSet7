% compute the entropy of a function
function out=EntropySelf(in1)
[C,L]=size(in1); 
Img_size=C*L; 
G=256;
H_x=0;
nk=zeros(G,1);
for i=1:C
    for j=1:L
        Img_level=in1(i,j)+1; 
        nk(Img_level)=nk(Img_level) + 1; 
    end
end
for k=1:G  
    Ps(k)=nk(k)/Img_size; 
    if Ps(k)~=0
        H_x = -Ps(k)*log2(Ps(k)) + H_x; %basic function
    end
end
out = H_x;