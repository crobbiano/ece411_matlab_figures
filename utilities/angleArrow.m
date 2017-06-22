%% helper function
function angleArrow(tx,ty,thet,c,scale)
x=scale*[-0.75 1 -0.75];
y=scale*.5*[-1 0 1];
pts=[ cos(thet) -sin(thet) tx;
    sin(thet)  cos(thet) ty;
    0 0 1;]*[x; y; ones(size(x))];
x=pts(1,:);  y=pts(2,:);
patch(x,y,c,'EdgeColor',c,'FaceAlpha',0.5,'EdgeAlpha',0.5);