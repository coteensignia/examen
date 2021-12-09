class ApplicationController < ActionController::Base
    def after_sign_in_path_for(usuario)
        edificios_path
        
    end

    def after_sign_out(usuario)
        session_path
    end

    
end
