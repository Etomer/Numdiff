function yn=AM1(f,timeStep,y,Fo,k)

yn = y + timeStep.*f(y);

end
