with System; use System;

package EFD is

    protected Station is
    pragma Priority(System.Priority'First + 5);
    private 
        signals

    end Station;
    
    procedure idle;
   
    protected Protections
    end Protections;

    task Route is
    end Route;

    task ScapeMaterial is
    end ScapeMaterial;

    task Display is 
        -- pragma Priority(System.Priority'First + 1);
    end Display;
end EFD;
