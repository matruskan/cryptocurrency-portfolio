module ApplicationHelper
    def active_if(options)
        if params.merge(options) == params
            'nav-active'
        end
    end
end
