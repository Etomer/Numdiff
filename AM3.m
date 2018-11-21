function yn=AM3(f,timeStep,y,Fo,ToL,max)
%Fo ar en vektor med de n-1 sista funktionsutvecklingarna
%Med iterativ del...
it=0;
yLast=1;
ynew=12;

while abs(ynew-yLast)<ToL
    %bara for att se till att den inte totalkrashar datorn och
    %programmet...
    if it<max


        yLast=ynew;

        ynew = yLast + timeStep.*(5./12.*f(yLast)+2./3.*Fo(end)-1./12.*Fo(end-1));


    end
    
    if it==max
        break
    end
    it=it+1;
end

yn=ynew;

end
