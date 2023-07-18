classdef mapscan < handle
    
    properties
        D
        nx
        ny
        nz
        x0
        y0
        z0
        cmap
        caxis
        T
        method
        dx
        dy
        dz
    end
    
    methods
        function M=mapscan(data,dx,dy,dz)
            M.D=data;
            [M.nx,M.ny,M.nz]=size(data);
            M.T=eye(4);    
            M.x0=round(M.nx/2);
            M.y0=round(M.ny/2);
            M.z0=round(M.nz/2);
            M.cmap= gray(128);
            M.method='normal';
            M.dx=dx;
            M.dy=dy;
            M.dz=dz;
        end
        
        function [ax,ay,az]=cuts(M,cmap)
            if nargin==1,cmap=M.cmap; end
            ax=rgbfunc(squeeze(M.D(M.x0,:,:)),M);
            ay=rgbfunc(squeeze(M.D(:,M.y0,:)),M);
            az=rgbfunc(squeeze(M.D(:,:,M.z0)),M);
        end
        
    end
    
    events
        eventRefresh
    end
    
end


function b=rgbfunc(a,M)
[nx,ny]=size(a);
aa=a(:);
method=M.method;
cmap=M.cmap;

if strcmp(method,'normal')
    norm=max(aa)-min(aa);
    aa=(aa-min(aa))/(norm);
    aa=uint16(round(aa(:)*(length(cmap)-1)+1));
    aa(aa==0)=1;
    b=cmap(aa,:);
    b=reshape(b,nx,ny,3); 
elseif strcmp(method,'fix')
    aa=(aa-M.caxis(1))/(M.caxis(2)-M.caxis(1));
    aa=uint16(round(aa(:)*(length(cmap)-1)+1));
    aa(aa<1)=1;
    aa(aa>length(cmap))=length(cmap);
    b=cmap(aa,:);
    b=reshape(b,nx,ny,3);     
elseif strcmp(method,'index')
    aa(aa==0)=1;
    b=cmap(abs(aa),:);
    b=reshape(b,nx,ny,3);
else
    error('mapscan unknown rgb method')
end

end

