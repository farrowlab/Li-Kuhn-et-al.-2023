function h=addLines(LL,ip)
L=LL{ip};
hold on;
nb=length(L);
h=gobjects(nb,1);
for ib=1:nb
    x=L{ib};
    h(ib)=plot(x(:,2),x(:,1),'w:');        % change the color trae line etc here!   
end
hold off
end
