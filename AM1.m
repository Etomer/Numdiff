function yn=AM1(f,timeStep,y,Fo,ToL,max)
it=0;
yLast=12;
ynew=y;

while abs(ynew-yLast)>ToL
    %bara f?r att se till att den inte totalkrashar datorn och
    %programmet...
    if it<max


        yLast=ynew;

        ynew = y + timeStep.*f(ynew)


    end
    
    if it==max
        break
    end
    it=it+1;
end

yn=ynew;

end
