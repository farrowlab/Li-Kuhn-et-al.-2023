function addLines02_CL01(LL,ip,c,lw)
color = c;
subsample=2;
ip=ip*subsample;
L=LL{ip};

hold on;
nb=length(L);
for ib=1:nb
	x=L{ib};
	if length(x)>10
		xr=continuity(x(:,2));
		yr=continuity(x(:,1));    
		plot(xr/subsample,yr/subsample,color,'linewidth',lw);        % change the color trae line etc here!
	end
end
hold off
end


function xx=continuity(x)
nx=length(x);
ir=0;
i=0;
v=x(1);
nv=0;
while i<nx
	i=i+1;
	if v==x(i)&& i<nx
		nv=nv+1;
	else
		ir=ir+1;
		xr(ir)=v;
		tr(ir)=i-nv/2-1;
		nv=0;
		v=x(i);
	end
end

if length(xr)>2
	xx=interp1(tr,xr,1:nx,[],xr(1));
else
	xx=x;
end
xx(end)=xx(1);
end
