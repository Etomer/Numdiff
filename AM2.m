function yn=AM2(f,timeStep,y,Fo,ToL,max)
it=0;
yLast=10000;
ynew=y;

while abs(ynew-yLast)>ToL
    %bara f?r att se till att den inte totalkrashar datorn och
    %programmet...
    if it<max


        yLast=ynew;

        ynew = y + timeStep.*(f(yLast)+Fo(:,end))./2;


    end
    
    if it==max
        break
    end
    it=it+1;
end

yn=ynew;

end
