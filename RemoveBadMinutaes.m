function [BifCentrs2,TermCentrs2] = RemoveBadMinutaes(BifCentrs,TermCentrs)
sb=size(BifCentrs);
st=size(TermCentrs);
bi=[];
bj=[];

for i = 1:sb(1)
    for j = 1:st(1)
        if norm(BifCentrs(i,:)-TermCentrs(j,:))<=6
            s=size(find(bi==i));
            if s(1)>0
                bi=bi+(i);
            end
            s=size(find(bj==j));
            if s(1)>0
                bj=bj+(j);
            end
        end
    end
end
end
