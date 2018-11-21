function [t,y] = main(f, h, t0, tend, y0, tol)
    
    %Create time and functionvalue vectors
    t = t0:h:tend;
    y = zeros(size(t));
    
    % Initialvalues
    y(1) = y0;
    
    y(2) = PredCorrProtocol(f,t(1),y(1),h,tol,1);
    y(3) = PredCorrProtocol(f,t(1:2),y(1:2),h,tol,2);
    
    for(i = t(4:end))
        y(i) = PredCorrProtocol(f,t(i-3),y(1),h,tol,3);
    end
    


end

