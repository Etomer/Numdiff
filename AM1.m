function yn=AM1(f,timeStep,y,Fo,ToL,max)
it=0;
yLast=1;
ynew=12;

while abs(ynew-yLast)<ToL
    %bara f?r att se till att den inte totalkrashar datorn och
    %programmet...
    if it<max


        yLast=ynew;

        ynew = yLast + timeStep.*f(yLast);


    end
    
    if it==max
        break
    end
    it=it+1;
end

yn=ynew;

end
